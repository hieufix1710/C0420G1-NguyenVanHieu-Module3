
-- Insert data

use furama_resort;
insert into bophan
values
(1,'Sale'),
(2,'Hành chính'),
(3,'Phục vụ'),
(4,'Quản lý');

insert into kieuthue
values 
(1,'Ngày',2000000),
(2,'Tuần',14000000),
(3,'Tháng',60000000);

insert into loaidichvu
values
(1,'Villa'),
(2,'House'),
(3,'Room');



insert into loaikhach
values
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');
insert into trinhdo
values
(1,'Trung Cấp'),
(2,'Cao Đẳng'),
(3,'Đại Học'),
(4,'Sau Đại Học');

insert into vitri
values 
(1,'Lễ Tân'),
(2,'Phục Vụ'),
(3,'Chuyên Viên'),
(4,'Giám sát'),
(5,'Quản lý'),
(6,'Giám Đốc');


insert into dichvu
values
(1,'Villa',100,4,20,10000000,1,1,'Còn phòng'),
(2,'House',100,4,20,5000000,1,1,'Còn phòng'),
(3,'Room',100,4,20,3000000,1,1,'Còn phòng');

insert into dichvudikem
values
(1,'Karaoke',200000,1,'trống'),
(2,'Thức ăn',200000,1,'trống'),
(3,'Massage',200000,1,'trống'),
(4,'Nước uống',200000,1,'trống'),
(5,'Thuê xe',200000,1,'trống');



insert into khachhang 
values 
(1,1,'Nguyễn Văn Hiếu','1999-10-17',123432443,'0898606234','Hieuxx@gmail.com','Đà Nẵng'),
(2,2,'Trần Văn Hải','2000-10-15',123432443,'0898606234','haha@gmail.com','Quảng Trị'),
(3,3,'Nguyễn Chí Trung','2001-10-01',123432443,'0898606234','hehe@gmail.com','Quảng Bình'),
(4,4,'Tôn Quang Hải','1998-10-05',123432443,'0898606234','ggegeg@gmail.com','Quảng Nam'),
(5,2,'Lê Văn Minh','1965-10-28',123432443,'0898606234','eheksdhf@gmail.com','Quảng Ngãi'),
(6,3,'Võ Trường Vũ','1964-10-19',123432443,0898606234,'sffdf@gmail.com','Hồ Chí Minh');




insert into nhanvien
values
(1,'Nguyễn Đăng Hải',1,2,1,'2001-12-10',12342343,2000000,'0985567004','Hsfuef@gmail.com','Đà Nẵng'),
(2,'Trần Đăng Hải',1,2,1,'2001-08-10',12342343,3000000,'09855678854','Hsfuef@gmail.com','Đà Nẵng'),
(3,'Nguyễn Bích Trân',1,2,1,'2001-07-10',12342343,4000000,'098556754','Hsfuef@gmail.com','Đà Nẵng'),
(4,'Nguyễn Vũ Nhật',1,2,1,'2001-12-06',12342343,5000000,'0985567884','Hsfuef@gmail.com','Đà Nẵng');

insert into hopdong
values
(1,1,1,1,'2020-12-10','2020-12-30',2000000,5000000),
(2,2,2,3,'2020-08-10','2020-12-30',2000000,5000000),
(3,2,2,2,'2020-07-10','2018-12-30',2000000,5000000),
(4,1,4,1,'2020-05-10','2020-12-30',2000000,5000000),
(5,2,1,1,'2020-07-10','2019-12-30',2000000,5000000),
(6,1,5,1,'2019-03-10','2020-12-30',2000000,5000000),
(7,2,1,1,'2020-05-10','2018-12-30',2000000,5000000),
(8,1,6,1,'2018-09-10','2020-12-30',2000000,5000000),
(9,2,3,1,'2019-10-10','2019-12-30',2000000,5000000);
insert into hopdongchitiet
values 
(1,1,2,2),
(2,2,1,2),
(3,4,2,2),
(4,3,1,2);
