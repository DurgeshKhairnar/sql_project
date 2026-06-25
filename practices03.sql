
CREATE DATABASE SQLPracticeDB1;
USE SQLPracticeDB1;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance'),
(104,'Marketing'),
(105,'Sales'),
(106,'Operations');

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    city VARCHAR(50),
    join_date DATE,
    FOREIGN KEY (dept_id)
    REFERENCES Departments(dept_id)
);

INSERT INTO Employees VALUES
(1,'Durgesh',101,65000,'Hyderabad','2022-01-15'),
(2,'Sai',102,50000,'Chennai','2021-05-10'),
(3,'Vishal',101,75000,'Delhi','2020-08-20'),
(4,'Rahul',103,55000,'Mumbai','2022-03-11'),
(5,'Anu',102,45000,'Pune','2023-02-01'),
(6,'Kiran',104,60000,'Bangalore','2019-11-15'),
(7,'Neha',103,58000,'Delhi','2021-04-22'),
(8,'Priya',104,62000,'Mumbai','2020-09-30'),
(9,'Amit',105,52000,'Chennai','2022-12-05'),
(10,'Pooja',105,70000,'Pune','2021-08-18');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    amount INT,
    order_date DATE,
    FOREIGN KEY (emp_id)
    REFERENCES Employees(emp_id)
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



SELECT e.emp_name ,d.dept_name,
from employees e 
join departments d 
on e.dept_id = d.dept_id;

SELECT e.emp_name , o.amount,
from employees e 
join orders o 
on e.emp_id = o.emp_id;

SELECT e.city , o.product_name 
From employees e 
join orders o 
on e.emp_id = o.emp_id;

SELECT e.emp_name , count(o.order_id)
FROM employees e 
join orders o 
on e.emp_id = o.emp_id 
group by e.emp_name; 

SELECT e.emp_name , sum(o.amount)
FROM employees e 
join orders o 
on e.emp_id = o.emp_id 
group by e.emp_name; 

SELECT e.emp_name , sum(o.amount) as am
FROM employees e 
join orders o 
on e.emp_id = o.emp_id 
group by e.emp_name
order by am desc; 

SELECT e.emp_name , count(o.order_id) as ct
FROM employees e 
join orders o 
on e.emp_id = o.emp_id 
group by e.emp_name
order by ct desc;

SELECT e.city , sum(o.amount) as am
FROM employees e 
join orders o 
on e.emp_id = o.emp_id 
group by e.city;

SELECT d.dept_id , sum(o.amount) as am
FROM departments d 
join employees e
on d.dept_id = e.dept_id 
FROM employees e 
join orders o
on o.emp_id = o.emp_id 
group by d.dept_id;

SELECT e.emp_name , d.dept_name
FROM employees e 
join departments d 
on e.dept_id = e.dept_id;

SELECT e.emp_name , o.order_id
FROM employees e 
left join orders o 
on e.emp_id = o.order_id;

SELECT e.emp_name , o.order_id
FROM employees e 
left join orders o 
on e.emp_id = o.order_id
where o.order_id is null;

SELECT e.emp_name , count(o.order_id)
FROM employees e 
left join orders o 
on e.emp_id = o.order_id
group by e.emp_name; 

SELECT d.dept_name , e.emp_name
FROM departments d  
left join employees e  
on d.dept_id = e.dept_id;

SELECT * 
FROM employees 
where salary > (
	SELECT avg(salary)
	FROM employees
);

SELECT * 
FROM employees 
where salary < (
	SELECT avg(salary)
	FROM employees
);

SELECT * 
FROM employees 
where salary  =  (
	SELECT max(salary)
	FROM employees
	where salary < (
		SELECT max(salary)
	    FROM employees
	)t
);

SELECT * 
FROM employees 
where salary > (
	SELECT salary
	FROM employees 
	where emp_name = "sai"
);

SELECT * 
FROM orders 
where amount > (
	SELECT avg(amount)
	FROM orders
);

