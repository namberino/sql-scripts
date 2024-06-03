create table Publisher(
	PublisherID int primary key not null,
	PublisherName varchar(50),
	PublicationDate int
);

create table Category(
    CategoryID int primary key,
    CategoryName varchar(50),
    AllowedBorrowDate int,
);

create table Books(
    BookID int primary key not null,
    CategoryID int foreign key references Category(CategoryID),
    Title varchar(100),
    Author varchar(100),
	PublisherID int foreign key references Publisher(PublisherID)
);

create table BookItem(
    BookItemID int primary key not null,
    BookID int not null foreign key references Books(BookID),
);

create table Readers(
    ReaderID int primary key not null,
    FullName varchar(50) not null,
    Address varchar(100),
    Email varchar(30) default null,
    Phone varchar(10)
);

create table Librarians(
    LibrarianID int primary key not null,
    FullName varchar(50) not null,
    Salary int not null,
    StartDate varchar(10) not null
);

create table BorrowTicket(
    TicketID int primary key not null,
    ReaderID int not null foreign key references Readers(ReaderID),
    LendDate varchar(10),
	LibrarianID int not null foreign key references Librarians(LibrarianID)
);

create table BorrowTicketData(
    TicketID int not null foreign key references BorrowTicket(TicketID),
    BookItemID int not null foreign key references BookItem(BookItemID),
    DueDate varchar(10),
    ReturnData varchar(10),
	Status varchar(10),
    Fine int
);

create table Card(
    CardID int primary key not null,
    ReaderID int not null foreign key references Readers(ReaderID),
    AssignDate varchar(10),
    ExpirationDate varchar(10)
);
