create database my_database;

use my_database;

create table student(
student_number int (50) primary key,
name_student varchar(50),
address varchar(50),
email varchar(50),
image varchar(50)
);

create table type_of_book(
id int (50) primary key
);

create table card(
id_card int (50) primary key,
id_student int(50),
foreign key (id_student) references student(student_number)
);

create table book(
book_code int(50) primary key,
name_book varchar(50),
id_type int(50),
id_card int(50),
foreign key (id_type) references type_of_book(id),
foreign key (id_card) references card(id_card)

);

