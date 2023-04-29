CREATE TABLE workers
(
worker_id SMALLINT,
worker_name VARCHAR(50),
worker_salary SMALlINT,
CONSTRAINT worker_id_pk PRIMARY KEY(worker_id)
);

INSERT INTO workers VALUES(101,'ALİ',18000);
INSERT INTO workers VALUES(102,'MEHMET',18000);
INSERT INTO workers VALUES(103,NULL,20000);
INSERT INTO workers VALUES(104,'JOE',17000);


SELECT*
FROM workers;

--QUERY THE RECORDS WITH THE HIGEST AND LOWEST SALARY
SELECT*
FROM workers
WHERE worker_salary IN((SELECT MAX(WORKER_SALARY) FROM workers),(SELECT MIN(worker_salary)FROM workers));

--FIND THE MAX SALARY
SELECT MAX(worker_salary) AS maximum_salary
FROM workers;

--FIND THE MIN SALARY
--BY USING "AS" CAN BE CREATED TEMPORARY FIELD
SELECT MIN(worker_salary) AS minumum_salary
FROM workers;

--FIND THE AVERAGE SALARY
SELECT AVG(worker_salary)
FROM workers;

--FIND THE RECORDS COUNTS
SELECT COUNT(worker_id) AS number_of_workers
FROM workers;

--FIND THE TOTAL VALUE OF SALARIES
SELECT SUM(worker_salary) AS total_salary
FROM workers;

--INTERVIEW QUESTION
--QUERY THE 2. HIGEST SALARY

SELECT MAX(worker_salary) AS second_higest_salary
FROM workers
WHERE worker_salary < (SELECT MAX(worker_salary) FROM workers);

--INTERVIEW QUESTION
--QUERY THE 2. LOWEST SALARY

SELECT MIN(worker_salary) AS second_lowest_salary
FROM workers
WHERE worker_salary > (SELECT MIN(worker_salary) FROM workers);

--INTERVIEW QUESTION
--QUERY THE 3. HIGEST SALARY

SELECT MAX(worker_salary) AS third_higest_salary
FROM workers
WHERE worker_salary < (SELECT MAX(worker_salary)
					   FROM workers
					   WHERE worker_salary < (SELECT MAX(worker_salary) FROM workers));
					   					   

--INTERVIEW QUESTION
--QUERY THE 3. LOWEST SALARY
SELECT MIN(worker_salary) AS third_lowest_salary
FROM workers
WHERE worker_salary > (SELECT MIN(worker_salary)
                       FROM workers
                       WHERE worker_salary > (SELECT MIN(worker_salary) FROM workers));
					   SELECT MIN(worker_salary) AS third_lowest_salary
FROM workers
WHERE worker_salary > (SELECT MIN(worker_salary)
                       FROM workers
                       WHERE worker_salary > (SELECT MIN(worker_salary) FROM workers));
--QUERY RECORD WITH THE 2. HIGEST SALARY
--1.Way
SELECT *
FROM workers
WHERE worker_salary = (SELECT MAX(worker_salary) AS second_higest_salary
					   FROM workers
					   WHERE worker_salary < (SELECT MAX(worker_salary) FROM workers));
--2.Way
SELECT *
FROM workers
ORDER BY worker_salary DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;
					   
					   
					   
--QUERY RECORD WITH THE 2. LOWEST SALARY
SELECT *
FROM workers
WHERE worker_salary = (SELECT MIN(worker_salary)
					   FROM workers
					   WHERE worker_salary > (SELECT MIN(worker_salary) FROM workers));
					   
					   
					   

SELECT *
FROM workers
ORDER BY worker_salary ASC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;
					   
					   
--QUERY RECORD WITH THE 3. HIGHEST SALARY
SELECT *
FROM workers
WHERE worker_salary = 	(SELECT MAX(worker_salary)
						 FROM workers
						 WHERE worker_salary < (SELECT MAX(worker_salary)
                       							FROM workers
                      							WHERE worker_salary < (SELECT MAX(worker_salary) FROM workers)));
												
												
--2.WAY
SELECT *
FROM workers
ORDER BY worker_salary DESC
OFFSET 3 ROW
FETCH NEXT 1 ROW ONLY;
------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE customers_products
(
product_id CHAR(10),
customer_name VARCHAR(50),
product_name VARCHAR(50)
);

INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Jhon', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'Jhon', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple');

--QUERY RECORDS WITH THE PRODUCTS_NAME "ORANGE" OR "APPLE" OR "PALM"

SELECT*
FROM customers_products
WHERE product_name IN('Orange','Apple','Palm');

--QUERY RECORDS WITHOUT THE PRODUCTS_NAME "ORANGE" OR "APPLE" OR "PALM"
SELECT*
FROM customers_products
WHERE product_name NOT IN ('Orange','Apple','Palm');

--BETWEEN CONDITION
--QUERY THE RECORDS WITH PRODUCTS İD >= 20 OR <= 30

--1. WAY
SELECT*
FROM customers_products
WHERE product_id >= '20' AND product_id <= '30';


SELECT*
FROM customers_products
WHERE product_id BETWEEN '20' AND '30';


--BETWEEN CONDITION
--QUERY THE RECORDS WITHOUT PRODUCTS İD >= 20 OR <= 30

--2. WAY
SELECT*
FROM customers_products
WHERE product_id NOT BETWEEN '20' AND '30';


CREATE TABLE customers_likes
(
product_id CHAR(10),
customer_name VARCHAR(50),
liked_products VARCHAR(50)
);

INSERT INTO customers_likes VALUES (10, 'Lary', 'Orange');
INSERT INTO customers_likes VALUES (10, 'Lary', 'Orange');
INSERT INTO customers_likes VALUES (10, 'Jhon', 'Apple');
INSERT INTO customers_likes VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_likes VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES (10, 'Lary', 'Orange');
INSERT INTO customers_likes VALUES (40, 'Jhon', 'Apricot');
INSERT INTO customers_likes VALUES (20, 'Eddie', 'Apple');



--UPDATE THE RECORDS NAME AS "NO NAME" IF "LARY" EXISTS IN THE PRODUCT_NAME

UPDATE customers_likes
SET customer_name = 'No Name'
WHERE EXISTS (SELECT product_id FROM customers_likes WHERE customer_name ='Lary');









SELECT*
FROM customers_likes;




