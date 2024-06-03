-- check book amount
CREATE TABLE MessageQueue (
    MessageID INT IDENTITY(1,1) PRIMARY KEY,
    MessageType VARCHAR(50),
    MessageContent VARCHAR(MAX),
    SentDateTime DATETIME DEFAULT GETDATE(),
    Sent BIT DEFAULT 0
);

CREATE TRIGGER BookAmountCheckTrigger
ON BorrowTicketData
AFTER INSERT
AS
BEGIN
    DECLARE @BookID INT;
    DECLARE @BookTitle VARCHAR(100);
    DECLARE @BookQuantity INT;

    SELECT @BookID = BookID
    FROM inserted i
    INNER JOIN BookItem bi ON i.BookItemID = bi.BookItemID
    INNER JOIN Books b ON bi.BookID = b.BookID;

    SELECT @BookTitle = Title
    FROM Books
    WHERE BookID = @BookID;

    -- send message about book being borrowed
    INSERT INTO MessageQueue (MessageType, MessageContent)
    VALUES ('BookBorrowed', 'A book has been borrowed. Title: ' + @BookTitle + ', ID: ' + CAST(@BookID AS VARCHAR(10)));

    SELECT @BookQuantity = COUNT(*)
    FROM BookItem
    WHERE BookID = @BookID;

    -- check if the quantity of borrowed book is < 10
    IF @BookQuantity < 10
    BEGIN
        INSERT INTO MessageQueue (MessageType, MessageContent)
        VALUES ('LowStock', 'The book ' + @BookTitle + ' (ID: ' + CAST(@BookID AS VARCHAR(10)) + ') needs to be restocked.');
    END
END;

-- borrow history
CREATE TABLE BorrowHistory (
    BorrowHistoryID INT IDENTITY(1,1) PRIMARY KEY,
    TicketID INT NOT NULL FOREIGN KEY (TicketID) REFERENCES BorrowTicket(TicketID),
    BookItemID INT NOT NULL FOREIGN KEY (BookItemID) REFERENCES BookItem(BookItemID),
    BorrowDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    Status VARCHAR(10),
    Fine INT
);

CREATE TRIGGER UpdateBorrowHistoryTrigger
ON BorrowTicketData
AFTER UPDATE
AS
BEGIN
    DECLARE @TicketID INT;
    DECLARE @BookItemID INT;
    DECLARE @BorrowDate DATE;
    DECLARE @DueDate DATE;
    DECLARE @ReturnDate DATE;
    DECLARE @Status VARCHAR(10);
    DECLARE @Fine INT;

    SELECT @TicketID = TicketID,
           @BookItemID = BookItemID,
           @BorrowDate = CONVERT(DATE, LendDate),
           @DueDate = CONVERT(DATE, DueDate),
           @ReturnDate = CONVERT(DATE, ReturnDate),
           @Status = Status,
           @Fine = Fine
    FROM inserted;

    IF UPDATE(ReturnDate) AND @ReturnDate IS NOT NULL
    BEGIN
        INSERT INTO BorrowHistory (TicketID, BookItemID, BorrowDate, DueDate, ReturnDate, Status, Fine)
        VALUES (@TicketID, @BookItemID, @BorrowDate, @DueDate, @ReturnDate, @Status, @Fine);
    END
END;

-- auto renew card
CREATE TABLE Card(
    CardID INT PRIMARY KEY NOT NULL,
    ReaderID INT NOT NULL FOREIGN KEY REFERENCES Readers(ReaderID),
    AssignDate VARCHAR(10),
    ExpirationDate VARCHAR(10)
);

CREATE TRIGGER ExtendCardExpirationTrigger
ON Card
AFTER UPDATE
AS
BEGIN
    DECLARE @ReaderID INT;
    DECLARE @ExpirationDate DATE;
    DECLARE @AssignDate DATE;
    DECLARE @AutoUpdate BIT;

    SELECT @ReaderID = ReaderID,
           @ExpirationDate = ExpirationDate,
           @AssignDate = CONVERT(DATE, AssignDate),
           @AutoUpdate = AutoUpdate
    FROM inserted;

    DECLARE @DaysToExpiration INT;
    SET @DaysToExpiration = DATEDIFF(DAY, GETDATE(), @ExpirationDate);

    IF @DaysToExpiration = 3 AND @AutoUpdate = 1
    BEGIN
        DECLARE @NewExpirationDate DATE;
        SET @NewExpirationDate = DATEADD(DAY, 30, @ExpirationDate); -- extend expiration date by 30 days

        -- update expiration date
        UPDATE Card
        SET ExpirationDate = @NewExpirationDate
        WHERE ReaderID = @ReaderID;
    END
END;

