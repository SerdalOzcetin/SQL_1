CREATE TABLE points
(
	name VARCHAR(50),
	point SMALLINT
);

INSERT INTO points VALUES ('Ali', 25);
INSERT INTO points VALUES ('Veli', 37);
INSERT INTO points VALUES ('Kemal', 43);
INSERT INTO points VALUES ('Ali', 36);
INSERT INTO points VALUES ('Ali', 25);
INSERT INTO points VALUES ('Veli', 25);
INSERT INTO points VALUES ('Ali', 45);
INSERT INTO points VALUES ('Veli', 11);
INSERT INTO points VALUES ('Ali', 125);

--SORT RECORDS IN INCREASING ORDER BY "name" COLUMN AND DECREASING ORDER BY "point" COLUMN
SELECT*
FROM points
ORDER BY name, point DESC;

--SORT RECORDS IN DECREASING ORDER BY "name" COLUMN AND IN INCREASING ORDER BY "points" COLUMN
SELECT*
FROM points
ORDER BY name DESC, point;



------------------------------------------------------
CREATE TABLE employees
(
employee_id CHAR(9),
employee_first_name VARCHAR(20),
employee_last_name VARCHAR(20)
);


INSERT INTO employees VALUES(14, 'Chris', 'Tae');
INSERT INTO employees VALUES(11,'John', 'Walker');
INSERT INTO employees VALUES(12, 'Amy', 'Star');
INSERT INTO employees VALUES(13,'Brad', 'Pitt');
INSERT INTO employees VALUES(15, 'Chris', 'Way');


CREATE TABLE addresses
(
employee_id CHAR(9),
street  VARCHAR(20),
city VARCHAR(20),
state char(2),
zipcode CHAR(5)
);


