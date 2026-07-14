CREATE DATABASE StoreDB;
USE StoreDB;

CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    company VARCHAR(50),
    rating FLOAT
);

INSERT INTO Products
VALUES
(101, 'Laptop', 'Electronics', 55000, 10, 'Dell', 4.5),
(102, 'Phone', 'Electronics', 30000, 15, 'Samsung', 4.2),
(103, 'Headphones', 'Accessories', 2000, 25, 'Boat', 4.0),
(104, 'Keyboard', 'Accessories', 1500, 12, 'Logitech', 4.4),
(105, 'Watch', 'Wearables', 5000, 8, 'Noise', 4.1),
(106, 'Mouse', 'Accessories', 800, 30, 'Logitech', 4.3),
(107, 'Tablet', 'Electronics', 25000, 6, 'Samsung', 4.6),
(108, 'Speaker', 'Accessories', 3500, 20, 'Boat', 4.2),
(109, 'Smart TV', 'Electronics', 45000, 5, 'Sony', 4.7),
(110, 'Power Bank', 'Accessories', 1200, 18, 'Mi', 4.0);

SELECT * FROM Products;

SELECT product_name, price FROM Products;

SELECT * FROM Products 
WHERE price > 10000;

SELECT * FROM Products 
WHERE category = "Electronics";

SELECT * FROM Products 
WHERE quantity < 10;

SELECT * FROM Products 
WHERE rating > 4.3;

SELECT DISTINCT  category FROM Products;

SELECT * FROM Products 
ORDER BY price desc;

SELECT * FROM Products 
ORDER BY rating asc;

SELECT * FROM Products 
WHERE company = "Samsung";

SELECT count(*) FROM Products; 

SELECT max(price) FROM Products; 

SELECT avg(price) FROM Products;

SELECT min(price) FROM Products;

SELECT sum(quantity) FROM Products;

SELECT * FROM Products 
WHERE product_name like "s%";

SELECT * FROM Products 
WHERE product_name like "%e";

SELECT * FROM Products;

SELECT * FROM Products 
WHERE product_name like "top-";

SELECT * FROM Products 
WHERE price BETWEEN 1000 AND 10000;

SELECT * FROM Products 
WHERE category IN ("Electronics","Wearables");


SET SQL_SAFE_UPDATES = 0;

UPDATE Products
SET price = 6000
WHERE category = "Laptop";

UPDATE Products
SET quantity = quantity + 10
WHERE product_name = "Phone";

UPDATE Products 
SET company = "Dell"
WHERE company = "Hp";

DELETE FROM Products
WHERE product_name = "Mouse";

DELETE FROM Products
WHERE category = "Mouse";

SELECT * FROM Products;

DELETE FROM Products
WHERE quantity < 10;

SELECT * FROM Products 
ORDER BY price desc
LIMIT 3;

SELECT * FROM Products 
ORDER BY price asc
LIMIT 2;

SELECT * FROM Products 
WHERE price > 5000 AND rating > 4.2;

SELECT * FROM Products 
WHERE company = "Samsung" AND quantity > 5;

SELECT * FROM Products 
WHERE category = "Electronics"
ORDER BY rating asc;


SELECT * FROM Products 
WHERE NOT company = "Samsung";


SELECT DISTINCT COUNT(category) FROM Products;

SELECT   category , count(*) 
FROM Products
group by category;

SELECT category, avg(price)
FROM Products
group by category;

SELECT product_name,max(price)
FROM Products
group by Product_name;

SELECT category,max(quantity)
FROM Products
group by category;

SELECT product_name
FROM Products 
group by product_name
having  5 > quantity AND quantity < 20;

SELECT product_name
FROM Products
group by product_name
order by rating asc;





























