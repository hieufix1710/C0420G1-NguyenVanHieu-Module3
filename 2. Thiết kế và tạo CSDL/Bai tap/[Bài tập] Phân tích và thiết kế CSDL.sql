create database nes;
use nes;


create table product_line(
product_line int(50) primary key,
description varchar(50)
);

create table offices(
office_code int (50) primary key,
address varchar(50),
phone int(50),
country varchar(50)
);

create table managerment(
managerment_code int(50) primary key
);

create table products(
product_code int (50) primary key,
name_product varchar(50),
name_supplier varchar(50),
amounts int(50),
price_in int(50),
price_pay int (50),
product_line int(50),
foreign key (product_line) references product_line(product_line)
);

create table employees(
employee_number int (50) primary key,
name_employee varchar(50),
email varchar(50),
name_job varchar(40),
managerment int(50),
office_code int(50),
foreign key (managerment) references managerment(managerment_code),
foreign key(office_code) references offices(office_code)

);

create table customers(
customer_number int(50) primary key,
name_customer varchar(30),
phone int (20),
address varchar(50),
employee_code int(50),
foreign key (employee_code) references employees(employee_number)
);

create table orders(
order_number int(50) primary key,
day_buy date,
day_ship date,
day_ship_reality date,
amount int(50),
amount_order int(50),
price int (50),
customer_code int (50),
foreign key(customer_code) references customers(customer_number)
);

create table payments(
payment_code int(50) primary key,
date_payment date,
price int(50),
customer_code int (50),
foreign key(customer_code) references customers(customer_number)
);

create table product_order(
product_code int(50),
order_code int (50),
primary key(product_code,order_code),
foreign key(product_code) references products(product_code),
foreign key(order_code) references orders(order_number)
);

