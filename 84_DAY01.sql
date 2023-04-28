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
CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 20),--0 NAD 20 INCLUDING
CONSTRAINT student_name_check CHECK(student_name = UPPER(student_name) )
	
);





SELECT * FROM students;

SELECT * FROM student_name_age;

