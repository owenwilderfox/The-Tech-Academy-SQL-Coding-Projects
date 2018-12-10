SELECT * FROM books;
SELECT * FROM book_authors;

SELECT Title, AuthorName
FROM books
INNER JOIN book_authors ON book_authors.BookID = books.BookID;


SELECT * FROM book_copies;