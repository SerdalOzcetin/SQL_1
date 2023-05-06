--how create table
--1. way (from scratch)



CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALlINT,
student_dob DATE
);


--2. way from existing table

CREATE TABLE student_name_age
AS SELECT student_name,student_age
FROM students;


-- When creatin we can use some constraints
--Constraints:
--a) unique
--b) not null
--c) primary key
--d) foreign key
--e) check constraint

-- PRIMARY KEY can be created ın 2 ways.
--1. way
CREATE TABLE students
(
student_id SMALLINT PRIMARY KEY, --> ALL VALUE MUST BE DIFFRENT AND NULL VALUE IS NOT USED HERE.
student_name VARCHAR(50) NOT NULL, --> NULL VALUE IS NOT USED IN "student_name".
student_age SMALlINT,
student_dob DATE UNIQUE --> ALL VALUES IN "student_dob" MUST NOT DUPLICATE BUT NULL.

);

--2. way

CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALlINT,
student_dob DATE,
CONSTRAINT student_id_pk PRIMARY KEY(student_id)
);


-- HOW TO ADD FOREIGN KEY CONSTRAINT

CREATE TABLE parents
(
student_id SMALLINT,
parent_name VARCHAR(50),
phone_number CHAR(11),
CONSTRAINT student_id_pk PRIMARY KEY(student_id)

);


CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALlINT,
student_dob DATE,
CONSTRAINT student_id_fk FOREIGN KEY(student_id) REFERENCES parents(student_id)
);

--HOW TO ADD CHECK CONSTRAİNT
--Why do we use check constraints?
--A check constraint is a rule that specifies the values that are allowed in one or more columns of every row of a base table.
--For example, you can define a check constraint to ensure that all values in a column that contains ages are positive numbers.

CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALlINT,
student_dob DATE,
CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 20),  -- 0 NAD 20 INCLUDING
CONSTRAINT student_name_check CHECK(student_name = UPPER(student_name) )
);



--how to add ınfo ınto the table
CREATE TABLE students
(
student_id SMALLINT PRIMARY KEY,
student_name VARCHAR(50) UNIQUE,
student_age SMALlINT NOT NULL,
student_dob DATE,
CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 20),  -- 0 NAD 20 INCLUDING
CONSTRAINT student_name_check CHECK(student_name = UPPER(student_name) )
);

INSERT INTO students VALUES(101,'ALİ',18,'12.Dec.2000');
INSERT INTO students VALUES(102,'MEHMET',18,'12.Nov.2000');
INSERT INTO students VALUES(103,NULL,20,'12.Jul.2000');

--integer values can be used with single quote or without single quote
INSERT INTO students VALUES(105,'SEMİH',20,NULL);
INSERT INTO students VALUES('104','KENAN',20,'12.Jul.2000');
INSERT INTO students VALUES('111','BENJAMIN',20,'11.03.2002');

--HOW TO INSERT INFO INTO ANY SPECİFİC COLUMN
INSERT INTO students(student_id,student_age) VALUES(112,14);
INSERT INTO students(student_name,student_id,student_age) VALUES('JHON',119,14);

--HOW TO UPDATE THE EXİSTİNG DATA
UPDATE students
SET student_name = 'LEO'
WHERE student_id = 112;

UPDATE students
SET student_dob = '10.08.2017'
WHERE student_id = 105;

--HOW TO UPDATE MULTIPLE RECORDS
--UPDATE ALL RECORDS WITH ID LESS THAN 106 AS 06.Oct.1992
UPDATE students
SET student_dob = '06.Oct.1992'
WHERE student_id < 106;

--UPDATE ALL AGES AS THE OLDEST AGE
UPDATE students
SET student_age = (SELECT MAX(student_age) FROM students);

--UPDATE ALL DOB AS THE SMALLEST DOB
UPDATE students
SET student_dob = (SELECT MIN(student_dob) FROM students);


--TASK
--CREATE A TABLE "WORKERS" WITH WORKER_ID, WORKER_NAME, WORKER_SALARY
--SET PRIMARY KEY WITH THE NAME OF "WORKER_ID_PK" TO WORKER_ID
--INSERT 4 RECORDS
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

