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
1. way
CREATE TABLE students
(
student_id SMALLINT PRIMARY KEY, --> ALL VALUE MUST BE DIFFRENT AND NULL VALUE IS NOT USED HERE.
student_name VARCHAR(50) NOT NULL, --> NULL VALUE IS NOT USED IN "student_name".
student_age SMALlINT,
student_dob DATE UNIQUE --> ALL VALUES IN "student_dob" MUST NOT DUPLICATE BUT NULL.

);

2. way

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




SELECT * FROM students;

SELECT * FROM student_name_age;

