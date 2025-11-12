CREATE DATABASE ShopDB;
USE ShopDB;
DROP TABLE IF EXISTS Shop;
CREATE TABLE Shop (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(50) UNIQUE NOT NULL,
    supplier VARCHAR(40),
    price INT DEFAULT 10000 CHECK (price <= 20000)
);
INSERT INTO Shop (item_name, supplier, price) VALUES
('Keyboard', 'Logi Corp', 18000),
('Mouse Pad', 'ABC Ltd', 3000),
('Webcam', 'Tech Gear', 12000);
INSERT INTO Shop (item_name, supplier) VALUES
('Speaker', 'XYZ Suppliers');
SELECT * FROM Shop WHERE price > 15000;
SELECT * FROM Shop WHERE supplier = 'ABC Ltd' OR price < 5000;
SELECT DISTINCT supplier FROM Shop;
SELECT item_name, price FROM Shop ORDER BY price DESC LIMIT 1;
SELECT * FROM Shop WHERE price BETWEEN 7000 AND 16000 ORDER BY price ASC;
SELECT supplier, COUNT(item_id) AS Item_Count FROM Shop GROUP BY supplier;
SELECT item_name, price FROM Shop ORDER BY price ASC LIMIT 1;