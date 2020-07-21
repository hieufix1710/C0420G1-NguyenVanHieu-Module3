use classicmodels;

select * from customers where customerNumber=175;

explain select * from customers where customerNumber=175;

	alter table customers add index idx_fullname(contactFirstName,contactLastName) ;
	explain select * from customers where contactFirstName='Jean' or contactLastName='King';
    
 
    
    
