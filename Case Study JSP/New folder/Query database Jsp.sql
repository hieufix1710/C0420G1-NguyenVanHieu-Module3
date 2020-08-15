use furama_resort;

delimiter //
create procedure findAll()
begin
select IDkhachhang,loaikhach.tenloaikhach,hoten,ngaysinh,CMND,sodienthoai,email,diachi from khachhang
join loaikhach on khachhang.IDloaikhach=loaikhach.IDloaikhach;
end;
// delimiter ;


delimiter //
create procedure updateInfor(idIns int,nameIns varchar(50),birthday varchar(50),CMNDIns varchar(50),numberPhone  varchar(50),emailIns varchar(50),address varchar(50),idType int)
begin
update khachhang
set hoten=nameIns,ngaysinh=birthday,CMND=CMNDIns,sodienthoai=numberPhone,email=emailIns,diachi=address,IDloaikhach=idType
where IDkhachhang=idIns ;
end ;
// delimiter //



delimiter //
create procedure deleteCustomer(idIns int)
begin 

if exists (select IDkhachhang from hopdong where IDkhachhang=idIns)
then
delete from  hopdong
where hopdong.IDkhachhang=idIns;
end if;
delete from khachhang 
where IDkhachhang=idIns;
end ;
// delimiter ;


-- select IDdichvu,tendichvu,dientich,sotang,songuoitoida,chiphithue,IDkieuthue,IDloaidichvu,trangthai from dichvu;

delimiter //
create procedure addNewService(idIns int, name varchar(50),area double,numberFloor int,maxpeople int,feeRent double,idTypeRent int,idTypeService int,status varchar(50))
begin 
insert into dichvu
values 
(idIns,name,area,numberFloor,maxpeople,feeRent,idTypeRent,idTypeService,status);
end ;
// delimiter ;
	
-- call addNewService(4,"Resort",100,5,20,10000000,1,1,"con")

-- select * from kieuthue;
-- select * from loaidichvu;

-- select * from nhanvien;
-- select * from vitri;
-- select * from trinhdo;
-- select * from bophan;

delimiter //
create procedure showListEmployee()
begin
select IDnhanvien,hoten,IDvitri,IDtrinhdo,IDbophan,ngaysinh,CMND,luong,sodienthoai,email,diachi from nhanvien ;
end ;
// delimiter ;

delimiter //
create procedure updateEmployee(idIns int,nameIns varchar(50),idvitri int,idTrinhdo int,idBophan int,birthday date,cmnd int,salary double,phone varchar(50),emailIns varchar(50),address varchar(50))
begin 
update nhanvien
set hoten=nameIns,IDvitri=idVitri,IDtrinhdo=idTrinhdo,IDbophan=idbophan,ngaysinh=birthday,CMND=cmnd,luong=salary,sodienthoai=phone,email=emailIns,diachi=address
where IDnhanvien=idIns ;
end ;
// delimiter ;



delimiter //
create procedure deleteEmployee(id int)
begin
delete from hopdong
where IDnhanvien=id;
delete from user
where IDnhanvien=id;
delete from nhanvien
where IDnhanvien=id;
end ;
// delimiter ;

