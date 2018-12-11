USE db_library
GO

SELECT books.BookID AS 'Book ID', books.Title AS 'Book Title', book_authors.AuthorName AS 'Author Name', books.PublisherName AS 'Publisher Name', publisher.Address AS 'Publisher Address', publisher.Phone AS 'Publisher Phone Number'
FROM books
INNER JOIN publisher ON publisher.PublisherName = books.PublisherName
INNER JOIN book_authors ON book_authors.BookID = books.BookID
;