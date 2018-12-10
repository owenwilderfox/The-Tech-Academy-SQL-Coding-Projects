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
	BookID INT NOT NULL,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE book_copies (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE book_loans (
	BookID INT NOT NULL,
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
	(BookID, AuthorName)
VALUES
	(1, 'Casey Briar'),
	(2, 'Hilary Kendall'),
	(3, 'Cyan Sydney'),
	(4, 'Lucrece London'),
	(5, 'Sunny Temple'),
	(6, 'Sequoia Emerson'),
	(7, 'Florence Sage'),
	(8, 'Leigh Rowan'),
	(9, 'Zarathustra Arkadios'),
	(10, 'Isidor Jirou'),
	(11, 'Brook Dawson Diggory'),
	(12, 'Stephen King'),
	(13, 'Casey Briar'),
	(14, 'Hilary Kendall'),
	(15, 'Hilary Kendall'),
	(16, 'Lucrece London'),
	(17, 'Sunny Temple'),
	(18, 'Sequoia Emerson'),
	(19, 'Florence Sage'),
	(20, 'Leigh Rowan'),
	(21, 'Stephen King')
;

INSERT INTO book_copies
	(BookID, BranchID, Number_of_Copies)
VALUES
	(1, 1, 3),
	(2, 1, 3),
	(4, 1, 3),
	(6, 1, 5),
	(12, 1, 4),
	(14, 1, 2),
	(18, 1, 2),
	(19, 1, 3),
	(20, 1, 4),
	(21, 1, 2),
	(3, 2, 2),
	(5, 2, 3),
	(7, 2, 2),
	(10, 2, 2),
	(11, 2, 4),
	(13, 2, 2),
	(15, 2, 2),
	(16, 2, 4),
	(17, 2, 2),
	(1, 3, 2),
	(3, 3, 3),
	(9, 3, 2),
	(12, 3, 4),
	(14, 3, 4),
	(15, 3, 5),
	(17, 3, 2),
	(18, 3, 3),
	(19, 3, 2),
	(20, 3, 5),
	(2, 4, 2),
	(4, 4, 3),
	(6, 4, 2),
	(12, 4, 4),
	(14, 4, 4),
	(16, 4, 5),
	(17, 4, 2),
	(18, 4, 3),
	(19, 4, 2),
	(20, 4, 5)
;

/* Continue building book_loans and borrower */

/* Select statements */

SELECT * FROM library_branch;
SELECT * FROM publisher;
SELECT * FROM books;
SELECT * FROM book_authors;

/* Miscellanious statements to delete later */

DROP TABLE book_authors;
DROP TABLE books;