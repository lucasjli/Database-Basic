SHOW TABLES;

DESCRIBE comp575_books;

SELECT * FROM comp575_books;

SELECT title, price
FROM comp575_books
WHERE book_id = 1;

SELECT ca.first_name, ca.last_name
FROM comp575_authors AS ca
WHERE ca.country = "us";

SELECT cb.title, ca.first_name, ca.last_name
FROM comp575_books AS cb
JOIN comp575_authors AS ca
WHERE ca.country = "us";

SELECT cb.title, ca.first_name, ca.last_name
FROM comp575_books AS cb
JOIN comp575_authors AS ca
WHERE cb.author_id = ca.author_id AND ca.country = "us";
