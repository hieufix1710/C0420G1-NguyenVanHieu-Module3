create database new_database;
use new_database;
create table hoc_vien(
id int(50) primary key,
name_student varchar(50),
age int(3),
name_corses varchar(5),
amount_money int(30)
);

insert into hoc_vien(id,name_student,age,name_corses,amount_money)
values
(1,'Hoang',21,'CNTT',400000),
(2,'Viet',19,'DTVT',320000),
(3,'Thanh',18,'KTDN',400000),
(4,'Nhan',19,'CK',450000),
(5,'Huong',20,'TCNH',500000),
(6,'Huong',20,'TCNH',20000);

select * from hoc_vien
where name_student='Huong';

select amount_money from hoc_vien
where name_student='Huong';

select * from hoc_vien
group by name_student;

