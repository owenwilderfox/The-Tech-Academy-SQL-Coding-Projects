/* 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

USE db_library
GO

CREATE PROCEDURE dbo.SelectBookLocation @Title nvarchar(100), @BranchName nvarchar(100)
AS
SELECT library_branch.BranchID AS 'Branch ID', library_branch.BranchName AS 'Branch Name', library_branch.Address AS 'Branch Address', books.Title AS 'Book Title', book_authors.AuthorName AS 'Author Name', book_copies.Number_of_Copies AS 'Number of Copies'
FROM library_branch
INNER JOIN book_copies ON book_copies.BranchID = library_branch.BranchID
INNER JOIN books ON books.BookID = book_copies.BookID
INNER JOIN book_authors ON book_authors.BookID = books.BookID
WHERE books.Title LIKE @Title + '%'
AND library_branch.BranchName LIKE @BranchName + '%'
GO

EXEC dbo.SelectBookLocation @Title = 'The Lost Tribe', @BranchName = 'Sharpstown';