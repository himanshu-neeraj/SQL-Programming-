Create Database LateAssignment_4;
USe LateAssignment_4;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    salary INT,
    dept_id INT
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Marketing');

INSERT INTO Employees VALUES
(101, 'John', 30, 50000, 2),
(102, 'Alice', 28, 60000, 2),
(103, 'Bob', 35, 45000, 3),
(104, 'Carol', 40, 70000, 4),
(105, 'David', 29, 55000, 1),
(106, 'Eva', 45, 80000, 6);  

SELECT *
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);

SELECT emp_name
FROM Employees
WHERE dept_id = (
    SELECT dept_id
    FROM Employees
    WHERE emp_name = 'John'
);

SELECT *
FROM Employees
WHERE dept_id NOT IN (
    SELECT dept_id
    FROM Departments
);

SELECT MAX(salary) AS Second_Highest_Salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary)
    FROM Employees
);

SELECT *
FROM Employees
WHERE age > ANY (
    SELECT age
    FROM Employees
    WHERE dept_id = (
        SELECT dept_id
        FROM Departments
        WHERE dept_name = 'Sales'
    )
);