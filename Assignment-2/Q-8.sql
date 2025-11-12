CREATE DATABASE BankDB;
USE BankDB;
DROP TABLE IF EXISTS BankAccount;
CREATE TABLE BankAccount (
    acc_id INT PRIMARY KEY AUTO_INCREMENT,
    holder_name VARCHAR(50) NOT NULL,
    branch VARCHAR(30),
    balance INT DEFAULT 5000 CHECK (balance >= 1000)
);
INSERT INTO BankAccount (holder_name, branch, balance) VALUES
('Suresh Menon', 'Mumbai', 55000),
('Neha Reddy', 'Bangalore', 18000),
('Rajesh Verma', 'Delhi', 1000);
INSERT INTO BankAccount (holder_name, branch) VALUES
('Anjali Pande', 'Delhi');
SELECT * FROM BankAccount WHERE balance > 20000;
SELECT * FROM BankAccount WHERE branch = 'Delhi' OR balance < 5000;
SELECT DISTINCT branch FROM BankAccount;
SELECT holder_name, balance, branch FROM BankAccount ORDER BY balance DESC LIMIT 2;
SELECT * FROM BankAccount WHERE balance BETWEEN 10000 AND 30000 ORDER BY balance ASC;
SELECT branch, COUNT(acc_id) AS Account_Count FROM BankAccount GROUP BY branch;
SELECT holder_name, balance, branch FROM BankAccount ORDER BY balance ASC LIMIT 1;