CREATE DATABASE RetailSales;
USE RetailSales;

CREATE table Customer(
	 customer_id int PRIMARY KEY,
	 customer_name varchar(50),
     city varchar(10)
);

INSERT INTO Customer
value(101,"Rahul","Pune"),
(102,"Priya","Mumbai"),
(103,"Amit","Delhi");

CREATE table Products(
	 product_id int PRIMARY KEY,
	 product_name varchar(50),
     category varchar(50),
     price int
);

INSERT INTO Products
value(1,"Laptop","Electronics","50000"),
(2,"Mobile","Electronics","20000"),
(3,"chair","Furniture","5000");


CREATE TABLE Orders(
	order_id int,
    customer_id int,
    product_id int,
    quantity int,
    order_date date,
    foreign key (customer_id)
    references Customer(customer_id),
    foreign key (product_id)
    references  Products(product_id)
);

INSERT INTO Orders
value(1001,"101","1","1","2025-01-10"),
(1002,"102","2","2","2025-01-12"),
(1003,"103","3","4","2025-01-15"),
(1004,"101","2","1","2025-02-01");

SELECT sum(o.quantity * p.price) as total_sales
FROM orders o
join products p
on o.product_id = p.product_id;

SELECT count(order_id) as order_count
FROM Orders;

SELECT p.product_name , sum(o.quantity * p.price) as total_sales
FROM orders o
join products p
on o.product_id = p.product_id
group by p.product_name
order by total_sales desc
limit 1;

SELECT c.customer_name , sum(o.quantity * p.price) as total_sales
FROM orders o
join products p
on o.product_id = p.product_id
join customer c
on o.customer_id = c.customer_id
group by c.customer_name
order by total_sales desc;

SELECT MonthName(o.order_date) as mn , sum(o.quantity * p.price) as total_sales
FROM orders o
join products p
on o.product_id = p.product_id
group by mn
order by total_sales desc;

SELECT p.category , sum(o.quantity * p.price) as total_sales
FROM orders o
join products p
on o.product_id = p.product_id
group by p.category
order by total_sales desc;

SELECT p.product_name , round(avg(o.quantity * p.price),2) as avg_sales
FROM orders o
join products p
on o.product_id = p.product_id
group by p.product_name  
order by avg_sales desc;

SELECT c.customer_name
FROM customer c
left join orders o
on o.customer_id = c.customer_id
where o.order_id is NULL;

SELECT product_name , max(price) as highest_priced
FROM Products   
group by product_name
order by  highest_priced desc
limit 1;

SELECT product_name , min(price) as lowest_priced
FROM Products   
group by product_name
order by  lowest_priced asc
limit 1;

SELECT p.product_name , round(avg(o.quantity * p.price),2) as revenue
FROM orders o
join products p
on o.product_id = p.product_id
group by p.product_name  
order by revenue desc
limit 3;

SELECT p.product_name , sum(o.quantity) as quantity
FROM orders o
join products p
on o.product_id = p.product_id
group by p.product_name ;

SELECT c.customer_name , sum(o.quantity * p.price) as spent
FROM orders o
join products p
on o.product_id = p.product_id
join customer c
on o.customer_id = c.customer_id
group by c.customer_name
order by total_sales desc
Limit 1;

SELECT p.product_name
FROM products p
left join orders o
on p.product_id = o.product_id
where o.order_id is NULL;

SELECT dayName(o.order_id) , sum(o.quantity * p.price) as spent
FROM orders o
join products p
on o.product_id = p.product_id
join customer c
on o.customer_id = c.customer_id
group by dayName(o.order_id);

SELECT city , count(customer_id)
FROM Customer
group by city;

SELECT c.customer_name , round(avg(o.quantity * p.price),2) as avg_sales
FROM orders o
join products p
on o.product_id = p.product_id
join customer c
on o.customer_id = c.customer_id
group by c.customer_name  
order by avg_sales desc;

SELECT max(o.quantity * p.price) as max_sales
FROM orders o
join products p
on o.product_id = p.product_id
join customer c
on o.customer_id = c.customer_id
order by max_sales desc
limit 1;

SELECT * FROM Customer;
SELECT * FROM Products;
SELECT * FROM Orders;

