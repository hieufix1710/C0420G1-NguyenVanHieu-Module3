use codegym_management ;


-- build view show info of student  
create view show_infor as
select student.id,student.name,student.account,class.name 'class name' from student
join class on student.class_id=class.id;

-- call view 
select * from show_infor;