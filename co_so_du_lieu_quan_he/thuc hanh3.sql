use classicmodels;
select * from customers where customerName like '%A%';
select * from customers where city in ('Nantes','Las Vegas','Warszawa','NYC') 
limit 0,30;