SELECT d.dept_name , avg(e.salary) as avg_salary
from employees e 
join departments d
on e.dept_id = d.dept_id
group by d.dept_name
having avg_salary > (
			SELECT avg(cm_salary)
			FROM (
					SELECT d.dept_name , sum(e.salary) as cm_salary
					from employees e 
					join departments d
					on e.dept_id = d.dept_id
					group by d.dept_name
			)t
);

SELECT city , avg(salary) as avg_salary
from employees 
group by city
having avg_salary > (
			SELECT avg(sum_salary)
			FROM (
					SELECT city , sum(salary) as sum_salary
					from employees 
					group by city
			)t
);

SELECT e.emp_name , sum(o.amount) as am
from employees e 
join orders o 
on e.emp_id = o.emp_id
group by e.emp_name 
having am > (
		SELECT avg(sum_amount)
		FROM (
			SELECT e.emp_name , sum(o.amount) as sum_amount
			from employees e 
			join orders o 
			on e.emp_id = o.emp_id
			group by e.emp_name 
		)t
)

SELECT e.emp_name , count(o.order_id) as o_ct
from employees e 
join orders o 
on e.emp_id = o.emp_id
group by e.emp_name 
having o_ct > (
		SELECT avg(order_count)
		FROM (
			SELECT e.emp_name , count(o.order_id) as order_count
			from employees e 
			join orders o 
			on e.emp_id = o.emp_id
			group by e.emp_name 
		)t
);

SELECT d.dept_name , avg(e.salary) as avg_salary
FROM employees e 
join departments d 
on d.dept_id = e.dept_id
group by d.dept_name
order by avg_salary desc
limit 1;

// window functions

SELECT emp_name,
	   salary,
	   row_number() over(order by salary desc)
	   FROM employees;
	   
SELECT * 
FROM (
		SELECT salary,
		row_number() over(order by salary desc) r
		FROM employees;
)t
where r <= 3;	

SELECT * 
FROM (
		SELECT salary,
		row_number() over(order by salary desc) r
		FROM employees;
)t
where r = 1;  

SELECT emp_name,
	   salary,
	   rank() over(order by salary desc)
	   FROM employees;
	   
SELECT * 
FROM (
		SELECT salary,
		rank() over(order by salary desc) r
		FROM employees;
)t
where r = 1; 	

SELECT * 
FROM (
		SELECT salary,
		dense_rank() over(order by salary desc) r
		FROM employees;
)t
where r = 1;  
   
SELECT * 
FROM (
		SELECT salary,
		dense_rank() over(order by salary desc) r
		FROM employees;
)t
where r = 3;   


SELECT emp_name,
	   salary,
	   avg(salary)
	   over(Partition By salary)
	   FROM employees;
	   
SELECT emp_name,
	   dept_id,
	   count(dept_id)
	   over(Partition By dept_id)
	   FROM employees;	   
	   

SELECT * 
FROM (
		SELECT salary,
		avg(salary)
		over(Partition by salary) as avg_salary
)t
where salary > avg_salary;

SELECT order_id,
	   emp_id,
	   sum(amount)
	   over(Partition by emp_id)
	   From orders;
	   
	   
SELECT order_id,
	   emp_id,
	   avg(amount)
	   over(Partition by emp_id)
	   From orders;	   
	   
SELECT order_id,
	   emp_id,
	   count(order_id) as ct
	   avg(ct)
	   over(Partition by emp_id)
	   From orders;   
	   
SELECT order_id
	   amount,
	   sum(amount)
	   over(order by amount desc)
	   FROM orders;
	   
	   
SELECT order_id
	   count(amount)
	   over(order by order_id desc)
	   FROM orders;	 

SELECT order_id
	   amount,
	   lag(amount)
	   over(order by order_id desc)
	   FROM orders;
	   
SELECT order_id
	   amount,
	   lead(amount)
	   over(order by order_id desc)
	   FROM orders;	   
	   
SELECT order_id
	   amount,
	   amount - lag(amount)
	   over(order by order_id desc)
	   FROM orders;	   
	   

SELECT emp_id,
	   sum(amount)
	   over(order by emp_id desc)
	   FROM orders;
	   
SELECT emp_id,
	   order_id
	   order_date
	   over(order by order_date desc)
	   FROM orders;


SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM orders;
