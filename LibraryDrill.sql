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
	BookID INT PRIMARY KEY NOT NULL,
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



/* Select statements */

SELECT * FROM library_branch;