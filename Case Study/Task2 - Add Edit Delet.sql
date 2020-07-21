use furama_resort;

-- add new customer
delimiter //
create procedure add_new_customer(customerId int,customerTypeId int ,customerName varchar(45),customerBirthday date,customerGender bit(1),customerIdCard varchar(45),customerPhone varchar(45),customerEmail varchar(45),customerAddress varchar(45))
begin 
insert into customer
values 
(customerId,customerTypeId,customerName,customerBirthday,customerGender,customerIdCard,customerPhone,customerEmail
,customerAddress);
end ; //
delimiter ;

-- show all information customer
delimiter //
create procedure show_infor()
begin 
select * from customer;
end ;
//
delimiter ;

-- add new service
delimiter //
create procedure add_service(serviceID int, serviceName varchar(45),serviceArea int ,serviceCost double, seviceMaxPeople int, rentTypeId int,serviceTypeId int, standardRoom varchar(45),
descriptionOtherConvenience varchar(45),poolArea double,numberOfFloors int) 
begin
insert into service
values
(serviceID, serviceName,serviceArea  ,serviceCost , seviceMaxPeople , rentTypeId ,serviceTypeId , standardRoom,
descriptionOtherConvenience ,poolArea ,numberOfFloors );
end ;
//
delimiter ;

-- add new employee 
delimiter //
create procedure add_new_employee(employeeId int, employeeName varchar(45),employeeBirthday date,employeeIdCard varchar(45),employeeSalary double,
employeePhone varchar(45),employeeEmail varchar(45),employeeAddress varchar(45), positionId int,educationDegree int,userName varchar(255))
begin
insert into employee
values
(employeeId , employeeName ,employeeBirthday ,employeeIdCard ,employeeSalary ,
employeePhone,employeeEmail ,employeeAddress, positionId ,educationDegree ,userName );
end;
//
delimiter ;

-- add new contract 
delimiter //
create procedure add_new_contract(contractId int, contractStartDate date,contractEndDate date,contractDeposit double,contracttotalMoney double,
employeeId int, customerId int,serviceId int)
begin
insert into contract
values (contractId , contractStartDate ,contractEndDate ,contractDeposit ,contracttotalMoney ,
employeeId , customerId ,serviceId );
end ;
//
delimiter ;


-- add contract detail

delimiter //
create procedure add_contract_detail(contractDetailId int,contractId int,attachServiceId int,quanlity int)
begin
insert into contract_detail
values 
(contractDetailId ,contractId ,attachServiceId ,quanlity );
end ;
//
delimiter ;


-- display customer useing service at resort
delimiter //
create procedure display_customer_using()
begin
select * ,service.service_name,service_type.service_type_name from customer 
join contract on contract.customer_id=customer.customer_id
join service on contract.service_id=service.service_id
join customer_type on customer.customer_type_id=customer_type.customer_type_id ;
end ;
//
delimiter ;




	