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

INSERT INTO book_loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
	(6, 3, 1, '12/02/2018', '12/23/2019'),
	(12, 3, 1, '12/02/2018', '12/23/2019'),
	(14, 3, 1, '12/07/2018', '12/21/2019'),
	(2, 1, 1, '12/10/2018', '12/31/2019'),
	(1, 3, 1, '12/11/2018', '01/02/2019'),
	(18, 3, 1, '12/11/2018', '01/02/2019'),
	(5, 2, 2, '12/02/2018', '12/23/2019'),
	(10, 2, 2, '12/11/2018', '01/02/2019'),
	(6, 1, 3, '12/11/2018', '01/02/2019'),
	(21, 1, 3, '12/11/2018', '01/02/2019'),
	(2, 4, 4, '11/29/2018', '12/20/2018'),
	(6, 4, 4, '11/29/2018', '12/20/2018'),
	(17, 4, 4, '12/01/2018', '12/21/2018'),
	(18, 4, 4, '12/01/2018', '12/21/2018'),
	(19, 4, 4, '12/02/2018', '12/22/2018'),
	(20, 4, 4, '12/02/2018', '12/22/2018'),
	(1, 3, 5, '12/02/2018', '12/23/2019'),
	(3, 3, 5, '12/02/2018', '12/23/2019'),
	(12, 3, 5, '12/02/2018', '12/23/2019'),
	(20, 3, 5, '12/07/2018', '12/21/2019'),
	(10, 2, 5, '12/08/2018', '12/22/2019'),
	(14, 3, 5, '12/11/2018', '01/02/2019'),
	(15, 3, 5, '12/11/2018', '01/02/2019'),
	(17, 3, 5, '12/11/2018', '01/02/2019'),
	(10, 2, 6, '12/11/2018', '01/02/2019'),
	(12, 1, 6, '12/11/2018', '01/02/2019'),
	(2, 4, 6, '11/29/2018', '12/20/2018'),
	(6, 4, 6, '11/29/2018', '12/20/2018'),
	(17, 4, 6, '12/01/2018', '12/21/2018'),
	(1, 3, 6, '12/02/2018', '12/23/2019'),
	(3, 3, 6, '12/02/2018', '12/23/2019'),
	(17, 4, 7, '12/01/2018', '12/21/2018'),
	(18, 4, 7, '12/01/2018', '12/21/2018'),
	(19, 4, 7, '12/02/2018', '12/22/2018'),
	(2, 4, 7, '12/02/2018', '12/23/2019'),
	(6, 4, 7, '12/02/2018', '12/23/2019'),
	(14, 4, 7, '12/02/2018', '12/23/2019'),
	(10, 2, 7, '12/08/2018', '12/22/2019'),
	(16, 4, 7, '12/11/2018', '01/02/2019'),
	(20, 4, 7, '12/11/2018', '01/02/2019'),
	(11, 2, 8, '11/20/2018', '12/11/2018'),
	(13, 2, 8, '11/20/2018', '12/11/2018'),
	(15, 2, 8, '11/20/2018', '12/11/2018'),
	(16, 2, 8, '11/20/2018', '12/11/2018'),
	(17, 2, 8, '11/21/2018', '12/12/2018'),
	(20, 2, 8, '11/21/2018', '12/12/2018'),
	(2, 4, 8, '11/20/2018', '12/11/2018'),
	(3, 2, 8, '12/11/2018', '01/02/2019'),
	(5, 2, 8, '12/11/2018', '01/02/2019'),
	(7, 2, 8, '12/11/2018', '01/02/2019')
;

INSERT INTO borrower
	(Name, Address, Phone)
VALUES
	('Gregory Alan Isakov', '2020 Evening Machines Way', '(503) 246-8345'),
	('Florence Leontine Mary Welch', '100 Ceremonials St', '(503) 285-3451'),
	('Rufus Wainwright', '3984 Poses Ct', '(971) 230-2231'), 
	('Antony Hegarty', '50 Swanlights Way', '(503) 231-1100'),
	('Ben Schneider', '482 Strange Tails Ave', '(503) 187-2012'),
	('Myra Ellen Amos', '1990 Little Earthquakes Ct', '(971) 808-1299'),
	('Björk Guðmundsdóttir', '314 Vespertine St', '(503) 245-1960'),
	('Thom Yorke', '710 The Bends Ave', '(503) 232-3451'),
	('Stacy King', '99 Eisley Rd', '(503) 449-1222')
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