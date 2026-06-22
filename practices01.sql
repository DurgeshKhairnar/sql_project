CREATE DATABASE SQLPracticeDB;
USE SQLPracticeDB;

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
(6,'Kiran','Bangalore'),
(7,'Neha','Delhi'),
(8,'Priya','Hyderabad'),
(9,'Ravi','Mumbai'),
(10,'Pooja','Pune');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    amount INT,
    order_date DATE,
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(101,1,'Laptop','Electronics',50000,'2024-01-05'),
(102,2,'Phone','Electronics',25000,'2024-01-07'),
(103,1,'Mouse','Accessories',1000,'2024-01-10'),
(104,3,'Tablet','Electronics',30000,'2024-01-15'),
(105,4,'Watch','Wearables',5000,'2024-01-20'),
(106,2,'Keyboard','Accessories',2000,'2024-01-22'),
(107,6,'Speaker','Accessories',4000,'2024-02-01'),
(108,8,'Laptop','Electronics',50000,'2024-02-05'),
(109,1,'Phone','Electronics',25000,'2024-02-10'),
(110,6,'Mouse','Accessories',1000,'2024-02-15'),
(111,3,'Laptop','Electronics',50000,'2024-03-01'),
(112,7,'Watch','Wearables',10000,'2024-03-08'),
(113,8,'Phone','Electronics',25000,'2024-03-15'),
(114,9,'Speaker','Accessories',4000,'2024-03-20'),
(115,1,'Tablet','Electronics',30000,'2024-03-28');


-- how can i return  unique customer name 
SELECT c.customer_name , o.product_name
FROM customers c
join orders o
on c.customer_id = o.customer_id;

SELECT c.customer_name , o.amount
FROM customers c
join orders o
on c.customer_id = o.customer_id;

SELECT c.city , o.product_name
FROM customers c
join orders o 
on c.customer_id = o.customer_id;

SELECT c.customer_name , count(o.order_id)
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_name;

SELECT c.customer_name , sum(o.amount)
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_name;

SELECT c.customer_name , sum(o.amount) as amt
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_name
order by amt desc
LIMIT 1;

SELECT c.customer_name , count(o.order_id) as total_count
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_name
order by total_count desc
limit 1;

SELECT c.city , sum(o.amount)
FROM customers c
join orders o 
on c.customer_id = o.customer_id
group by c.city;

SELECT o.category , sum(o.amount)
FROM orders o	
group by o.category;

SELECT c.customer_name, o.category
from customers c 
join orders o 
on c.customer_id = o.customer_id
where o.category = "Electronics";

SELECT c.customer_name , o.order_id
from customers c 
left join orders o 
on c.customer_id = o.customer_id;  

SELECT c.customer_name , o.order_id
from customers c 
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is null;

SELECT c.customer_name , count(o.order_id) as ct
from customers c 
left join orders o 
on c.customer_id = o.customer_id
group by c.customer_name;


SELECT c.city , o.order_id
from customers c 
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is null;

--   Subquery Practice

SELECT * 
FROM orders 
where amount > (
	SELECT avg(amount)
    FROM orders
);


SELECT * 
FROM orders 
where amount < (
	SELECT avg(amount)
    FROM orders
);

SELECT * 
FROM orders 
where amount = (
	SELECT max(amount)
    FROM orders
)
limit 1;

SELECT max(amount)
FROM orders 
where amount < (
	SELECT max(amount)
    FROM orders
);

SELECT c.customer_name
FROM customers c
join orders o
on c.customer_id = o.customer_id
where o.amount > (
		SELECT avg(o.amount)
        FROM orders o
);

SELECT product_name
FROM orders
where amount > (
			SELECT avg(avg_product)
            FROM (
					SELECT avg(amount) as avg_product
                    FROM orders
            )t
);

SELECT c.city , sum(o.amount)
FROM customers c 
join orders o
where o.amount > (
			SELECT avg(avg_product)
            FROM (
					SELECT avg(o.amount) as avg_product
                    FROM orders o
            )t
)
group by c.city;

SELECT c.customer_name , sum(o.amount)
FROM customers c 
join orders o
on c.customer_id = o.customer_id
where o.amount > (
			SELECT avg(rev_product)
            FROM (
					SELECT sum(o.amount) as rev_product
                    FROM orders o
            )t
)
group by c.customer_name;

SELECT c.customer_name , sum(o.amount) as am
FROM customers c 
join orders o
on c.customer_id = o.customer_id 
where am > (
		SELECT sum(o.amount)
        FROM customers c 
        join orders o  
        on c.customer_id = o.customer_id
        where c.customer_name = "sai"
)
group by c.customer_name;

SELECT c.customer_name, count(o.order_id)
FROM customers c 
join orders o 
on c.customer_id = o.customer_id
where count(o.order_id) > (
		SELECT avg(order_id)
        FROM orders
)
group by c.customer_name;

SELECT amount,
row_number() over(order by amount desc)
FROM orders;

SELECT amount,
row_number() over(order by amount desc)
FROM orders
limit 1;

SELECT amount,
	   customer_id,
row_number() over(order by amount desc)
FROM orders
limit 3;

SELECT amount,
	   customer_id,
rank() over(order by amount desc) as r
FROM orders
where r = 1;


SELECT amount,
	   customer_id,
dense_rank() over(order by amount desc) as r
FROM orders;

SELECT customer_id,
avg(amount) over(partition by  customer_id)
FROM orders;

SELECT customer_id,
count(order_id) over(partition by  customer_id)
FROM orders;

SELECT customer_id,
		amount,
row_number() over(partition by customer_id order by amount desc)
FROM orders;

SELECT customer_id,
		amount,
row_number() over(partition by customer_id order by amount desc)
FROM orders;


-- interview q

SELECT c.customer_name, o.order_id
FROM customers c 
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is null; 

SELECT max(amount) 
FROM orders 
where amount < (
		SELECT max(amount)
        FROM orders
);

SELECT c.customer_name, sum(o.amount)
FROM customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_name;

SELECT c.customer_name, sum(o.amount)
FROM customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_name
limit 3;

SELECT product_name, sum(amount)
FROM orders
group by product_name;

SELECT product_name, sum(amount)
FROM orders
group by product_name;

SELECT product_name, sum(amount)
FROM orders
group by product_name
limit 1;

SELECT c.city , sum(o.amount)
FROM orders o
join customers c 
on o.customer_id = c.customer_id
group by c.city; 


SELECT * 
FROM orders
where amount > (
	SELECT avg(amount)
    FROM orders
);


SELECT c.customer_name , sum(o.amount)
FROM customers c 
join orders o 
on c.customer_id = o.customer_id 
group by c.customer_name
having sum(o.amount) > (
		SELECT avg(spending_amount)
        FROM(
			SELECT c.customer_name , sum(o.amount) as spending_amount
			FROM customers c 
			join orders o 
			on c.customer_id = o.customer_id 
			group by c.customer_name
        )t
); 






SELECT * FROM Customers;
SELECT * FROM Orders;




