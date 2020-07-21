use classicmodels;
-- build procedure to get customer by id 
 delimiter //
 create procedure getCusbyId( in cusNum int(11))
 begin 
 select * from customers where customerNumber=cusNum;
 end ;
 //
 delimiter ;
 -- call procedure 
 call getCusById(175);
 
 
 -- build procedure get customer infor by city 
 delimiter //
 create procedure GetCustomersCountByCity(in in_city varchar(50),
 out total int)
-- variable into total is user defind
 begin 
 select count(customerNumber)  into total  
 from customers where city= in_city ;
 
 end; //
 delimiter ;
 
 call GetCustomersCountByCity('Lyon',@total);
 
 
 -- build procedure set counter 
 delimiter //
 create procedure setCounter(inout counter int,in inc int)
 begin 
 set counter =counter+ inc ;
 end  //
 delimiter ;
 -- set value for counter and inc is user defind 
 set @counter=1;
 call setCounter(@counter,1);
 select @counter;