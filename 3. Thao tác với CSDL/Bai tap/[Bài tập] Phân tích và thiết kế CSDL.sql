

create table productlines(
productline_code int (50) primary key,
text_description varchar(100)
);

create table managerment(
manager_code int(50) primary key,
name_manager varchar(50),
email varchar(50),
job_title varchar(50)
);



create table products(
product_code int(50) primary key,
name_product varchar(50),
product_vendor varchar(50),
amount int(50),
price_in int(50),
price_out int (50),
productline_code int (50),
foreign key(productline_code) references productlines(productline_code)

);
create table 	offices(
office_number int(50) primary key,
phone int(50),
country varchar(50)
);

create table employees(
employee_number int(50) primary key,
name_employee varchar(50),
email varchar(50),
job_title varchar(50),
manager_code int(50),
office_code int (50),
foreign key(manager_code) references managerment(manager_code),
foreign key(office_code) references offices(office_number)

);
create table customers(
customer_number int (50) primary key,
first_name varchar(50),
last_name varchar(50) not null,
phone int (50),
employee_code int(50),
foreign key(employee_code) references employees(employee_number)
);

create table customer_address(
address_code int (50) primary key,
addressline1 varchar(50),
addressline2 varchar(50),
customer_code int(50),
foreign key(customer_code) references customers(customer_number)
);

create table orders(
order_number int(50) primary key,
date_buy date,
ship_date date,
ship_date_reality date,
amount int(50),
order_price int (50),
customer_code int (50),
foreign key(customer_code) references customers(customer_number)
);

create table payments(
payment_code int(50),
payment_date date,
amount_money int(50),
customer_code int (50),
foreign key(customer_code) references customers(customer_number)
);





create table office_address(
office_code int(50),
foreign key (office_code) references offices(office_number)
);

create table product_order(
product_code int(50),
order_code int(50),
primary key(product_code,order_code),
foreign key(product_code) references products(product_code),
foreign key(order_code) references orders(order_code)
);



