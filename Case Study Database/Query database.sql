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
select khachhang.IDkhachhang,khachhang.hoten,hopdong.IDhopdong,count(khachhang.IDkhachhang) as solandatphong from khachhang 
left join hopdong on hopdong.IDkhachhang=khachhang.IDkhachhang
group by khachhang.IDkhachhang
order by solandatphong;

#task 5
select * , khachhang.IDkhachhang, khachhang.hoten,tenloaikhach,hopdong.IDhopdong, dichvu.tendichvu, ngaylamhopdong,ngayketthuchopdong,(dichvu.chiphithue + hopdongchitiet.soluong*dichvudikem.gia) as tongtien  from 
khachhang
left join hopdong on hopdong.IDkhachhang=khachhang.IDkhachhang
left join dichvu on hopdong.IDdichvu=dichvu.IDdichvu
left join hopdongchitiet on hopdongchitiet.IDhopdong=hopdong.IDhopdong
left join dichvudikem on hopdongchitiet.IDdichvudikem=dichvudikem.IDdichvudikem
left join loaikhach on khachhang.IDloaikhach=loaikhach.IDloaikhach
group by khachhang.IDkhachhang
order by khachhang.IDkhachhang;


#task 6
-- select dichvu.IDdichvu,tendichvu,dientich,chiphithue,tenloaidichvu
-- from dichvu
-- join loaidichvu on loaidichvu.IDloaidichvu=dichvu.IDloaidichvu
-- join hopdong on hopdong.IDdichvu=dichvu.IDdichvu
-- where not  year(hopdong.ngaylamhopdong) <> 2019 and month(ngaylamhopdong)<>1 or month(ngaylamhopdong)<>2 or month(ngaylamhopdong)<>3;

select dichvu.IDdichvu,tendichvu,dientich,chiphithue,tenloaidichvu, year(hopdong.ngaylamhopdong),month(ngaylamhopdong)
from dichvu
join loaidichvu on loaidichvu.IDloaidichvu=dichvu.IDloaidichvu
join hopdong on hopdong.IDdichvu=dichvu.IDdichvu
where   year(hopdong.ngaylamhopdong) <> 2019 and month(ngaylamhopdong) not in (1,2,3);


#task 7
select dichvu.IDdichvu,tendichvu,dientich,chiphithue,tenloaidichvu,songuoitoida
from dichvu
join loaidichvu on dichvu.IDloaidichvu=loaidichvu.IDloaidichvu
join hopdong on dichvu.IDdichvu=hopdong.IDdichvu
where year(ngaylamhopdong)=2018
group by ngaylamhopdong
having not year(ngaylamhopdong)=2019;

#task 8

select distinct * from khachhang
group by khachhang.hoten;



#task 9
select month(ngaylamhopdong) as thang, count(IDkhachhang) as solandatphong ,sum(tongtien) as doanhthu from hopdong
group by month(ngaylamhopdong);



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


#task 12
select hopdong.IDhopdong, nhanvien.hoten as tennv,khachhang.hoten as tenkh, khachhang.sodienthoai, dichvu.tendichvu, hopdongchitiet.soluong,tiendatcoc
from hopdong
join nhanvien on hopdong.IDnhanvien=nhanvien.IDnhanvien
join khachhang on hopdong.IDkhachhang=khachhang.IDkhachhang
join dichvu on hopdong.IDdichvu=dichvu.IDdichvu
join hopdongchitiet on hopdongchitiet.IDhopdong=hopdong.IDhopdong
where( month(hopdong.ngayketthuchopdong) between 10 and 12 and not month(ngaylamhopdong) between 1 and 6) and year(ngaylamhopdong)=2019 
group by hopdong.IDhopdong;

-- chua edit lai

select month(hopdong.ngayketthuchopdong) from hopdong;
select * from hopdong;

#task 13
select tendichvudikem,count(hopdongchitiet.soluong) as soluong
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
 group by  hopdong.IDhopdong
 having solansudung=1;
 
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
 -- delete nhan vien chua lap duoc hop dong nao
 delete from nhanvien 
where IDnhanvien in  (select IDnhanvien from ( select nhanvien.IDnhanvien from nhanvien
 left join hopdong on hopdong.IDnhanvien=nhanvien.IDnhanvien
group by nhanvien.IDnhanvien
 having count(hopdong.IDhopdong) =0) as temp); 


  #task 18
  
  delete from khachhang
  where IDkhachhang in (select IDkhachhang from(select khachhang.IDkhachhang from khachhang 
  join hopdong on hopdong.IDkhachhang=khachhang.IDkhachhang 
  where year(ngayketthuchopdong)=2016)as temp);
  
-- chua edit lai dinh loi contrainlt fails update


  
  
  
  
select * from hopdong;
#task 17

-- update loai khach hang  query 3 table

update khachhang
set IDloaikhach=1
where IDloaikhach in
(select IDloaikhach from
(select loaikhach.IDloaikhach from hopdong 
 join khachhang on hopdong.IDkhachhang=khachhang.IDkhachhang
join loaikhach on khachhang.IDloaikhach=loaikhach.IDloaikhach
where year(ngayketthuchopdong)=2019 and  tenloaikhach='Platinium' 
group by IDhopdong
having count(IDhopdong)>=1 and sum(tongtien)>10000000) as temp);

select * from hopdong;
select * from loaikhach;
select * from khachhang;




#task 19

update dichvudikem
set gia=gia*2
where IDdichvudikem in ( select IDdichvudikem from (select dichvudikem.IDdichvudikem,count(soluong) from dichvudikem 
join hopdongchitiet on hopdongchitiet.IDdichvudikem=dichvudikem.IDdichvudikem
join  hopdong on hopdong.IDhopdong=hopdongchitiet.IDhopdong
where year(hopdong.ngaylamhopdong)=2019
group by dichvudikem.IDdichvudikem
having count(soluong) >0) as temp );


-- update dichvudikem
-- set dichvudikem.gia=dichvudikem.gia*2
-- where dichvudikem.IDdichvudikem  in ( Select IDdichvudikem from (select dichvudikem.IDdichvudikem  from dichvudikem 
-- join hopdongchitiet on hopdongchitiet.IDdichvudikem=dichvudikem.IDdichvudikem
-- join  hopdong on hopdong.IDhopdong=hopdongchitiet.IDhopdong
-- where year(hopdong.ngaylamhopdong)=2019
-- group by dichvudikem.IDdichvudikem
-- having count(soluong) >2) as Temp);


select * from dichvudikem;




#task 20
select * from nhanvien;
select * from khachhang;
 