-- late return
CREATE TRIGGER LateReturnTrigger
ON BorrowTicketData
AFTER UPDATE
AS
BEGIN
    IF UPDATE(ReturnDate)
    BEGIN
        DECLARE @TicketID INT;
        DECLARE @ReturnDate DATE;
        DECLARE @DueDate DATE;
        DECLARE @ReaderID INT;
        DECLARE @BookTitle VARCHAR(100);
        DECLARE @LibrarianFullName VARCHAR(50);

        SELECT @TicketID = TicketID,
               @ReturnDate = CONVERT(DATE, ReturnDate),
               @DueDate = CONVERT(DATE, DueDate)
        FROM inserted;

        -- check if late
        IF @ReturnDate > @DueDate
        BEGIN
            SELECT @ReaderID = ReaderID
            FROM BorrowTicket
            WHERE TicketID = @TicketID;

            SELECT @BookTitle = Title
            FROM Books
            WHERE BookID = (SELECT BookID FROM BorrowTicketData WHERE TicketID = @TicketID);

            SELECT @LibrarianFullName = FullName
            FROM Librarians
            WHERE LibrarianID = (SELECT LibrarianID FROM BorrowTicket WHERE TicketID = @TicketID);

            -- send message to librarian
            INSERT INTO MessageQueue (MessageType, MessageContent)
            VALUES ('LateReturn', 'The book "' + @BookTitle + '" has been returned late by ReaderID: ' + CAST(@ReaderID AS VARCHAR(10)) + '. Please follow up.');

            -- send message to reader
            INSERT INTO MessageQueue (MessageType, MessageContent)
            VALUES ('LateReturn', 'You have returned the book "' + @BookTitle + '" late. Please ensure to return books on time to avoid fines.');
        END
    END
END;

-- check the insert data for publisher table
CREATE TRIGGER CheckPublisherInsertDataTrigger
ON Publisher
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Publisher p INNER JOIN inserted i ON p.PublisherID = i.PublisherID)
    BEGIN
        RAISERROR ('PublisherID must be unique.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM inserted WHERE PublisherName IS NULL)
    BEGIN
        RAISERROR ('PublisherName cannot be NULL.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM inserted WHERE PublicationDate IS NULL)
    BEGIN
        RAISERROR ('PublicationDate cannot be NULL.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM inserted WHERE ISDATE(PublicationDate) = 0)
    BEGIN
        RAISERROR ('PublicationDate must be a valid date.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Insert valid data into Publisher table
    INSERT INTO Publisher (PublisherID, PublisherName, PublicationDate)
    SELECT PublisherID, PublisherName, PublicationDate
    FROM inserted;
END;

-- limit borrow amount
CREATE TRIGGER LimitBorrowAmountTrigger
ON BorrowTicket
AFTER INSERT
AS
BEGIN
    DECLARE @ReaderID INT;
    DECLARE @BorrowedBooksCount INT;

    SELECT @ReaderID = ReaderID
    FROM inserted;

    -- count number of books borrowed by reader
    SELECT @BorrowedBooksCount = COUNT(*)
    FROM BorrowTicketData BTD
    JOIN BorrowTicket BT ON BTD.TicketID = BT.TicketID
    JOIN inserted I ON BT.ReaderID = I.ReaderID
    WHERE BT.ReaderID = @ReaderID;

    -- limit book borrow amount to 15
    IF @BorrowedBooksCount > 15
    BEGIN
        INSERT INTO MessageQueue (MessageType, MessageContent)
        VALUES ('BorrowLimitExceeded', 'You have reached the maximum limit of borrowed books (15). Please return some books to borrow new ones.');
    END
END;

-- auto calculate fine amount
CREATE TRIGGER CalculateFineTrigger
ON BorrowTicketData
AFTER UPDATE
AS
BEGIN
    DECLARE @TicketID INT;
    DECLARE @ReturnDate DATE;
    DECLARE @DueDate DATE;
    DECLARE @Fine INT;

    -- retrieve data for returned book
    SELECT @TicketID = TicketID,
           @ReturnDate = CONVERT(DATE, ReturnDate),
           @DueDate = CONVERT(DATE, DueDate)
    FROM inserted;

    -- calculate number of late days
    DECLARE @LateDays INT;
    SET @LateDays = DATEDIFF(DAY, @DueDate, @ReturnDate);

    -- calculate fine amount for each late day
    SET @Fine = @LateDays * 1000;

    UPDATE BorrowTicketData
    SET Fine = @Fine
    WHERE TicketID = @TicketID;
END;

-- check reader data
CREATE TRIGGER CheckReaderInsertDataTrigger
ON Readers
AFTER INSERT
AS
BEGIN
    DECLARE @Email VARCHAR(30);
    DECLARE @FullName VARCHAR(50);
    DECLARE @Address VARCHAR(100);
    DECLARE @Phone VARCHAR(10);

    SELECT @Email = Email,
           @FullName = FullName,
           @Address = Address,
           @Phone = Phone
    FROM inserted;

    -- check if email is in valid format
    IF @Email IS NOT NULL AND @Email NOT LIKE '%@%.%' AND @Email NOT LIKE '%@%'
    BEGIN
        RAISERROR ('Invalid email address format.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF @FullName IS NULL OR @FullName = ''
    BEGIN
        RAISERROR ('Full name cannot be empty.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF @Phone IS NOT NULL AND LEN(@Phone) <> 10
    BEGIN
        RAISERROR ('Invalid phone number format.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
