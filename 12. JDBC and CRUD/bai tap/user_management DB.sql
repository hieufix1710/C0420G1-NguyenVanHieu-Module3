create database user_management;
use user_management;

create table users(
id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users (name,email,country)
values
("Hieu","Hieu@gmail.com","DN"),
("Hai","Hai@gmail.com","HN"),
("Chuong","chuong.aa@gmail.com","HCM"),
("Van","van.hh@gmail.com","HP"),
("Hien","hein.aa@gmail.com","DN");

 delimiter //
create procedure findByCountry(countryIn varchar(50))
begin
select id,name,email,country from users
where country like countryIn;
end ;
 // delimiter ;
 
 drop procedure findByCountry;

 
 call  findByCountry("DN");
 
 delimiter //
 create procedure orderByName()
begin
select id,name,email,country from users
order by name ;
end; 
// delimiter ;

call orderByName();



select * from users;

truncate table users;