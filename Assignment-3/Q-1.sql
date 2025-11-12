CREATE DATABASE company_db;
USE company_db;
CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50),
    department VARCHAR(30),
    experience_yrs INT,
    salary INT,
    joining_date DATE,
    bonus INT
);
INSERT INTO staff (staff_id, full_name, department, experience_yrs, salary, joining_date, bonus) VALUES 
(1, 'Aarav Sharma', 'Tech', 7, 75000, '2019-08-15', 2000),
(2, 'Riya Singh', 'HR', 4, 45000, '2022-03-10', 4000),
(3, 'Vikram Kumar', 'Marketing', 9, 85000, '2017-11-20', 5000),
(4, 'Ananya Gupta', 'Tech', 3, 40000, '2023-01-18', 4500),
(5, 'Rohan Mehra', 'Accounts', 12, 95000, '2015-05-01', 3000),
(6, 'Sia Verma', 'Marketing', 6, 60000, '2020-09-12', 6000);
SELECT * FROM staff WHERE department="Tech";
SET sql_safe_updates=0;
UPDATE staff SET bonus = bonus * 1.25 WHERE salary > 80000;
SELECT staff_id, full_name, department, salary,
    CASE
        WHEN salary >= 85000 THEN 'High Earner'
        WHEN salary BETWEEN 50000 AND 84999 THEN 'Mid Earner'
        ELSE 'Junior Earner'
    END AS salary_category
FROM staff;
SELECT department, AVG(bonus) AS avg_bonus FROM staff GROUP BY department;
SELECT department, AVG(bonus) AS avg_bonus FROM staff GROUP BY department HAVING AVG(bonus) > 4500;
SELECT department, SUM(salary + bonus) AS total_payout FROM staff GROUP BY department;
UPDATE staff SET salary = salary * 1.15 WHERE department = 'Accounts';
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM staff;
SELECT * FROM staff ORDER BY bonus DESC;
SELECT department, COUNT(*) as employee_count FROM staff GROUP BY department HAVING COUNT(*)>1;
SELECT * FROM staff;