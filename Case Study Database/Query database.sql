-- Query database
#task 2
use furama_resort;
select * from khachhang
where hoten  like '%H%' or'%K%' or '%T%';


#task 3
select *,(year(curdate())-year(ngaysinh)) as age
from khachhang
having  18 < age < 50 and diachi='Đà Nẵng' or diachi='Quảng Trị';

#task 4
select *, count(soluong) from khachhang 
 join hopdong on khachhang.IDkhachhang=hopdong.IDkhachhang
 join hopdongchitiet on hopdong.IDhopdong=hopdongchitiet.IDhopdong
 join loaikhach on loaikhach.IDloaikhach=khachhang.IDloaikhach
having tenloaikhach='Diamond'
order by soluong;
-- chua edit lai

#task 5 

select khachhang.IDkhachhang,khachhang.hoten, loaikhach.tenloaikhach,hopdong.IDhopdong,dichvu.tendichvu,ngaylamhopdong,ngayketthuchopdong,tongtien
from khachhang
join hopdong on hopdong.IDkhachhang=khachhang.IDkhachhang
join dichvu on dichvu.IDdichvu=hopdong.IDdichvu
join loaikhach on khachhang.IDloaikhach=loaikhach.IDloaikhach;

#task 6
select dichvu.IDdichvu,tendichvu,dientich,chiphithue,tenloaidichvu
from dichvu
join loaidichvu on loaidichvu.IDloaidichvu=dichvu.IDloaidichvu
join hopdong on hopdong.IDdichvu=dichvu.IDdichvu
where not  year(hopdong.ngaylamhopdong) <> 2019 and month(ngaylamhopdong)<>1 or month(ngaylamhopdong)<>2 or month(ngaylamhopdong)<>3;

#task 7
select dichvu.IDdichvu,tendichvu,dientich,chiphithue,tenloaidichvu,songuoitoida
from dichvu
join loaidichvu on dichvu.IDloaidichvu=loaidichvu.IDloaidichvu
join hopdong on dichvu.IDdichvu=hopdong.IDdichvu
where year(ngaylamhopdong)=2018
group by ngaylamhopdong
having not year(ngaylamhopdong)=2019;

#task 8

select distinct * from khachhang;

select * from customer
order by hoten ;

#task 9
select month(ngaylamhopdong) as thang, count(IDkhachhang) as solandatphong ,sum(tongtien) as doanhthu from hopdong
group by month(ngaylamhopdong);

select * from hopdong;

#task 10
select hopdong.IDhopdong,ngaylamhopdong,ngayketthuchopdong,tiendatcoc,count(IDhopdongchitiet) as soluongdichvudikem	from hopdong
join hopdongchitiet on hopdong.IDhopdong=hopdongchitiet.IDhopdong
group by hopdong.IDhopdong;


#task 11
select * from dichvudikem
 join hopdongchitiet on hopdongchitiet.IDdichvudikem=dichvudikem.IDdichvudikem
 join hopdong on hopdongchitiet.IDhopdong=hopdong.IDhopdong
 join  khachhang on hopdong.IDkhachhang=khachhang.IDkhachhang
 join loaikhach on khachhang.IDloaikhach=loaikhach.IDloaikhach
where loaikhach.tenloaikhach='Diamond' and khachhang.diachi='Vinh' or khachhang.diachi='Quảng Ngãi';

select * from khachhang;
select * from hopdong;
select * from hopdongchitiet;
select * from loaikhach;
select * from dichvudikem;

#task 12
select hopdong.IDhopdong, nhanvien.hoten,khachhang.hoten, khachhang.sodienthoai, dichvu.tendichvu, hopdongchitiet.soluong,tiendatcoc
from hopdong
join nhanvien on hopdong.IDnhanvien=nhanvien.IDnhanvien
join khachhang on hopdong.IDkhachhang=khachhang.IDkhachhang
join dichvu on hopdong.IDdichvu=dichvu.IDdichvu
join hopdongchitiet on hopdongchitiet.IDhopdong=hopdong.IDhopdong
where( month(hopdong.ngayketthuchopdong) between 10 and 12 and not month(ngaylamhopdong) between 1 and 6) 
group by hopdong.IDhopdong;

-- chua edit lai

select month(hopdong.ngayketthuchopdong) from hopdong;
select * from hopdong;

#task 13
select tendichvudikem,count(hopdongchitiet.soluong)
 from hopdongchitiet 
 join hopdong on hopdong.IDhopdong=hopdongchitiet.IDhopdong
 join khachhang on khachhang.IDkhachhang=hopdong.IDkhachhang
 join dichvudikem on dichvudikem.IDdichvudikem=hopdongchitiet.IDdichvudikem
 group by dichvudikem.tendichvudikem;
 
 #task 14
 
 select hopdong.IDhopdong,loaidichvu.tenloaidichvu,tendichvudikem,hopdongchitiet.soluong solansudung
 from hopdongchitiet 
 join hopdong on hopdong.IDhopdong=hopdongchitiet.IDhopdong
 join khachhang on khachhang.IDkhachhang=hopdong.IDkhachhang
 join dichvudikem on dichvudikem.IDdichvudikem=hopdongchitiet.IDdichvudikem
 join dichvu on hopdong.IDdichvu=dichvu.IDdichvu
 join loaidichvu on dichvu.IDloaidichvu=loaidichvu.IDloaidichvu
 group by dichvudikem.tendichvudikem
 having count(dichvudikem.IDdichvudikem)=1;
 
 #task 15
 
 select nhanvien.IDnhanvien,nhanvien.hoten,trinhdo,tenbophan,nhanvien.sodienthoai,nhanvien.diachi
 from nhanvien 
 join hopdong on hopdong.IDnhanvien =nhanvien.IDnhanvien
 join trinhdo on nhanvien.IDtrinhdo=trinhdo.IDtrinhdo
 join bophan on nhanvien.IDbophan=bophan.IDbophan
 group by nhanvien.IDnhanvien
 having count(IDhopdong)<=3;
 
 select * from hopdong;
 
 #task 16
 
 delete from nhanvien 
 where not (select * from nhanvien join hopdong on hopdong.IDnhanvien=nhanvien.IDnhanvien group by nhanvien.IDnhanvien
  having count(hopdong.Idhopdong) <>0);
  
  #task 18
  delete from khachhang
  where (select * from khachhang
  join hopdong on hopdong.IDkhachhang=khachhang.IDkhachhang
  having year(ngayketthuchopdong)=2016);


#task 17
update  loaikhach  
set tenloaikhach='Platium'
where tenloaikhach='Diamond' and sum(hopdong.tongtien) > 10000000 ;

#task 19

update dichvudikem
set dichvudikem.gia=dichvudikem.gia*2
where count(hopdongchitiet.IDdichvudikem)>10 and year(ngaylamhopdong)=2019;

#task 20
select * from nhanvien;
select * from khachhang;
 








