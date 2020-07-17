create database codegym_management;
use codegym_management;

 
 create table instructor(
 id int(50) primary key,
 `name` varchar(50),
 birthday date
 );
 
 create table type_of_class(
	id int(50) primary key,
    `name` varchar(20)
   );
    
create table class(
 id int(50) primary key,
 name varchar(50),
 type_class int(50),
 
 
 foreign key(type_class) references type_of_class(id)
 );
 
  create table student(
 id int(50) primary key,
 name varchar(50),
 birthday date,
 class_id int (50),
 foreign key(class_id) references class(id)
 );
 
    
create table instructor_teach_class(
instructor_id int (50),
class_id int (50),
primary key(instructor_id,class_id),
foreign key(instructor_id) references instructor(id),
foreign key(class_id) references class(id)
);

insert into student(id,name,birthday,class_id)
values (1,'Hieu','2000-12-10',1),
 (2,'Hai','2001-12-10',2),
 (3,'Ngan','2002-04-12',3),
 (4,'Hoa','2007-06-17',4),
 (5,'Hue','2005-08-19',5);
 
 insert into instructor(id,name,birthday)
values (1,'Tien','2002-12-10'),
 (2,'Dang','2003-11-12'),
 (3,'Hien','2005-05-22'),
 (4,'Vy','2007-03-12'),
 (5,'Trang','2009-12-24');
 
 insert into type_of_class(id,name)
 values
 (1,'KHTN'),
 (2,'KHXH');
 
 
 insert into class(id,name,type_class)
 values
 (1,'C0420G1',1),
 (2,'C0520G2',2),
 (3,'C1204H1',2),
 (4,'C09H1G7',1),
 (5,'C06GH12',2),
 (6,'C0420G1',1);
 
-- query information in all table 
use codegym_management;

select student.id,student.name,student.birthday,class.name,type_of_class.name from student
join class on student.class_id=class.id
join type_of_class on type_of_class.id=class.type_class
order by student.id;


 
 
