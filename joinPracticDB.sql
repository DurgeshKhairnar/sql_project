CREATE DATABASE JoinPracticeDB;
USE JoinPracticeDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Customers VALUES
(1,'Durgesh','Hyderabad'),
(2,'Sai','Chennai'),
(3,'Vishal','Delhi'),
(4,'Rahul','Mumbai'),
(5,'Anu','Pune'),
(6,'Neha','Bangalore');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    amount INT
);

INSERT INTO Orders VALUES
(101,1,'Laptop',50000),
(102,2,'Phone',25000),
(103,1,'Mouse',1000),
(104,3,'Tablet',30000),
(105,4,'Watch',5000),
(106,2,'Keyboard',2000);

show tables;



SELECT c.customer_name , o.product_name
FROM customers c
join orders o
on c.customer_id = o.customer_id;

select c.customer_name , o.amount
FROM customers c
join orders o
on c.customer_id = o.customer_id;

select c.city , o.product_name
FROM customers c
join orders o
on  c.customer_id = o.customer_id;

SELECT o.order_id , c.customer_name
FROM customers c
join orders o
on c.customer_id = o.customer_id;

select c.customer_name , count(order_id)
FROM customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_name;

select c.customer_name , sum(amount)
From customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_name;

select c.customer_name , sum(amount) as maxc
From customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_name
order by maxc desc;

select customer_name , product_name
from customers c
join orders o
on c.customer_id = o.customer_id
where customer_name = "Sai";

select c.customer_name , sum(amount) as total_amount
From customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_name
having total_amount > 30000;


SELECT *
FROM customers c
left join orders s
on c.customer_id = s.customer_id;

SELECT c.customer_name , o.product_name
From customers c
left join orders o
on c.customer_id = o.customer_id;

select c.customer_name as customerName, count(order_id)
From customers c
left join orders o 
on c.customer_id = o.customer_id
group by customerName;

select c.customer_name as customerName, o.order_id
From customers c
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is Null;

select c.customer_name as customerName, c.city
From customers c
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is Null;

SELECT c.customer_name , sum(amount)
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_name;

SELECT c.customer_name , count(order_id)
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_name;

select c.customer_name as customerName, o.order_id
From customers c
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is Null;

select c.customer_name as customerName, count(order_id) as ct
From customers c
left join orders o 
on c.customer_id = o.customer_id
group by customerName
having ct > 1;


SELECT * from customers;
SELECT * from orders;


