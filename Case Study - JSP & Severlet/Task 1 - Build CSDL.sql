create database furama_resort;
use furama_resort;


create table customer_type(
customer_type_id 	int primary key,
customer_type_name varchar(45)
);
 create table rent_type(
 rent_type_id int primary key,
 rent_type_name varchar(45),
 rent_type_code double
 );
 
 create table attach_service(
 attach_service_id int primary key,
 attach_service_name varchar(45),
 attach_service_cost double,
 attach_service_unit int,
 attach_service_status varchar(45)
 );
 

create table customer(
customer_id int primary key,
customer_type_id int,
customer_name varchar(45),
customer_birthday date,
customer_gender bit(1),
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_address varchar(45),	
foreign key (customer_type_id) references customer_type(customer_type_id)
);

create table service_type(
	service_type_id int primary key,
    service_type_name varchar(45)
);

create table position_employee(
position_id int primary key,
position_name varchar(45)
);

create table education_degree(
education_degree_id int primary key,
education_degree_name varchar(45)
);
 
 create table division(
 division_id int primary key,
 division_name varchar(45)
 );
 
 create table user(
 user_name varchar(255) primary key,
 password varchar(255)
 );
 
 create table role(
 role_id int primary key,
 role_name varchar(255)
 );
 
 
create table service(
service_id int primary key,
service_name varchar(45),
service_area int,
service_code double,
service_max_people int,
rent_type_id int,
service_type_id int,
standard_room varchar(45),
description_other_convenionce varchar(45),
pool_area double,
number_of_floors int,
foreign key (rent_type_id) references rent_type(rent_type_id),
foreign key (service_type_id) references service_type(service_type_id)

);

create table employee(
employee_id int primary key,
employee_name varchar(45),
employee_birthday date,
employee_id_card varchar(45),
employee_salary double,
employee_phone varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int,
education_degree_id int,
division_id int,
username varchar(255),
foreign key (position_id) references position_employee(position_id),
foreign key (education_degree_id) references education_degree(education_degree_id),
foreign key (division_id) references division(division_id),
foreign key (username) references user(user_name)

);



create table contract(
contract_id int primary key,
contract_start_date date,
contract_end_date date,
contract_deposit double,
contract_total_money double,
employee_id int,
customer_id int,
service_id int,
foreign key(employee_id) references employee(employee_id),
foreign key(customer_id) references customer(customer_id),
foreign key(service_id) references service(service_id)
);

 
 create table user_role(
 user_name varchar(255),
 role_id int,
primary key(user_name,role_id),
foreign key(user_name) references user(user_name),
foreign key(role_id) references role(role_id)
 );
 
 create table contract_detail(
 contract_detail_id int primary key,
 contract_id int,
 attach_service_id int,
 quanlity int,
 foreign key (attach_service_id) references attach_service(attach_service_id),
 foreign key (contract_id) references contract(contract_id)
 );
 
 
 
