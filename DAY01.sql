--DDL -DATA DEFİNİTİON LANGUAGE
--CREATING TABLE
create table students
(
	students_no char(8),
	firstname varchar(30),
	surname varchar(30),
	grade_point_average real,
	registration_date date
);

--create table from existing tables
create table students_average
as
select students_no,firstname, registration_date
from students;

--DATA MANUPULATION LANGUAGE
--INSERT(TO ADD DATA INTO DATABASE)

INSERT INTO STUDENTS VALUES ('12345678','SERGIO','RAMOS',80.6,NOW());
INSERT INTO STUDENTS VALUES ('12345678','SERGIO','RAMOS',80.6,'2021-12-09');

--IF WEWANT TO ADD PARTİAL DATA INTO A TABLE

INSERT INTO STUDENTS (students_no,grade_point_average) VALUES('87654321',92.6);

--DQL - DATA QUERY LANGUAGE
--SELECT

SELECT*FROM students;

