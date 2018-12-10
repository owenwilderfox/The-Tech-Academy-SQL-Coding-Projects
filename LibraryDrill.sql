/* Create and use database  */

-- CREATE DATABASE db_library

USE db_library
GO

/* Create tables for database */

CREATE TABLE library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL
);

CREATE TABLE book_authors (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE book_copies (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchID INT NOT NULL,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE book_loans (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchID INT NOT NULL,
	CardNo INT NOT NULL,
	DateOut VARCHAR(50) NOT NULL,
	DateDue VARCHAR(50) NOT NULL
);

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50),
	Phone VARCHAR(50)
);


/* Insert data into tables for database */

INSERT INTO library_branch
	(BranchName, Address)
VALUES
	('Central', '45 East Louisa St'),
	('Sharpstown', '1000 Yawning Grave Ave'),
	('Huron', '604 Frozen Pines Ln'),
	('River', '232 Emerald Star St')
;

INSERT INTO publisher
	(PublisherName, Address, Phone)
VALUES
	('Lonesome Dreams', '123 Lord Huron Dr', '(503) 234-5677'),
	('Vide Noir', '203 Michigan St', '(503) 123-3245'),
	('A Walk In The Woods', '1245 Moonbeam Ave', '(971) 232-1100')
;

INSERT INTO books
	(Title, PublisherName)
VALUES
	('Ends of the Earth', 'Lonesome Dreams'),
	('Time to Run', 'Lonesome Dreams'),
	('The Ghost on the Shore', 'Lonesome Dreams'),
	('She Lit a Fire', 'Lonesome Dreams'),
	('Lullaby', 'Lonesome Dreams'),
	('Brother', 'Lonesome Dreams'),
	('In the Wind', 'Lonesome Dreams'),
	('Dead End Street', 'A Walk In The Woods'),
	('Kissed Me Like Thunder', 'A Walk In The Woods'),
	('So Many Stars', 'A Walk In The Woods'),
	('The Birds Are Singing At Night', 'A Walk In The Woods'),
	('Lost in Time and Space', 'Vide Noir'),
	('Never Ever', 'Vide Noir'),
	('Ancient Names (Part I)', 'Vide Noir'),
	('Ancient Names (Part II)', 'Vide Noir'),
	('When the Night is Over', 'Vide Noir'),
	('Wait By the River', 'Vide Noir'),
	('Secret of Life', 'Vide Noir'),
	('Moonbeam', 'Vide Noir'),
	('Emerald Star', 'Vide Noir'),
	('The Lost Tribe', 'Vide Noir')
;

INSERT INTO book_authors
	(AuthorName)
VALUES
	('Casey Briar'),
	('Hilary Kendall'),
	('Cyan Sydney'),
	('Lucrece London'),
	('Sunny Temple'),
	('Sequoia Emerson'),
	('Florence Sage'),
	('Leigh Rowan'),
	('Zarathustra Arkadios'),
	('Isidor Jirou'),
	('Brook Dawson Diggory'),
	('Stephen King'),
	('Casey Briar'),
	('Hilary Kendall'),
	('Hilary Kendall'),
	('Lucrece London'),
	('Sunny Temple'),
	('Sequoia Emerson'),
	('Florence Sage'),
	('Leigh Rowan'),
	('Stephen King')
;

INSERT INTO book_copies
	(BranchID, Number_of_Copies)
VALUES
	(

/* Select statements */

SELECT * FROM library_branch;
SELECT * FROM publisher;
SELECT * FROM books;
SELECT * FROM book_authors;

/* Miscellanious statements to delete later */

DROP TABLE book_authors;
DROP TABLE books;