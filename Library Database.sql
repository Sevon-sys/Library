USE master
if exists (select * from sysdatabases where name='LibraryDB')
        alter database LibraryDB set single_user with rollback immediate
        drop database LibraryDB
GO
CREATE DATABASE LibraryDB;
GO

USE LibraryDB;

CREATE TABLE Author (
	id int PRIMARY KEY,
	[name] nvarchar(255) NOT NULL
	)

CREATE TABLE Department (
	id int PRIMARY KEY, 
	name nvarchar(255) NOT NULL
	)

CREATE TABLE Book (
	id int PRIMARY KEY,
	title nvarchar(255) NOT NULL,
	published datetime NOT NULL,
	author int FOREIGN KEY REFERENCES Author (id) NOT NULL,
	department int FOREIGN KEY REFERENCES Department(id) NOT NULL
	)

CREATE TABLE LibraryCard (
	id int PRIMARY KEY,
	[name] nvarchar(255) NOT NULL,
	[address] nvarchar(255),
	book int FOREIGN KEY REFERENCES Book(id),
	borrowDate datetime
	)

CREATE TABLE Librarian (
	id int PRIMARY KEY,
	[name] nvarchar(255) NOT NULL,
	phone nvarchar(13) NOT NULL
)

CREATE TABLE LibrarianDepartments (
	librarian int NOT NULL FOREIGN KEY REFERENCES Librarian(id),
	department int NOT NULL FOREIGN KEY REFERENCES Department(id),
	PRIMARY KEY (librarian, department)
	
)

INSERT INTO Author(id, [name])
values(1, 'J.R.R. Tolkien')
INSERT INTO Author(id, [name])
values(2, 'William Gibson')
INSERT INTO Author(id, [name])
values(3, 'Frank Herbert')
INSERT INTO Author(id, [name])
values(4, 'J.K. Rowling')
INSERT INTO Author(id, [name])
values(5, 'G.R.R. Martin')
INSERT INTO Author(id, [name])
values(6, 'Dan Brown')
INSERT INTO Author(id, [name])
values(7, 'Adam Adamsson')

INSERT INTO Department(id, [name])
values(1, 'Sci-fi')
INSERT INTO Department(id, [name])
values(2, 'Fantasy')
INSERT INTO Department(id, [name])
values(3, 'Novel')
INSERT INTO Department(id, [name])
values(4, 'Thriller')

INSERT INTO Book(id, title, published, author, department)
values (1, 'The Fellowship of the Ring', '1954-07-29', 1, 2)
INSERT INTO Book(id, title, published, author, department)
values (2, 'The Two Towers', '1954-11-11', 1, 2)
INSERT INTO Book(id, title, published, author, department)
values (3, 'The Return of the King', '1955-10-20', 1, 2)
INSERT INTO Book(id, title, published, author, department)
values (4, 'Neuromancer', '1984-07-01', 2, 1)
INSERT INTO Book(id, title, published, author, department)
values (5, 'Dune', '1965-08-01', 3, 1)
INSERT INTO Book(id, title, published, author, department)
values (6, 'Harry Potter and the Goblet of Fire', '2000-07-08', 4, 2)
INSERT INTO Book(id, title, published, author, department)
values (7, 'A Storm of Swords', '2000-08-08', 5, 2)
INSERT INTO Book(id, title, published, author, department)
values (8, 'Angels & Demons', '2000-05-01', 6, 4)
INSERT INTO Book(id, title, published, author, department)
values (9, 'Wolves and Humans', '2000-03-12', 7, 2)
INSERT INTO Book(id, title, published, author, department)
values (10, 'Wolves and Giants', '2012-04-20', 7, 2)
INSERT INTO Book(id, title, published, author, department)
values (11, 'Wolves and Wolves', '2020-03-03', 7, 2)


INSERT INTO LibraryCard(id, [name], address, book, borrowDate)
values (1, 'Emil Sevon', 'Folkkng. 49', 5, 2021-01-31)
INSERT INTO LibraryCard(id, [name], address, book, borrowDate)
values (2, 'Sven Svensson', 'Kan inte addresser i Örebro. 48', 1, 2021-01-01)
INSERT INTO LibraryCard(id, [name], address, book, borrowDate)
values (3, 'Lars Larsson', 'Samma som ovan. 33', 4, 2020-01-01)

INSERT INTO Librarian(id, [name], phone)
values (1, 'LeChuck', '071-11 22 123')
INSERT INTO Librarian(id, [name], phone)
values (2, 'Elaine Marley', '072-12 23 345')
INSERT INTO Librarian(id, [name], phone)
values (3, 'Guybrush Threepwood', '073-12 34 123')

INSERT INTO LibrarianDepartments (librarian, department)
values (1, 1)
INSERT INTO LibrarianDepartments (librarian, department)
values (1, 2)
INSERT INTO LibrarianDepartments (librarian, department)
values (2, 2)
INSERT INTO LibrarianDepartments (librarian, department)
values (3, 2)