INSERT INTO addresses VALUES(11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses VALUES(12, '23rd Raİn 567', 'Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES(13, '5th Snow 765', 'Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES(14, '3rd Man 12', 'weston', 'MI', '12345');
INSERT INTO addresses VALUES(15, '11th Chris 12', 'St.Johns', 'FL', '32259');



--ALIASES
--HOW TO USE ALIASES FOR TABLE
--CALL 'employee_first_name' AND 'state'. AND USE THE 'firstname' FOR 'employee_first_name' AND 'employee state' FOR 'state'.

SELECT e.employee_first_name AS firstname, a.state AS "employee state"
FROM employees e, addresses a
WHERE e.employee_id = a.employee_id;

--HOW TO PUT MULTIPLE COLUMNS INTO A SINGLE COLUMN AND HOW TO USE ALIASES?
--CALL THE 'employee_id' VALUES WITH 'id' AND COMBINE THE 'employee_first_name' AND 'employee_last_name' VALUES INTO A SINGLE COLUMN NAMED 'full name'.
SELECT employee_id AS id, employee_first_name || ' ' || employee_last_name AS full_name
FROM employees;


CREATE TABLE workers
(
id	CHAR(9),
name VARCHAR(50),
state VARCHAR(50),
salary SMALLINT,
company VARCHAR(20)
);

INSERT INTO workers VALUES(123456789,'John Walker','Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890,'Brad Pitt','Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901,'Eddie Murphy','Texas', 3600, 'IBM');
INSERT INTO workers VALUES(456789012,'Eddie Murphy','Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123,'Eddie Murphy','Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012,'Brad Pitt','Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710,'Mark Stone','Pensylvania', 2500, 'IBM');



--GROUP BY
--CALCULATE THE TOTAL SALARY VALUES FOR EACH 'name' VALUES
SELECT name, SUM(salary) AS total_salary
FROM workers
GROUP BY name
ORDER BY total_salary DESC;

--CALL THE 'state' VALUES ACCORDING TO WORKER NUMBER AND ORDER THEM BY DESCENDING WAY.
SELECT state, COUNT(state) AS num_of_employee
FROM workers
GROUP BY state
ORDER BY num_of_employee DESC;

--FIND THE WORKER COUNT WHOOSE SALAR MORE THAN 2000$
SELECT company, COUNT(company) AS "number of workers"
FROM workers
WHERE salary > 2000
GROUP BY company;

--FIND THE LOWEST AND HIGHEST SALARY VALUES FOR EACH COMPANY
SELECT company, MIN(salary) AS mın_salary, MAX(salary) AS max_salary
FROM workers
GROUP BY company;

--HAVING CLAUSE:
--FIND THE TOTAL SALARY FOR EACH WORKERS WHOOSE SALARY HIGHER THAN 2500
SELECT name, SUM(salary) AS total_salary
FROM workers
GROUP BY name
HAVING SUM(salary) > 2500; --AFTER 'GROUP BY' 'WHERE' IS NOT USED BUT INSTEAD 'HAVING' CAN BE USED. 
						   -- aggregate functions are not allowed in WHERE.
						   
--FIND THE WORKER NUMBER FOR THE SATATE WHOOSE WORKER NUMBER IS MORE THAN ONE
SELECT state, COUNT(state) AS num_of_employyes
FROM workers
GROUP BY state
HAVING COUNT(state) > 1;  --HAVING IS USED FOR CLASSIFCATION AFTER 'GROUP BY'-- AND AFTER HAVING WE SHOULD USE AGGREGATE FUNCTION

--FIND THE MINUMUM SALARY VALUES MORE THAN 2000  FOR EACH COMPANY
SELECT company, MIN(salary) AS mın_salary
FROM workers
GROUP BY company
HAVING MIN(salary) > 2000;


--FIND THE MAXIMUM SALARY VALUES LESS THAN 3000  FOR EACH STATE
SELECT state, MAX(salary) AS max_salary
FROM workers
GROUP BY state
HAVING MAX(salary) <3000;


--UNION OPERATOR: IT IS USED TO COMBINE TWO QUERY RESULTS
--				  BRINGS THE COMMON VALUES AS UNIQUE
--				  IT CAN BE PUT MULTIPLE COLUMN INTO SINGLE CLOUMN 
--				  WHEN PUTTİNG MULTIPLE COLUMN INTO SINGLE CLOUMN, DATA TYPES MUST BE SAME AND DATA SIZE SHOULD NOT EXCEED CAPACITY

--FIND THE STATE WITH SALARIES HİGHER THAN 3000 AND THE NAMES WITH SALARY LESS THAN 2000 IN UNREPEATING WAY

SELECT state AS "State/Name", salary
FROM workers
WHERE salary > 3000


UNION

SELECT name, salary
FROM workers
WHERE salary < 2000;

--FIND THE STATE WITH SALARIES HİGHER THAN 3000 AND THE NAMES WITH SALARY LESS THAN 2000 IN REPEATING WAY
SELECT state AS "State/Name", salary
FROM workers
WHERE salary > 3000


UNION ALL

SELECT name, salary
FROM workers
WHERE salary < 2000;

--INTERSECT OPERATOR: BRING THE COMMON VALUES AS UNIQUE BETWEEN QUERIES
--FIND THE COMMON NAME VALUES WITH SALARY IS HIGHER THAN 2000 AND LESS THAN 2000
SELECT name
FROM workers
WHERE salary < 2000

INTERSECT

SELECT name
FROM workers
WHERE salary >1000;


--FIND THE IB,APPLE AND MICROSOFT COMMON NAME WITH SALARY IS LESS THAN 2000
SELECT name
FROM workers
WHERE salary < 2000

INTERSECT

SELECT name
FROM workers
WHERE company IN('IBM', 'APPLE', 'MICROSOFT');

--EXCEPT OPERATOR : USED TO EXTRACT ANOTHER QUERY RESULT FROM A QUERY RESULT.

--FIND THE NAME VALUES WITH SALARY IS LESS THAN 3000, NOT WORKING IN GOOGLE

SELECT name
FROM workers
where salary < 3000

EXCEPT 

SELECT name
FROM workers
WHERE company = 'GOOGLE';

--JOINS
--INNER JOIN: RETURNS THE COMMON DATAS
--LEFT JOIN: RETURNS THE TOTAL DATA OF 1. TABLE 
--RIGHT JOIN: RETURNS THE TOTAL DATA OF 2. TABLE
--FULL JOIN: RETURN THE TOTAL DATA OF BOTH TABLE
--SELF JOIN: WHEN WORKIN ON ONE TABLE IT IS WORKED AS IF THERE ARE TWO TABLE











SELECT* FROM workers;

SELECT* FROM employees;

SELECT* FROM addresses;