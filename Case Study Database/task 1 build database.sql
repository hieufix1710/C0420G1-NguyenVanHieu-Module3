create database furama_resort;
use  furama_resort;



create table vitri(
IDvitri int primary key,
tenvitri varchar(45)
);

create table trinhdo(
IDtrinhdo int primary key,
trinhdo varchar (45)
);

create table bophan(
IDbophan int primary key,
tenbophan varchar (45)
);

create table dichvudikem(
IDdichvudikem int primary key,
tendichvudikem varchar(45),
gia double,
donvi int,
trangthaikhadung varchar(45)
);

create table loaikhach(
IDloaikhach int primary key,
tenloaikhach varchar(45)
);

create table loaidichvu(
IDloaidichvu int primary key,
tenloaidichvu varchar(45)
);

create table kieuthue(
IDkieuthue int primary key,
tenkieuthue varchar(45),
gia double
);



create table khachhang(
IDkhachhang int primary key,
IDloaikhach int,
hoten varchar (45),
ngaysinh date,
CMND int,
sodienthoai varchar(45),
email varchar(45),
diachi varchar(45),
foreign key(IDloaikhach) references loaikhach(IDloaikhach)
);
create table nhanVien (
IDnhanvien int primary key,
hoten varchar(45),
IDvitri int,
IDtrinhdo int,
IDbophan int,
ngaysinh date,
CMND int,
luong double,
sodienthoai varchar(45),
email varchar(45),
diachi varchar(45),
foreign key(IDvitri) references vitri(IDvitri),
foreign key(IDtrinhdo) references trinhdo(IDtrinhdo),
foreign key(IDbophan) references bophan(IDbophan)
);


create table dichvu(
IDdichvu int primary key,
tendichvu varchar(45),
dientich double,
sotang int,
songuoitoida int,
chiphithue double,
IDkieuthue int,
IDloaidichvu int,
trangthai varchar(45),
foreign key(IDkieuthue) references kieuthue(IDkieuthue),
foreign key(IDloaidichvu) references loaidichvu(IDloaidichvu)
);

create table hopdong(
IDhopdong int primary key,
IDnhanvien int,
IDkhachhang int,
IDdichvu int,
ngaylamhopdong date,
ngayketthuchopdong date,
tiendatcoc double,
tongtien double,
foreign key (IDnhanvien) references nhanvien(IDnhanvien),
foreign key (IDkhachhang) references khachhang(IDkhachhang),
foreign key (IDdichvu) references dichvu(IDdichvu)
);

create table hopdongchitiet(
IDhopdongchitiet int primary key,
IDhopdong int,
IDdichvudikem int,
soluong int,
foreign key(IDhopdong) references hopdong(IDhopdong),
foreign key (IDdichvudikem) references dichvudikem(IDdichvudikem)
);











