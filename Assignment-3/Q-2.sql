create database assignment3Q2;
use assignment3Q2;
CREATE TABLE Learners (
    learner_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50),
    subject VARCHAR(30),
    score INT,
    attendance_pct INT,
    final_grade CHAR(1)
);
INSERT INTO Learners (full_name, subject, score, attendance_pct, final_grade) VALUES
('Aditya Singh', 'Physics', 88, 92, 'A'),
('Ishika Patel', 'Chemistry', 75, 80, 'B'),
('Vivaan Reddy', 'Biology', 65, 78, 'C'),
('Myra Jain', 'Physics', 94, 98, 'A'),
('Arjun Rao', 'Chemistry', 48, 60, 'D');
SELECT * FROM Learners;
UPDATE Learners SET score = LEAST(score + 7, 100) WHERE attendance_pct > 85;
SELECT learner_id, full_name, subject, score,
    CASE
        WHEN score >= 90 THEN 'Outstanding'
        WHEN score >= 70 THEN 'Good'
        WHEN score >= 50 THEN 'Satisfactory'
        ELSE 'Needs Improvement'
    END AS performance_review
FROM Learners;
SELECT subject, AVG(score) AS avg_score FROM Learners GROUP BY subject;
SELECT subject, AVG(score) AS avg_score FROM Learners GROUP BY subject HAVING AVG(score) > 70;
SELECT subject,
    SUM(score) AS total_score,
    AVG(attendance_pct) AS avg_attendance
FROM Learners GROUP BY subject;
UPDATE Learners SET score = LEAST(CEIL(score * 1.08), 100) WHERE subject = 'Physics';
SELECT MAX(score) AS highest_score, MIN(score) AS lowest_score FROM Learners;
SELECT * FROM Learners ORDER BY attendance_pct DESC;a
SELECT subject, COUNT(*) AS learner_count FROM Learners GROUP BY subject HAVING COUNT(*) > 1;