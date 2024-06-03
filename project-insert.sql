-- Insert data into Publisher table
insert into Publisher (PublisherID, PublisherName, PublicationDate)
values
    (1234, 'Penguin Books', 20010101),
    (2345, 'HarperCollins Publishers', 19991231),
    (3456, 'Random House', 20051215),
    (4567, 'Simon & Schuster', 20080820),
    (5678, 'Macmillan Publishers', 20130310),
    (6789, 'Hachette Livre', 20190605),
    (7890, 'Scholastic Corporation', 20200425),
    (8901, 'Pearson plc', 20161230),
    (9012, 'Oxford University Press', 20120712),
    (1023, 'Cambridge University Press', 20041018),
    (2134, 'Bloomsbury Publishing', 20111205),
    (3245, 'Houghton Mifflin Harcourt', 20091030),
    (4356, 'Wiley', 20140812),
    (5467, 'Penguin Random House', 20151022),
    (6578, 'McGraw-Hill Education', 20031228),
    (7689, 'HarperCollins', 20110815),
    (8790, 'Faber & Faber', 20170209),
    (9801, 'Little, Brown and Company', 20100417),
    (1112, 'Viking Press', 20080831),
    (2223, 'Pantheon Books', 20121120);

-- Insert data into Category table
insert into Category (CategoryID, CategoryName, AllowedBorrowDate)
values
    (1001, 'Fiction', 14),
    (1002, 'Non-fiction', 21),
    (1003, 'Science Fiction', 14),
    (1004, 'Fantasy', 14),
    (1005, 'Mystery', 14),
    (1006, 'Romance', 14),
    (1007, 'Biography', 21),
    (1008, 'History', 21),
    (1009, 'Thriller', 14),
    (1010, 'Horror', 14),
    (1011, 'Self-help', 21),
    (1012, 'Cookbooks', 21),
    (1013, 'Poetry', 14),
    (1014, 'Drama', 14),
    (1015, 'Comics', 14),
    (1016, 'Art', 21),
    (1017, 'Travel', 21),
    (1018, 'Science', 21),
    (1019, 'Children', 14),
    (1020, 'Young Adult', 14);

-- Insert data into Books table
insert into Books (BookID, CategoryID, Title, Author, PublisherID)
values
    (1111, 1001, 'To Kill a Mockingbird', 'Harper Lee', 1234),
    (2222, 1002, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 2345),
    (3333, 1003, 'Dune', 'Frank Herbert', 3456),
    (4444, 1004, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 4567),
    (5555, 1005, 'The Da Vinci Code', 'Dan Brown', 5678),
    (6666, 1006, 'Pride and Prejudice', 'Jane Austen', 6789),
    (7777, 1007, 'Steve Jobs', 'Walter Isaacson', 7890),
    (8888, 1008, 'A Brief History of Time', 'Stephen Hawking', 8901),
    (9999, 1009, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 9012),
    (1010, 1010, 'It', 'Stephen King', 1023),
    (1121, 1011, 'The 7 Habits of Highly Effective People', 'Stephen R. Covey', 2134),
    (2232, 1012, 'The Joy of Cooking', 'Irma S. Rombauer', 3245),
    (3343, 1013, 'Milk and Honey', 'Rupi Kaur', 4356),
    (4454, 1014, 'Hamlet', 'William Shakespeare', 5467),
    (5565, 1015, 'Watchmen', 'Alan Moore', 6578),
    (6676, 1016, 'The Art of War', 'Sun Tzu', 7689),
    (7787, 1017, 'Into the Wild', 'Jon Krakauer', 8790),
    (8898, 1018, 'A Brief History of Nearly Everything', 'Bill Bryson', 9801),
    (9909, 1019, 'Where the Wild Things Are', 'Maurice Sendak', 1112),
    (1001, 1020, 'The Hunger Games', 'Suzanne Collins', 2223);

-- Insert data into BookItem table
insert into BookItem (BookItemID, BookID)
values
    (1234, 1111),
    (2345, 2222),
    (3456, 3333),
    (4567, 4444),
    (5678, 5555),
    (6789, 6666),
    (7890, 7777),
    (8901, 8888),
    (9012, 9999),
    (1023, 1010),
    (2134, 1121),
    (3245, 2232),
    (4356, 3343),
    (5467, 4454),
    (6578, 5565),
    (7689, 6676),
    (8790, 7787),
    (9801, 8898),
    (1112, 9909),
    (2223, 1001);

