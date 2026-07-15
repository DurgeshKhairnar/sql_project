CREATE DATABASE EmployeeDB;
USE EmployeeDB;


CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT,
    city VARCHAR(50),
    experience INT
);

INSERT INTO Employees
VALUES
(101,'Durgesh','IT',65000,24,'Hyderabad',2),
(102,'Sai','HR',50000,25,'Chennai',3),
(103,'Vishal','IT',75000,26,'Delhi',4),
(104,'Saurabh','Finance',55000,24,'Mumbai',2),
(105,'Anu','HR',45000,23,'Pune',1),
(106,'Kiran','Marketing',60000,27,'Bangalore',5),
(107,'Rahul','IT',80000,28,'Hyderabad',6),
(108,'Neha','Finance',58000,25,'Delhi',3),
(109,'Priya','Marketing',62000,26,'Mumbai',4),
(110,'Amit','HR',52000,24,'Chennai',2);

SELECT emp_name , salary FROM Employees;

SELECT * FROM Employees
WHERE 60000 > salary;

SELECT * FROM Employees
WHERE city = "Hyderabad";

SELECT * FROM Employees
WHERE age > 25;

SELECT * FROM Employees
WHERE department = "IT";

SELECT DISTINCT department FROM Employees;

SELECT * FROM Employees
ORDER BY Salary desc;

SELECT * FROM Employees
ORDER BY age asc;

SELECT * FROM Employees
ORDER BY experience;

SELECT count(*) FROM Employees;

SELECT  avg(salary)  FROM Employees;

SELECT max(salary) FROM Employees;

SELECT min(salary) FROM Employees;

SELECT sum(salary) FROM Employees;

SELECT * FROM Employees
WHERE emp_name LIKE  "A%";

SELECT * FROM Employees
WHERE emp_name LIKE "%a";

SELECT * FROM Employees
WHERE emp_name LIKE "%ra%";

SELECT * FROM Employees
WHERE salary  BETWEEN  salary > 50000 AND salary < 70000;

SELECT * FROM Employees
WHERE city In ("Chennai","Delhi");

SELECT department , count(emp_name)
FROM Employees
group by department;

SELECT department , avg(salary)
FROM Employees
group by department;

SELECT department , max(salary)
FROM Employees
group by department;

SELECT department, sum(salary)
FROM Employees
group by department;

SELECT department, count(emp_name) as a
FROM Employees
group by department
having a > 2;

SELECT department, avg(salary) as a
FROM Employees
group by department
having a < 60000; 

SET  SQL_SAFE_UPDATES = 0;

UPDATE Employees
SET salary = salary + 70000
WHERE emp_name = "Durgesh"; 

UPDATE Employees
SET salary = salary + 5000
WHERE department = "IT";

UPDATE Employees
SET city = "Hyderabad"
WHERE emp_name = 'Anu';

DELETE FROM Employees
where emp_name = "Amit";

DELETE FROM Employees
where department = "Marketing";

DELETE FROM Employees
where 2 < experience;

SELECT * FROM Employees
order by salary desc
LIMIT 1;

SELECT department, avg(salary)
FROM Employees
group by department
LIMIT 1;

SELECT emp_name, avg(salary) as a
FROM Employees
group by emp_name
having  salary < a;

SELECT city , count(emp_name) as a
FROM Employees
group by city
having a > 1;

SELECT department, emp_name FROM Employees
WHERE department = department;


SELECT * FROM Employees
order by salary desc
LIMIT 3;


SELECT * FROM Employees
order by age asc
LIMIT 1;

SELECT *
FROM Employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employees
);


SELECT *
FROM Employees
WHERE department =
(
    SELECT department
    FROM Employees
    WHERE emp_name = 'Durgesh'
);

SELECT * FROM Employees;



