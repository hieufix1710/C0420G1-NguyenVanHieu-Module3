create database new_database;

/*create table users with primary key is id*/
create table users(
id int (10) not null auto_increment primary key,
username varchar(30) not null,
password varchar(100) not null,
email varchar(100) not null);


   
 
   

/*create primary key then edit table*/
alter table users
add primary key(id);



