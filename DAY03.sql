create table suppliers(
	supplier_id char(5) primary key,
	supplier_name varchar(20),
	supplier_surname varchar(20)
	
);

create table products02(
	supplier_id char(5),
	product_id char(5),
	foreign key (supplier_id) references suppliers (supplier_id)
);

select * from suppliers;
select * from products02;

--example

create table employees (
	employees_id char(4) primary key,
	employees_name varchar(10) not null,
	employees_salary real,
	start_date date
);

create table addresses (
	address_id char(4),
	street varchar(8),
	avenues varchar(8),
	city varchar(10),
	foreign key (address_id) references employees (employees_id)
);
