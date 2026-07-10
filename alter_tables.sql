CREATE DATABASE College;

USE College;

CREATE TABLE Students(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT  "Unknown"
);



INSERT INTO Students
(id,name,age,city)
VALUES(1,"Durgesh",21,"Malegoan"),
(2,"Vishal",22,"Dyane"),
(3,"Saurabh",23,"Nashik"),
(4,"Jayesh",24,"Mumbai"),
(5,"Sahil",25,"Pune");


DELETE FROM students
Where id = '1';

truncate Table students;

DROP table students;

ALTER TABLE Students
ADD email INT;

ALTER TABLE Students
DROP column email;

ALTER TABLE Students
modify name varchar(100);

ALTER TABLE Students
RENAME column name TO Student_name;

ALTER TABLE Students
RENAME TO StudentData;

ALTER TABLE StudentData
Add primary key(age);

ALTER TABLE Students
modify email varchar(50) default "example@gmail.com";

SELECT * FROM StudentData;














-- SELECT name FROM Students;

-- SELECT * FROM Students
-- WHERE age > 21;

-- SELECT * FROM Students
-- WHERE city="Mumbai";

-- SELECT * FROM Students
-- ORDER BY age asc;

-- UPDATE Students
-- SET city = "Delhi"
-- WHERE id = 1;

-- TRUNCATE TABLE Students;

-- SELECT * FROM Students;

-- SELECT distinct city
-- FROM Students;

-- UPDATE Students
-- SET age = age + 1;

-- DELETE FROM Students
-- WHERE id = 1;




































