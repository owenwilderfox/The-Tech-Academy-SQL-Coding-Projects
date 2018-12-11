USE db_library
GO

SELECT books.BookID AS 'Book ID', books.Title AS 'Book Title', book_authors.AuthorName AS 'Author Name', books.PublisherName AS 'Publisher Name', publisher.Address AS 'Publisher Address', publisher.Phone AS 'Publisher Phone Number'
FROM books
INNER JOIN publisher ON publisher.PublisherName = books.PublisherName
INNER JOIN book_authors ON book_authors.BookID = books.BookID
;

SELECT library_branch.BranchID AS 'Branch ID', library_branch.BranchName AS 'Branch Name', library_branch.Address AS 'Branch Address', book_loans.BookID AS 'Book ID', book_loans.CardNo AS 'Library Card Number', book_loans.DateOut AS 'Borrow Date', book_loans.DateDue AS 'Return Date'
FROM library_branch
INNER JOIN book_loans ON book_loans.BranchID = library_branch.BranchID
;