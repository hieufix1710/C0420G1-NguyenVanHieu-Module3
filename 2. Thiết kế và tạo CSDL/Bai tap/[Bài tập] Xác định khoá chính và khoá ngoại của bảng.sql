create database new_database;
use new_database;
create table customers(
customer_number int(50) primary key,
fullname varchar(50),
address varchar(50),
email varchar(50),
phone int(20)
);

create table accounts(
account_number int(50) primary key,
account_type varchar(20),
date_open date,
balance int (20),
customer_number int(50),
foreign key (customer_number) references customers(customer_number)
);

create table transactions(
tran_number int primary key,
account_number int(50),
date_tran date,
amounts int (20),
description_tran varchar(50),
account_num int(50),
foreign key(account_num) references accounts(account_number)
);