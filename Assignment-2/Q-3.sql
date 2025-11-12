CREATE DATABASE HospitalDB;
USE HospitalDB;
DROP TABLE IF EXISTS Hospital;
CREATE TABLE Hospital (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(50) NOT NULL,
    disease VARCHAR(30),
    bill_amount INT DEFAULT 20000 CHECK (bill_amount <= 200000)
);
INSERT INTO Hospital (patient_name, disease, bill_amount) VALUES
('Maya Sharma', 'Flu', 75000),
('Ravi Varma', 'Appendicitis', 120000),
('Priya Singh', 'Fever', 5000);
INSERT INTO Hospital (patient_name, disease) VALUES
('Amit Kumar', 'Cold');
SELECT * FROM Hospital WHERE bill_amount > 50000;
SELECT * FROM Hospital WHERE disease = 'Flu' OR bill_amount < 10000;
SELECT DISTINCT disease FROM Hospital;
SELECT patient_name, bill_amount FROM Hospital ORDER BY bill_amount DESC LIMIT 2;
SELECT * FROM Hospital WHERE bill_amount BETWEEN 20000 AND 80000 ORDER BY bill_amount ASC;
SELECT disease, COUNT(patient_id) AS Patient_Count FROM Hospital GROUP BY disease;
SELECT patient_name, bill_amount FROM Hospital ORDER BY bill_amount ASC LIMIT 1;