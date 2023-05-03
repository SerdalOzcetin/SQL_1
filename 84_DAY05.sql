CREATE TABLE my_companies
(
company_id CHAR(3),
company_name VARCHAR(20)
);

INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');


CREATE TABLE orders
(

company_id CHAR(3),
order_id CHAR(3),
order_date DATE
);

INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');

--JOINS
--INNER JOIN: RETURNS THE COMMON DATAS
--LEFT JOIN: RETURNS THE TOTAL DATA OF 1. TABLE 
--RIGHT JOIN: RETURNS THE TOTAL DATA OF 2. TABLE
--FULL JOIN: RETURN THE TOTAL DATA OF BOTH TABLE
--SELF JOIN: WHEN WORKIN ON ONE TABLE IT IS WORKED AS IF THERE ARE TWO TABLE


--INNER JOIN
--QUERY 'COMPANY_NAME', 'ORDER_İD', 'ORDER_DATE' FOR COMMON COMPANİES
SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc INNER JOIN orders o
ON mc.company_id = o.company_id;

--LEFT JOIN
--QUERY ORDER_İD AND ORDER_DATE FOR MY_COMPANİES
--1. WAY
SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc LEFT JOIN orders o
ON mc.company_id = o.company_id;
--2. WAY
SELECT mc.company_name, o.order_id, o.order_date
FROM orders o  RIGHT JOIN my_companies mc
ON mc.company_id = o.company_id;

--RIGHT JOIN
--QUERY COMPANY_NAME, COMPANY_İD AND ORDER_DATE FOR ORDERS TABLE

SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc RIGHT JOIN orders o
ON mc.company_id = o.company_id;


SELECT mc.company_name, o.order_id, o.order_date
FROM orders o  LEFT JOIN my_companies mc
ON mc.company_id = o.company_id;

--FULL JOIN
--QUERY COMPANY_NAME, ORDER_İD, ORDER_DATE FOR BOTH COMPANY
SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc FULL JOIN orders o
ON mc.company_id = o.company_id;


CREATE TABLE workers
(
	id char(2),
	name VARCHAR(20),
	title VARCHAR(60),
	manager_id CHAR(2)
);


INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'Jhon Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Amgie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

--INNER JOIN:
--USING THE WORKERS TABLE, CREATE A TABLE THAT SHOWS THE MANAGERS OF THE EMPLOYEES.

SELECT employee.name, manager.name
FROM workers employee INNER JOIN workers manager
ON employee.manager_id = manager.id;


--ALTER TABLE
--1. ADD THE FIELD

ALTER TABLE workers
ADD company_ındustry VARCHAR(20);

--2. ADD FIELD WITH DEFAULT VALUE

ALTER TABLE workers
ADD worker_address VARCHAR(80) DEFAULT 'Miami, FL, USA';

--3. ADD MULTİPLE FIELDS
ALTER TABLE workers
ADD COLUMN number_of_workers CHAR(5) DEFAULT 0,
ADD COLUMN name_of_ceo VARCHAR(20);


--HOW TO DROP A TABLE

ALTER TABLE workers
DROP COLUMN name_of_ceo:

--HOW TO RENAME TABLE

ALTER TABLE workers
RENAME TO employees;

--HOW TO RENAME FIELD

ALTER TABLE workers
RENAME COLUMN company_ındustry TO company_profession;


--HOW TO MODIFY THE FIELD(CONSTRAINT, DATA TYPE CHANGES, DATA SIZE CHANGES)





SELECT*
FROM employees;


SELECT*
FROM workers;

SELECT*
FROM orders;

SELECT*
FROM my_companies;

