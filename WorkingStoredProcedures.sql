/* 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

USE db_library
GO

CREATE PROCEDURE dbo.SelectBookLocation @Title nvarchar(100), @BranchName nvarchar(100)
AS
SELECT library_branch.BranchName AS 'Branch Name', books.Title AS 'Book Title', book_copies.Number_of_Copies AS 'Number of Copies'
FROM library_branch
INNER JOIN book_copies ON book_copies.BranchID = library_branch.BranchID
INNER JOIN books ON books.BookID = book_copies.BookID
WHERE books.Title LIKE @Title + '%'
AND library_branch.BranchName LIKE @BranchName + '%'
GO

EXEC dbo.SelectBookLocation @Title = 'The Lost Tribe', @BranchName = 'Sharpstown';

/* 2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch? */

USE db_library
GO

CREATE PROCEDURE dbo.SelectBookLocation @Title nvarchar(100), @BranchName nvarchar(100)
AS
SELECT library_branch.BranchName AS 'Branch Name', books.Title AS 'Book Title', book_copies.Number_of_Copies AS 'Number of Copies'
FROM library_branch
INNER JOIN book_copies ON book_copies.BranchID = library_branch.BranchID
INNER JOIN books ON books.BookID = book_copies.BookID
WHERE books.Title LIKE @Title + '%'
AND library_branch.BranchName LIKE @BranchName + '%'
GO

EXEC dbo.SelectBookLocation @Title = 'The Lost Tribe', @BranchName = '%';

/* 3.) Retrieve the names of all borrowers who do not have any books checked out. */
USE db_library
GO

CREATE PROCEDURE dbo.BorrowedBookCount @BookCount NVARCHAR(4)
AS
SELECT borrower.Name AS 'Patron Name', borrower.CardNo AS 'Library Card Number', COUNT(book_loans.CardNo) AS 'Borrowed Books'
FROM borrower
LEFT JOIN book_loans ON book_loans.CardNo = borrower.CardNo
GROUP BY borrower.Name, borrower.Address, borrower.Phone, borrower.CardNo
HAVING COUNT(book_loans.CardNo) LIKE @BookCount + '%'
GO

EXEC dbo.BorrowedBookCount @BookCount = 0;

/* 4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. */

USE db_library
GO

CREATE PROCEDURE dbo.DateDue @BranchName NVARCHAR(100), @DateDue NVARCHAR(100)
AS
SELECT library_branch.BranchName, book_loans.DateDue, books.Title, borrower.Name, borrower.Address
FROM library_branch
INNER JOIN book_loans ON book_loans.BranchID = library_branch.BranchID
INNER JOIN books ON books.BookID = book_loans.BookID
INNER JOIN borrower ON borrower.CardNo = book_loans.CardNo
WHERE library_branch.BranchName LIKE @BranchName + '%'
AND book_loans.DateDue LIKE @DateDue + '%'
GO

EXEC dbo.DateDue @BranchName = 'Sharpstown', @DateDue = '12/11/2018';

/* 5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch. */

USE db_library
GO

CREATE PROC dbo.BookCount @BranchName NVARCHAR(100)
AS
SELECT library_branch.BranchName AS 'Branch Name', COUNT(book_loans.CardNo) AS 'Borrowed Books'
FROM library_branch
INNER JOIN book_loans ON book_loans.BranchID = library_branch.BranchID
GROUP BY library_branch.BranchName
HAVING library_branch.BranchName LIKE @BranchName + '%'
GO

EXEC dbo.BookCount @BranchName = 'Central'

/* 6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out. */

USE db_library
GO

CREATE PROC dbo.CountBorrowedBook @BorrowedBooks INT
AS
SELECT borrower.Name AS 'Borrower Name', borrower.Address 'Borrower Address',  COUNT(book_loans.CardNo) AS 'Borrowed Books'
FROM borrower
INNER JOIN book_loans ON book_loans.CardNo = borrower.CardNo
GROUP BY borrower.Name, borrower.Address
HAVING COUNT(book_loans.CardNo) > @BorrowedBooks
GO

EXEC dbo.CountBorrowedBook @BorrowedBooks = 5;


/* 7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central". */

USE db_library
Go

CREATE PROC dbo.GetAuthors @AuthorName NVARCHAR(100), @LibraryBranch NVARCHAR(100)
AS
SELECT book_authors.AuthorName AS 'Author Name', books.Title AS 'Book Title', book_copies.Number_Of_Copies AS 'Numbers of Copies', library_branch.BranchName AS 'Branch Name'
FROM book_authors
INNER JOIN books ON books.BookID = book_authors.BookID
INNER JOIN book_copies ON book_copies.BookID = books.BookID
INNER JOIN library_branch ON library_branch.BranchID = book_copies.BranchID
WHERE book_authors.AuthorName LIKE @AuthorName + '%'
AND library_branch.BranchName LIKE @LibraryBranch + '%'
GO

EXEC dbo.GetAuthors @AuthorName = 'Stephen King', @LibraryBranch = 'Central';