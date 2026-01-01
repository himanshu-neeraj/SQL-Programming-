Create Database If not exists LateAssignment;
USE LateAssignment;

Create table Studentss(
student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    course VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO Studentss VALUES
(1, 'Rahul', 20, 'B.Sc AI', 'Mumbai'),
(2, 'Anjali', 21, 'BCA', 'Delhi'),
(3, 'Aman', 22, 'B.Tech', 'Pune'),
(4, 'Neha', 19, 'B.Sc AI', 'Mumbai');

CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT CHECK (marks BETWEEN 0 AND 100),
    FOREIGN KEY (student_id) REFERENCES Studentss(student_id)
);

INSERT INTO Marks VALUES
(101, 1, 'Maths', 85),
(102, 1, 'Python', 90),
(103, 2, 'DBMS', 78),
(104, 3, 'Maths', 65),
(105, 4, 'Python', 88);

SELECT * FROM Studentss;

SELECT name, course FROM Studentss;

Select name, age 
from
Studentss
order by age desc;

Select * From
Studentss
where city = 'Mumbai'; 

Update Studentss 
Set city = 'Bangalore'
Where student_id = 3; 

SELECT *
FROM Marks
WHERE marks = (SELECT MAX(marks) FROM Marks);

SELECT s.name, s.course, m.subject, m.marks
FROM Studentss s
INNER JOIN Marks m
ON s.student_id = m.student_id;

SELECT subject, AVG(marks) AS average_marks
FROM Marks
GROUP BY subject;