--SET THE JOE'S SALARY VALUE AS %20 LOWER THAN THE HIGEST ONE
UPDATE workers
SET worker_salary = (SELECT MAX(worker_salary)*0.8 FROM workers)
WHERE worker_id = 104;

--SET THE MEHMET'S SALARY VALUE AS %30 HIGHER THAN THE HIGEST ONE
UPDATE workers
SET worker_salary = (SELECT MIN(worker_salary) FROM workers)*1.3
WHERE worker_id = 102;



--ADD 1000 THE SALARYİES THAT ARE LOWER THAN AVERAGE SLARIES

UPDATE workers
SET worker_salary = worker_salary + 1000
WHERE worker_salary < (SELECT AVG(worker_salary) FROM workers);

--SET AVERAGE INTO THE SALARYİES THAT ARE LOWER THAN AVERAGE SLARIES
UPDATE workers
SET worker_salary = (SELECT AVG(worker_salary) FROM workers)
WHERE worker_salary < (SELECT AVG(worker_salary) FROM workers);


CREATE TABLE people
(
Ssn CHAR(9),
NAME VARCHAR(50),
address VARCHAR(80));


INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567898, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678961, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES (456789812, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567898123, 'California');
INSERT INTO people(ssn, name) VALUES (567898123, 'California');

--UPDATE THE NULL NAME VALUES AS "TO BE INSERTED LATER"
UPDATE people
SET name = 'to be inserted later'
WHERE name IS NULL;


----UPDATE THE NULL ADDRESS VALUES AS "TO BE INSERTED LATER"
UPDATE people
SET address = 'to be inserted later'
WHERE address IS NULL;


--HOW TO DELETE A RECORD FROM A TABLE
DELETE FROM people
WHERE ssn = '234567898';

--DELETE TEH ALL RECORDS WITHOUT NAME
DELETE FROM people
WHERE NAME = 'to be inserted later';


--DELETE ALL RECORDS. "DELETE COMMAND" DELETES ONLY RECORDS BUT NOT DELETE THE TABLE
DELETE FROM people;

--DELETE ALL NAME AND ADRDRESS WHICH ARE NULL
DELETE FROM people
WHERE name IS NULL OR address IS NULL;


--DELETE SSN VALUE THAT IS LESS THAN "123456789" AND HIGHER THAN "345678961"
DELETE FROM people
WHERE ssn > '123456789' AND ssn < '345678961';

--DELETE ALL NAMES THAT IS NOT NULL
DELETE FROM people
WHERE name IS NOT NULL;

--"TRUNCATE COMMAND" DELETS ALL RECORDS BUT LATER IT IS NOT RECOVERED.
--"DELETE COMMAND" CAN BE RECOVERED.(ROLL BACK)
TRUNCATE TABLE people;

--HOW TO DROP A TABLE FROM SCHEMAS
DROP TABLE people;


--DQL:  DATA QUER LANGUAGE. A LANGUAGE THAT IS USED TO READ DATAS.

-- TO QUERY SPECİFİC FİELD
SELECT worker_name
FROM workers;

-- TO QUERY SPECİFİC FİELDS
SELECT worker_name, worker_salary
FROM workers;

-- TO QUERY SPECİFİC RECORD
SELECT *
FROM workers
WHERE worker_id =103;

-- TO QUERY SPECİFİC RECORDS
SELECT * 
FROM workers
WHERE worker_id <103;

--TO QUERY SALARY VALUE IS '19775' AND '22100'
--1.WAY
SELECT*
FROM workers
WHERE worker_salary = 19775 OR worker_salary =22100;

--2.WAY IF YOU DONT WANT TO USE "OR" AGAIN AND AGAIN
SELECT*
FROM workers
WHERE worker_salary IN(19775,22100);


-- TO QUERY SPECİFİC CELL
SELECT worker_name
FROM workers
WHERE worker_id = 102;

-- TO QUERY RECORD WHICH HAS THE HIGHEST SALARY VALUE
SELECT *
FROM workers
WHERE worker_salary = (SELECT MAX(worker_salary) FROM workers);

-- TO QUERY RECORD WHICH HAS THE LOWEST SALARY VALUE

SELECT worker_name
FROM workers
WHERE worker_salary = (SELECT MIN(worker_salary) FROM workers);




SELECT * FROM students;
SELECT * FROM workers;
SELECT * FROM student_name_age;
SELECT * FROM people;
