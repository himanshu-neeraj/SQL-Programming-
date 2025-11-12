CREATE DATABASE CourseDB;
USE CourseDB;
DROP TABLE IF EXISTS Course;
CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) UNIQUE NOT NULL,
    duration INT NOT NULL,
    fees INT DEFAULT 50000 CHECK (fees <= 100000)
);
INSERT INTO Course (course_name, duration, fees) VALUES
('Data Science', 12, 85000),
('Web Development', 6, 45000),
('Cloud Computing', 15, 60000);
INSERT INTO Course (course_name, duration) VALUES
('Database Design', 4);
SELECT * FROM Course WHERE duration > 6;
SELECT * FROM Course WHERE fees < 50000 OR duration > 12;
SELECT DISTINCT duration FROM Course;
SELECT course_name, fees FROM Course ORDER BY fees DESC LIMIT 1;
SELECT * FROM Course WHERE duration BETWEEN 6 AND 12 ORDER BY fees ASC;
SELECT duration, COUNT(course_id) AS Course_Count FROM Course GROUP BY duration;
SELECT course_name, fees FROM Course ORDER BY fees ASC LIMIT 1;