-- Insert data into Readers table
insert into Readers (ReaderID, FullName, Address, Email, Phone)
values
    (1111, 'John Doe', '123 Main St, City', 'john.doe@example.com', '1234567890'),
    (2222, 'Jane Smith', '456 Elm St, Town', 'jane.smith@example.com', '0987654321'),
    (3333, 'Alice Johnson', '789 Oak St, Village', 'alice.johnson@example.com', '1357924680'),
    (4444, 'Bob Williams', '321 Maple St, Countryside', 'bob.williams@example.com', '9876543210'),
    (5555, 'Emily Brown', '654 Pine St, Suburb', 'emily.brown@example.com', '0123456789'),
    (6666, 'Michael Wilson', '987 Cedar St, Hamlet', 'michael.wilson@example.com', '2468013579'),
    (7777, 'Sophia Garcia', '159 Birch St, Borough', 'sophia.garcia@example.com', '3692581470'),
    (8888, 'Matthew Martinez', '753 Spruce St, District', 'matthew.martinez@example.com', '5824691370'),
    (9999, 'Olivia Rodriguez', '258 Cherry St, Precinct', 'olivia.rodriguez@example.com', '1470369258'),
    (1010, 'William Lee', '852 Walnut St, Domain', 'william.lee@example.com', '3691472580'),
    (1121, 'Emma Walker', '369 Pineapple St, Region', 'emma.walker@example.com', '2581470369'),
    (2232, 'James Wright', '147 Orange St, Territory', 'james.wright@example.com', '0369258147'),
    (3343, 'Ava King', '258 Banana St, Sector', 'ava.king@example.com', '1470369258'),
    (4454, 'Alexander Scott', '369 Mango St, Zone', 'alexander.scott@example.com', '2581470369'),
    (5565, 'Charlotte Green', '147 Papaya St, Belt', 'charlotte.green@example.com', '0369258147'),
    (6676, 'Daniel Hall', '258 Kiwi St, Block', 'daniel.hall@example.com', '1470369258'),
    (7787, 'Isabella Young', '369 Lemon St, Cluster', 'isabella.young@example.com', '2581470369'),
    (8898, 'Ethan Allen', '147 Lime St, Group', 'ethan.allen@example.com', '0369258147'),
    (9909, 'Mia Hernandez', '258 Avocado St, Alliance', 'mia.hernandez@example.com', '1470369258'),
    (1001, 'Jacob Morris', '369 Pear St, Coalition', 'jacob.morris@example.com', '2581470369');

-- Insert data into BorrowTicket table
insert into BorrowTicket (TicketID, ReaderID, LendDate, LibrarianID)
values
    (1234, 1111, '2024-04-20', 1111),
    (2345, 2222, '2024-04-21', 2222),
    (3456, 3333, '2024-04-22', 3333),
    (4567, 4444, '2024-04-23', 4444),
    (5678, 5555, '2024-04-24', 5555),
    (6789, 6666, '2024-04-25', 6666),
    (7890, 7777, '2024-04-26', 7777),
    (8901, 8888, '2024-04-27', 8888),
    (9012, 9999, '2024-04-28', 9999),
    (1023, 1010, '2024-04-29', 1010),
    (2134, 1121, '2024-04-30', 1121),
    (3245, 2232, '2024-05-01', 2232),
    (4356, 3343, '2024-05-02', 3343),
    (5467, 4454, '2024-05-03', 4454),
    (6578, 5565, '2024-05-04', 5565),
    (7689, 6676, '2024-05-05', 6676),
    (8790, 7787, '2024-05-06', 7787),
    (9801, 8898, '2024-05-07', 8898),
    (1112, 9909, '2024-05-08', 9909),
    (2223, 1001, '2024-05-09', 1001);

