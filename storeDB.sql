
CREATE DATABASE ProductStore;
USE ProductStore;

CREATE TABLE Products (
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    company VARCHAR(50),
    rating FLOAT
);

INSERT INTO Products
VALUES
('Laptop', 'Electronics', 55000.00, 10, 'Dell', 4.5),
('Phone', 'Electronics', 30000.00, 15, 'Samsung', 4.2),
('Headphones', 'Accessories', 2000.00, 25, 'Boat', 4.0),
('Keyboard', 'Accessories', 1500.00, 12, 'Logitech', 4.4),
('Watch', 'Wearables', 5000.00, 8, 'Noise', 4.1);

SELECT * FROM Products;

SELECT product_name FROM Products;

SELECT * FROM Products 
WHERE price > 5000;

SELECT * FROM Products
WHERE category = "Electronics";

SELECT * FROM Products
ORDER BY price asc;

SELECT * FROM Products
ORDER BY rating asc;

SELECT DISTINCT category 
FROM Products;

SELECT * FROM Products
WHERE  quantity < 10;

SELECT * FROM Products;

SELECT count(*) FROM Products;

SELECT avg(price) FROM Products;

SELECT max(price) FROM Products;

SELECT min(price) FROM Products;

SET SQL_SAFE_UPDATES = 0;

UPDATE  Products
SET price = 60000
WHERE product_name = "Laptop";

UPDATE  Products
SET quantity = quantity + 5
WHERE product_name = "Phone";

SELECT * FROM Products;

DELETE  FROM Products
WHERE product_name = "Watch";

SELECT * FROM Products
WHERE company = "Samsung";

SELECT * FROM Products
WHERE rating > 4.2;

SELECT * FROM Products 
WHERE product_name LIKE "P%";

SELECT * FROM Products
WHERE price BETWEEN 1000 AND 10000;

SELECT * FROM Products
Order By Price asc
LIMIT  3;

SELECT * FROM PRODUCTS 
WHERE category IN ("Electronics","Accessories");

DELETE FROM Products
WHERE category = "Accessories";

TRUNCATE Products;

SELECT * FROM Products
ORDER BY price asc
LIMIT 3;

SELECT * FROM Products 
WHERE price > 5000 AND rating > 4;

SELECT * FROM Products 
WHERE category = "Electronics"
ORDER BY rating asc;

SELECT * FROM Products
WHERE company = "Samsung" AND quantity > 5;

SELECT product_name,
       SUM(price * quantity) AS revenue
FROM Products 
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 3;


SELECT SUM(price * quantity) AS total_sales
FROM Products;
































































