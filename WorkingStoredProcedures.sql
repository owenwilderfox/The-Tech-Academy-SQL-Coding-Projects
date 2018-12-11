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

EXEC dbo.SelectBookLocation @Title = 'The Lost Tribe', @BranchName = '%';

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