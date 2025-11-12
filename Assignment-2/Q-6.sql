CREATE DATABASE TeacherDB;
USE TeacherDB;
DROP TABLE IF EXISTS Teacher;
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(50) NOT NULL,
    subject VARCHAR(30),
    salary INT DEFAULT 35000 CHECK (salary <= 80000)
);
INSERT INTO Teacher (teacher_name, subject, salary) VALUES
('Ms. Kavita', 'Maths', 62000),
('Mr. Rohan', 'Science', 48000),
('Mrs. Deepa', 'English', 10000);
INSERT INTO Teacher (teacher_name, subject) VALUES
('Dr. Alok', 'Maths');
SELECT * FROM Teacher WHERE salary > 50000;
SELECT * FROM Teacher WHERE subject = 'Maths' OR salary < 30000;
SELECT DISTINCT subject FROM Teacher;
SELECT teacher_name, salary, subject FROM Teacher ORDER BY salary DESC LIMIT 1;
SELECT * FROM Teacher WHERE salary BETWEEN 20000 AND 70000 ORDER BY salary ASC;
SELECT subject, COUNT(teacher_id) AS Teacher_Count FROM Teacher GROUP BY subject;
SELECT teacher_name, salary, subject FROM Teacher ORDER BY salary ASC LIMIT 1;