--11. Create a publisher table called comp575_publishers that has four columns: publisher_id, publisher_name, publisher_country and publisher_website
DROP TABLE IF EXISTS comp575_publishers;
CREATE TABLE comp575_publishers (
  publisher_id INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  publisher_name VARCHAR(100) NOT NULL DEFAULT '',
  publisher_country CHAR(2) DEFAULT NULL,
  publisher_website VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (publisher_id)
);

--12. Insert three publishers
INSERT INTO comp575_publishers (publisher_name, publisher_country, publisher_website)
VALUES
  ('Alfred A. Knopf', 'us', 'knopf.knopfdoubleday.com'),
  ('Victor Gollancz', 'uk', 'www.gollancz.co.uk'),
  ('Henry Holt and Company', 'us', 'us.macmillian.com/henryholt.aspx');
  
--13. Add a new column to comp575_books called publisher_id
ALTER TABLE comp575_books
ADD COLUMN publisher_id INT(5);

--14. Insert the publisher for each book
UPDATE comp575_books
SET publisher_id = 1
WHERE author_id = 1 or author_id = 3;

UPDATE comp575_books
SET publisher_id = 2
WHERE author_id = 2;

UPDATE comp575_books
SET publisher_id = 3
WHERE author_id = 4;

--15. Add a new column into comp575_books called publish_date with an appropriate data type (DATE, TIMESTAMP or DATETIME)
ALTER TABLE comp575_books
ADD COLUMN publish_date DATE;

--16. Insert the publish date for each book
UPDATE comp575_books
SET publish_date = '2007-09-11'
WHERE book_id = 1;

UPDATE comp575_books
SET publish_date = '2006-05-09'
WHERE book_id = 2;

UPDATE comp575_books
SET publish_date = '2014-03-04'
WHERE book_id = 3;

UPDATE comp575_books
SET publish_date = '2013-01-08'
WHERE book_id = 4;

UPDATE comp575_books
SET publish_date = '2013-09-24'
WHERE book_id = 5;

UPDATE comp575_books
SET publish_date = '2010-01-14'
WHERE book_id = 6;

UPDATE comp575_books
SET publish_date = '2007-01-09'
WHERE book_id = 7;

UPDATE comp575_books
SET publish_date = '1998-05-01'
WHERE book_id = 8;

UPDATE comp575_books
SET publish_date = '2006-06-13'
WHERE book_id = 9;

--17. Update book prices to give a 5% discount
UPDATE comp575_books
SET price = price * 0.95;

--18. Display the book id, title and author name where the book_id is 2
SELECT b.book_id, b.title, CONCAT (a.first_name, ' ', a.last_name) AS author_name
FROM comp575_books b JOIN comp575_authors a 
ON b.author_id = a.author_id
WHERE b.book_id = 2;

--19. Display the number of books by each author (use COUNT(*) and GROUP BY)
SELECT CONCAT(a.first_name, " ", a.last_name) AS author_name, COUNT(*) AS number_of_books
FROM comp575_books b JOIN comp575_authors a 
ON b.author_id = a.author_id
GROUP BY a.first_name, a.last_name;

--20. Display all book titles written by Robert Gates or Markus Zusak (you may hard code their author IDs)
SELECT CONCAT(a.first_name, " ", a.last_name) AS author_name, GROUP_CONCAT(b.title) AS book_titles
FROM comp575_books b JOIN comp575_authors a
ON b.author_id = a.author_id
WHERE a.author_id = 1 or a.author_id = 3
GROUP BY a.first_name, a.last_name;

--21. Display all book titles NOT written by a New Zealand writer
SELECT b.title AS book_title
FROM comp575_books b JOIN comp575_authors a
ON b.author_id = a.author_id
WHERE a.country != 'nz';

--22. Display the author who has written more than two books
SELECT CONCAT(a.first_name, " ", a.last_name) AS author_name, COUNT(*) AS number_of_books
FROM comp575_books b JOIN comp575_authors a 
ON b.author_id = a.author_id
GROUP BY a.first_name, a.last_name
HAVING COUNT(*) > 2;

--23. Display all book titles and publish dates, ordered by publish date (newest first)
SELECT b.title, b.publish_date
FROM comp575_books b
ORDER BY b.publish_date DESC;

--24. Display book titles and publish dates of books published in 2006 and 2007
SELECT b.title, b.publish_date
FROM comp575_books b
WHERE YEAR(b.publish_date) IN (2006, 2007);

--25. Display all book titles that contain the string "Memo"
SELECT b.title
FROM comp575_books b
WHERE b.title LIKE '%Memo%';

--26. Display all book titles that comprise at least three words
SELECT b.title
FROM comp575_books b
WHERE LENGTH(b.title) - LENGTH(REPLACE(b.title, ' ', '')) >= 2;

--27. Use UNION to display authors' and publishers' websites as a single result set
SELECT a.website
FROM comp575_authors a
WHERE a.website IS NOT NULL
UNION
SELECT p.publisher_website
FROM comp575_publishers p
WHERE p.publisher_website IS NOT NULL;

--28. Display books whose author and publisher are from the same country
SELECT b.title
FROM comp575_books b
JOIN comp575_authors a ON b.author_id = a.author_id
JOIN comp575_publishers p ON b.publisher_id = p.publisher_id
WHERE a.country = p.publisher_country;