-- Insert data into BorrowTicketData table
insert into BorrowTicketData (TicketID, BookItemID, DueDate, ReturnDate, Fine)
values
    (1234, 1234, '2024-05-04', '2024-04-23', 20),
    (2345, 2345, '2024-05-05', '2024-04-20', 10),
    (3456, 3456, '2024-05-06', '2024-04-25', 0),
    (4567, 4567, '2024-05-07', '2024-04-18', 0),
    (5678, 5678, '2024-05-08', '2024-04-21', 30),
    (6789, 6789, '2024-05-09', '2024-04-24', 0),
    (7890, 7890, '2024-05-10', '2024-04-22', 0),
    (8901, 8901, '2024-05-11', '2024-04-19', 20),
    (9012, 9012, '2024-05-12', '2024-04-26', 0),
    (1023, 1023, '2024-05-13', '2024-04-27', 30),
    (2134, 2134, '2024-05-14', '2024-04-28', 0),
    (3245, 3245, '2024-05-15', '2024-04-29', 20),
    (4356, 4356, '2024-05-16', '2024-04-30', 0),
    (5467, 5467, '2024-05-17', '2024-05-01', 0),
    (6578, 6578, '2024-05-18', '2024-05-02', 0),
    (7689, 7689, '2024-05-19', '2024-05-03', 0),
    (8790, 8790, '2024-05-20', '2024-05-04', 30),
    (9801, 9801, '2024-05-21', '2024-05-05', 20),
    (1112, 1112, '2024-05-22', '2024-05-06', 0),
    (2223, 2223, '2024-05-23', '2024-05-07', 0);

-- Insert data into Librarians table
insert into Librarians (LibrarianID, FullName, Salary, StartDate)
values
    (1111, 'David Johnson', 50000, '2020-01-01'),
    (2222, 'Sarah Williams', 52000, '2020-02-01'),
    (3333, 'James Brown', 54000, '2020-03-01'),
    (4444, 'Emily Jones', 56000, '2020-04-01'),
    (5555, 'Michael Davis', 58000, '2020-05-01'),
    (6666, 'Jessica Miller', 60000, '2020-06-01'),
    (7777, 'Daniel Wilson', 62000, '2020-07-01'),
    (8888, 'Linda Taylor', 64000, '2020-08-01'),
    (9999, 'Christopher Anderson', 66000, '2020-09-01'),
    (1010, 'Amanda Thomas', 68000, '2020-10-01'),
    (1121, 'Matthew Jackson', 70000, '2020-11-01'),
    (2232, 'Samantha White', 72000, '2020-12-01'),
    (3343, 'Andrew Harris', 74000, '2021-01-01'),
    (4454, 'Elizabeth Martin', 76000, '2021-02-01'),
    (5565, 'Ryan Thompson', 78000, '2021-03-01'),
    (6676, 'Stephanie Garcia', 80000, '2021-04-01'),
    (7787, 'Kevin Martinez', 82000, '2021-05-01'),
    (8898, 'Rachel Robinson', 84000, '2021-06-01'),
    (9909, 'Brian Clark', 86000, '2021-07-01'),
    (1001, 'Nicole Rodriguez', 88000, '2021-08-01');

-- Insert data into Card table
insert into Card (CardID, ReaderID, AssignDate, ExpirationDate)
values
    (1234, 1111, '2024-04-20', '2025-04-20'),
    (2345, 2222, '2024-04-21', '2025-04-21'),
    (3456, 3333, '2024-04-22', '2025-04-22'),
    (4567, 4444, '2024-04-23', '2025-04-23'),
    (5678, 5555, '2024-04-24', '2025-04-24'),
    (6789, 6666, '2024-04-25', '2025-04-25'),
    (7890, 7777, '2024-04-26', '2025-04-26'),
    (8901, 8888, '2024-04-27', '2025-04-27'),
    (9012, 9999, '2024-04-28', '2025-04-28'),
    (1023, 1010, '2024-04-29', '2025-04-29'),
    (2134, 1121, '2024-04-30', '2025-04-30'),
    (3245, 2232, '2024-05-01', '2025-05-01'),
    (4356, 3343, '2024-05-02', '2025-05-02'),
    (5467, 4454, '2024-05-03', '2025-05-03'),
    (6578, 5565, '2024-05-04', '2025-05-04'),
    (7689, 6676, '2024-05-05', '2025-05-05'),
    (8790, 7787, '2024-05-06', '2025-05-06'),
    (9801, 8898, '2024-05-07', '2025-05-07'),
    (1112, 9909, '2024-05-08', '2025-05-08'),
    (2223, 1001, '2024-05-09', '2025-05-09');
