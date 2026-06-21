CREATE DATABASE WindowDB;
USE WindowDB;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    join_date DATE
);

INSERT INTO Employees VALUES
(1,'Durgesh',101,'IT',65000,'Hyderabad','2022-01-15'),
(2,'Sai',102,'HR',50000,'Chennai','2021-05-10'),
(3,'Vishal',101,'IT',75000,'Delhi','2020-08-20'),
(4,'Rahul',101,'IT',80000,'Mumbai','2019-07-12'),
(5,'Anu',102,'HR',45000,'Pune','2023-02-01'),
(6,'Kiran',103,'Finance',60000,'Bangalore','2019-11-15'),
(7,'Neha',103,'Finance',60000,'Delhi','2021-04-22'),
(8,'Priya',104,'Marketing',62000,'Mumbai','2020-09-30'),
(9,'Amit',104,'Marketing',62000,'Chennai','2022-12-05'),
(10,'Ravi',105,'Sales',70000,'Hyderabad','2021-06-15'),
(11,'Pooja',105,'Sales',70000,'Pune','2020-03-10'),
(12,'Arjun',105,'Sales',55000,'Delhi','2022-08-25');

SELECT emp_name,
		row_number() over(order by salary desc) as rn
        FROM employees;
        
SELECT *
FROM (
		SELECT emp_name,
				salary,
                row_number() over(order by salary desc) rn 
                FROM employees
        )t
        where rn = 1;
        
 
SELECT emp_name,
		salary,
        Rank() over(order by salary desc) rnk
        FROM Employees;
        
SELECT emp_name,
	   salary,
       dense_rank() over(order by salary desc)dr
       FROM employees;
 
 SELECT emp_name,
		dept_id,
        salary,
        round(avg(salary) over(partition by dept_id),2) dept_avg
        FROM Employees;
       
       
SELECT *
FROM(
	SELECT emp_name,
			dept_id,
            salary,
            avg(salary) over(partition by dept_id) as dept_avg
            FROM employees
)t
where salary > dept_avg;       
  
SELECT emp_name,
	   salary,
       sum(salary)
       over(order by join_date) running_data
       FROM Employees;
 
 SELECT emp_id,
		salary,
        lag(salary) over(order by emp_id) as previous_salary
        FROM Employees;

SELECT emp_id,
	   salary,
       lead(salary) over(order by salary desc) as next_salary
       FROM employees;
        

SELECT * FROM Employees;