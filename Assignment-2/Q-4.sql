CREATE DATABASE OrdersDB;
USE OrdersDB;
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    product VARCHAR(40),
    amount INT DEFAULT 10000 CHECK (amount <= 50000)
);
INSERT INTO Orders (customer_name, product, amount) VALUES
('Jane Doe', 'Laptop', 45000),
('John Smith', 'Headphones', 2500),
('Kelly Jones', 'Monitor', 12000);
INSERT INTO Orders (customer_name, product) VALUES
('Sam Wilson', 'Mouse');
SELECT * FROM Orders WHERE amount > 10000;
SELECT * FROM Orders WHERE product = 'Laptop' OR amount < 5000;
SELECT DISTINCT product FROM Orders;
SELECT customer_name, product, amount FROM Orders ORDER BY amount DESC LIMIT 2;
SELECT * FROM Orders WHERE amount BETWEEN 8000 AND 30000 ORDER BY amount ASC;
SELECT product, COUNT(order_id) AS Order_Count FROM Orders GROUP BY product;
SELECT customer_name, product, amount FROM Orders ORDER BY amount DESC LIMIT 1;