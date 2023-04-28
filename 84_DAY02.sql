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
                       WHERE worker_salary > (SELECT MIN(worker_salary) FROM workers);
					   
--QUERY RECORDS WITH THE 2. HIGEST SALARY
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
