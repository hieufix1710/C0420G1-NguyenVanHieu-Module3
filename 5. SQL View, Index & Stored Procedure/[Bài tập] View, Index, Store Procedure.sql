create database  test ;

use test;
-- create table product
create table products(
Id int primary key,
productCode int (50),
productName varchar(50),
productPrice int (50),
productAmount int (50),
productDescription varchar(50),
productStatus varchar(50));

-- insert data 
insert into products
values 
(1,134,'Iphone 4',20000,20,'San pham thu hoi','null'),
(2,234,'Iphone 5',30000,20,'San pham thu hoi','null'),
(3,542,'Iphone 6',40000,20,'San pham thu hoi','null'),
(4,787,'Iphone 7',50000,20,'San pham thu hoi','null');

-- creat unique index in coumn product code
create unique index product_code_idx
on products(productCode);

-- create index prosition in two column
create  index composite_idx on products(productName,productPrice);

-- explain use
explain select * from products;

-- create view show four column 
create view show_infor as
select productCode, productName, productPrice, productStatus from products;

-- edit view 
alter view show_infor 
as 
select productCode,productName, productPrice from products;

-- delete view
drop view show_infor;

-- procedure show all information product in table
delimiter //
create procedure show_all_infor ()
begin 
select * from products;
end ; //
delimiter ;

-- call and show table
call show_all_infor;


-- drop procedure 
drop procedure show_all_infor;

-- create procedure add new product
delimiter //
create procedure add_new_product (Id int,
productCode int (50),
productName varchar(50),
productPrice int (50),
productAmount int (50),
productDescription varchar(50),
productStatus varchar(50))
begin 
alter table products ;
insert into products 
values
(Id,
productCode,
productName,
productPrice,
productAmount,
productDescription,
productStatus);
end ; //
delimiter ;

-- create procedure edit one product seaching by id
delimiter //
create procedure editProductById(in id_in int)
begin 
update products
set Id='',
productCode='',
productName='',
productPrice='',
productAmount='',
productDescription='',
productStatus=''
where id=id_in;
end ;
//
delimiter ;


