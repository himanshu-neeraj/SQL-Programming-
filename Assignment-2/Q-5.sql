CREATE DATABASE LibraryDB;
USE LibraryDB;
DROP TABLE IF EXISTS Library2;
CREATE TABLE Library2 (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) UNIQUE NOT NULL,
    author VARCHAR(50),
    price INT DEFAULT 700 CHECK (price <= 1500)
);
INSERT INTO Library2 (title, author, price) VALUES
('The Guide', 'R.K. Narayan', 850),
('Malgudi Days', 'R.K. Narayan', 450),
('Wings of Fire', 'A.P.J. Abdul Kalam', 1200);
INSERT INTO Library2 (title, author) VALUES
('Discovery of India', 'Jawaharlal Nehru');
INSERT INTO Library2 (title, author, price) VALUES
('The Secret', 'Rhonda Byrne', 600);
SELECT * FROM Library2 WHERE price > 1000;
SELECT * FROM Library2 WHERE author = 'R.K. Narayan' OR price < 500;
SELECT DISTINCT author FROM Library2;
SELECT title, price FROM Library2 ORDER BY price DESC LIMIT 2;
SELECT * FROM Library2 WHERE price BETWEEN 400 AND 1000 ORDER BY price ASC;
SELECT author, COUNT(book_id) AS Book_Count FROM Library2 GROUP BY author;
SELECT title, price FROM Library2 ORDER BY price ASC LIMIT 1;