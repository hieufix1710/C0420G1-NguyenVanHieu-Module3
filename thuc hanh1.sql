use database1;
create table student(
id int,
name varchar(50),
birthday date);

alter table student
modify id int primary key auto_increment;
insert into student(name,birthday)
values
 ('A','2020-12-10'),
 ('Hai','2000-12-10');
 truncate student;
select * from student;
delete from student where id='1';