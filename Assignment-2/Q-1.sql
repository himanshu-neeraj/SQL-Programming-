CREATE DATABASE CompanyDB;
USE CompanyDB;
DROP TABLE IF EXISTS Company;
CREATE TABLE Company (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    department VARCHAR(20),
    salary INT DEFAULT 20000 CHECK (salary >= 20000)
);
INSERT INTO Company (emp_name, department, salary) VALUES
('Alice Johnson', 'HR', 65000),
('Bob Smith', 'IT', 45000),
('Charlie Brown', 'Finance', 90000);
INSERT INTO Company (emp_name, department) VALUES
('David Lee', 'HR');
INSERT INTO Company (emp_name, department, salary) VALUES
('Eve Williams', 'IT', 28000);
SELECT * FROM Company WHERE salary > 50000;
SELECT * FROM Company WHERE department = 'HR' OR salary < 30000;
SELECT DISTINCT department FROM Company;
SELECT emp_name, salary, department FROM Company ORDER BY salary DESC LIMIT 2;
SELECT * FROM Company WHERE salary BETWEEN 25000 AND 60000 ORDER BY salary ASC;
SELECT department, COUNT(emp_id) AS Employee_Count FROM Company GROUP BY department;
SELECT emp_name, salary, department FROM Company ORDER BY salary DESC LIMIT 1;