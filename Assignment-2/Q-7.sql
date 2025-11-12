CREATE DATABASE CinemaDB;
USE CinemaDB;
DROP TABLE IF EXISTS Cinema;
CREATE TABLE Cinema (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(50) UNIQUE NOT NULL,
    language VARCHAR(20),
    rating INT DEFAULT 6 CHECK (rating <= 10)
);
INSERT INTO Cinema (movie_name, language, rating) VALUES
('The Great Escape', 'English', 9),
('Bahubali', 'Telugu', 8),
('Sholay', 'Hindi', 5);
INSERT INTO Cinema (movie_name, language) VALUES
('Lagaan', 'Hindi');
SELECT * FROM Cinema WHERE rating > 7;
SELECT * FROM Cinema WHERE language = 'Hindi' OR rating < 5;
SELECT DISTINCT language FROM Cinema;
SELECT movie_name, rating FROM Cinema ORDER BY rating DESC LIMIT 2;
SELECT * FROM Cinema WHERE rating BETWEEN 5 AND 9 ORDER BY rating ASC;
SELECT language, COUNT(movie_id) AS Movie_Count FROM Cinema GROUP BY language;
SELECT movie_name, rating FROM Cinema ORDER BY rating DESC LIMIT 1;