DROP TABLE IF EXISTS comp575_books;
CREATE TABLE comp575_books (
  book_id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL DEFAULT '',
  author_id INT(5) UNSIGNED NULL,
  category VARCHAR(100) DEFAULT NULL,
  price DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT '0.0',
  PRIMARY KEY (book_id)
);

DROP TABLE IF EXISTS comp575_authors;
CREATE TABLE comp575_authors (
  author_id INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NOT NULL DEFAULT '',
  last_name VARCHAR(100) NOT NULL DEFAULT '',
  country CHAR(2) DEFAULT NULL,
  website VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (author_id)
);

INSERT INTO comp575_authors (first_name, last_name, country, website)
VALUES
  ('Markus', 'Zusak', 'au', 'http://www.randomhouse.com/features/markuszusak'),
  ('Brandon', 'Sanderson', 'us', 'http://brandonsanderson.com'),
  ('Robert', 'Gates', 'us', NULL),
  ('Catherine', 'Chidgey', 'nz', 'http://www.bookcouncil.org.nz/writers/chidgey.html');

INSERT INTO comp575_books (title, author_id, category, price)
VALUES
  ('The Book Thief', 1, 'Children''s Book', 7.50),
  ('I Am the Messenger', 1, 'Children''s Book', 6.20),
  ('Words of Radiance', 2, 'Fiction', 17.60),
  ('A Memory of Light', 2, 'Fiction', 6.29),
  ('Steelheart', 2, 'Fiction', 11.07),
  ('Duty: Memoirs of a Secretary at War', 3, 'History', 20.99),
  ('From the Shadows', 3, 'History', 13.70),
  ('In a Fishbone Church', 4, 'Literary', 9.17),
  ('The Transformation', 4, 'World Literary', 9.99);
