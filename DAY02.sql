create table students
(
	students_no char(8),
	firstname varchar(30),
	surname varchar(30),
	grade_point_average real,
	registration_date date
);

create table notes
as
select students_no, grade_point_average real,	registration_date date
from students

insert into notes values (56565656,89.9,now());

select * from notes;

insert into notes values (56565606,84.4,now());
insert into notes values (56567656,34.5,now());
insert into notes values (56865656,23.6,now());
insert into notes values (56564656,45.8,now());
insert into notes values (56568956,67.7,now());
insert into notes values (90565656,86.4,now());
insert into notes values (56785656,83.5,now());

select students_no from notes;

--CONSTRAINT
--UNIQEU