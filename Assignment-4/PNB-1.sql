CREATE DATABASE PNB1;
USE PNB1;

CREATE TABLE branchess (
  branch_id INT PRIMARY KEY,
  branch_code VARCHAR(10) NOT NULL UNIQUE,
  branch_name VARCHAR(100) NOT NULL,
  city VARCHAR(100) NOT NULL,
  ifsc_code VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO branchess (branch_id,branch_code, branch_name, city, ifsc_code) VALUES
(1,'NDL01','New Delhi Main','New Delhi','PNB0001NDL'),
(2,'MUM01','Mumbai South','Mumbai','PNB0002MUM');


CREATE TABLE departmentss(
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO departmentss (dept_id,dept_name) VALUES
(1,'Operations'),(2,'Loans'),(3,'IT');



CREATE TABLE employeess (
  emp_id INT PRIMARY KEY,
  full_name VARCHAR(120) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  phone VARCHAR(20) UNIQUE,
  hire_date DATE NOT NULL,
  branch_id INT NOT NULL,
  dept_id INT NOT NULL,
  salary DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (branch_id) REFERENCES branchess(branch_id),
  FOREIGN KEY (dept_id) REFERENCES departmentss(dept_id)
);

INSERT INTO employeess (emp_id,full_name,email,phone,hire_date,branch_id,dept_id,salary) VALUES
(1,'Amit Sharma','amit@pnb.com','9000000001','2022-04-15',1,1,600000),
(2,'Pooja Verma','pooja@pnb.com','9000000002','2023-06-01',2,2,700000);

CREATE TABLE customerss (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(80) NOT NULL,
  last_name VARCHAR(80) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  phone VARCHAR(20) UNIQUE,
  dob DATE NOT NULL,
  kyc_id VARCHAR(30) NOT NULL UNIQUE,
  branch_id INT NOT NULL,
  FOREIGN KEY (branch_id) REFERENCES branchess(branch_id)
);

INSERT INTO customerss (customer_id,first_name,last_name,email,phone,dob,kyc_id,branch_id) VALUES
(1,'Himanshu','Neeraj','himanshu@ex.com','9111111111','2000-08-12','KYC001',1),
(2,'Seema','Rao','seema@ex.com','9222222222','1996-01-05','KYC002',2),
(3,'Aditya','Singh','aditya@ex.com','9333333333','1992-12-20','KYC003',1);

CREATE TABLE customer_addressess (
  address_id INT PRIMARY KEY ,
  customer_id INT NOT NULL,
  address_line1 VARCHAR(200) NOT NULL,
  city VARCHAR(100) NOT NULL,
  state VARCHAR(100) NOT NULL,
  postal_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customerss(customer_id)
);

INSERT INTO customer_addressess (address_id,customer_id,address_line1,city,state,postal_code) VALUES
(1,1,'A-101, Raj Nagar','New Delhi','Delhi','110001'),
(2,2,'7B, Marine Drive','Mumbai','Maharashtra','400001'),
(3,3,'221B, MG Road','New Delhi','Delhi','110002');

CREATE TABLE account_typess (
  account_type_id INT PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL ,
  min_balance DECIMAL(12,2) NOT NULL,
  interest_rate DECIMAL(5,2) NOT NULL
);
INSERT INTO account_typess (account_type_id,type_name,min_balance,interest_rate) VALUES
(1,'SAVINGS',1000.00,3.50),
(2,'CURRENT',0.00,0.00);

CREATE TABLE accountss(
  account_id INT PRIMARY KEY,
  account_number VARCHAR(20) NOT NULL,
  branch_id INT NOT NULL,
  account_type_id INT NOT NULL,
  customer_id INT NOT NULL,
  opened_on DATE NOT NULL,
  status VARCHAR(20) NOT NULL,
  current_balance DECIMAL(14,2) NOT NULL,
  FOREIGN KEY (branch_id) REFERENCES branchess(branch_id),
  FOREIGN KEY (account_type_id) REFERENCES account_typess(account_type_id),
  FOREIGN KEY (customer_id) REFERENCES customerss(customer_id)
);
INSERT INTO accountss (account_id,account_number,branch_id,account_type_id,customer_id,opened_on,status,current_balance) VALUES
(1,'AC0001',1,1,1,'2023-01-10','ACTIVE',25000.00),
(2,'AC0002',2,1,2,'2023-02-14','ACTIVE',78000.00),
(3,'AC0003',1,2,3,'2024-03-01','ACTIVE',150000.00),
(4,'AC0004',1,1,3,'2024-05-20','FROZEN',500.00);

CREATE TABLE transactionss (
  txn_id INT PRIMARY KEY,
  account_id INT NOT NULL,
  txn_time DATETIME NOT NULL,
  txn_type VARCHAR(20) NOT NULL,
  amount DECIMAL(14,2) NOT NULL,
  description VARCHAR(255),
  balance_after DECIMAL(14,2) NOT NULL,
  FOREIGN KEY (account_id) REFERENCES accountss(account_id)
);
INSERT INTO transactionss (txn_id,account_id,txn_time,txn_type,amount,description,balance_after) VALUES
(1,1,'2024-06-01 10:00:00','DEPOSIT',5000.00,'Cash deposit',30000.00),
(2,1,'2024-07-03 15:30:00','WITHDRAWAL',2000.00,'ATM',28000.00),
(3,2,'2024-01-12 09:10:00','DEPOSIT',30000.00,'Salary',108000.00),
(4,2,'2024-02-10 18:45:00','TRANSFER_OUT',5000.00,'UPI',103000.00);

CREATE TABLE cardss (
  card_id INT PRIMARY KEY,
  account_id INT NOT NULL,
  card_number VARCHAR(19) NOT NULL UNIQUE,
  card_type VARCHAR(20) NOT NULL,
  cvv CHAR(3) NOT NULL,
  expiry_month INT NOT NULL,
  expiry_year INT NOT NULL,
  is_active BOOLEAN NOT NULL,
  FOREIGN KEY (account_id) REFERENCES accountss(account_id)
);
INSERT INTO cardss (card_id,account_id,card_number,card_type,cvv,expiry_month,expiry_year,is_active) VALUES
(1,1,'4111111111111111','DEBIT','123',12,2027,TRUE),
(2,2,'5500000000000004','DEBIT','456',11,2028,TRUE);

CREATE TABLE loanss (
  loan_id INT PRIMARY KEY,
  account_id INT NOT NULL,
  principal_amt DECIMAL(14,2) NOT NULL,
  interest_rate DECIMAL(5,2) NOT NULL,
  tenure_months INT NOT NULL,
  start_date DATE NOT NULL,
  status VARCHAR(20) NOT NULL,
  FOREIGN KEY (account_id) REFERENCES accountss(account_id)
);
INSERT INTO loanss (loan_id,account_id,principal_amt,interest_rate,tenure_months,start_date,status) VALUES
(1,2,300000.00,10.50,36,'2024-01-15','ACTIVE'),
(2,3,800000.00,9.25,60,'2023-09-01','ACTIVE');

CREATE TABLE loan_paymentss (
  payment_id INT PRIMARY KEY,
  loan_id INT NOT NULL,
  paid_on DATE NOT NULL,
  amount DECIMAL(14,2) NOT NULL,
  method VARCHAR(20) NOT NULL,
  FOREIGN KEY (loan_id) REFERENCES loanss(loan_id)
);
INSERT INTO loan_paymentss ( payment_id,loan_id,paid_on,amount,method) VALUES
(1,1,'2024-02-15',12000.00,'UPI'),
(2,1,'2024-03-15',12000.00,'NEFT');

CREATE TABLE notificationss (
  note_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  message VARCHAR(200) NOT NULL,
  priority VARCHAR(20) NOT NULL,
  created_at DATETIME NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customerss(customer_id)
);
INSERT INTO notificationss ( note_id,customer_id,message,priority,created_at) VALUES
(1,1,'Welcome to PNB!','LOW','2024-01-01 10:00:00'),
(2,2,'Your loan EMI is due','HIGH','2024-02-01 12:00:00'),
(3,3,'KYC update reminder','MEDIUM','2024-03-01 09:00:00');

