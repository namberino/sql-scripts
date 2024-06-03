create table Giangvien(
	magv varchar(50),
	hoten varchar(50),
	dienthoai varchar(10),
	makhoa varchar(20)
);

create table Khoa(
	makhoa varchar(20),
	tenkhoa varchar(20),
	dtkhoa varchar(10)
);

create table Lop(
	malop varchar(20),
	tenlop varchar(20),
	siso int,
	makhoa varchar(20)
);

create table Monhoc(
	mamh varchar(20),
	tenmh varchar(20)
);

create table Phonghoc(
	sophong int,
	chucnang varchar(20)
);

create table Lichgiangday(
	ngayday varchar(20),
	magv varchar(20),
	mamh varchar(20),
	malop varchar(20),
	sophong int
);

-- 1
select magv, hoten, sophong from Giangvien join Lichgiangday on Giangvien.magv = Lichgiangday.magv where ngayday = "2/11/2023";

-- 2
select mamh, tenmh from Monhoc where mamh in (select mamh from Lichgiangday join Phonghoc on Lichgiangday.sophong = Phonghoc.sophong where chucnang = "Da nang");

-- 3
select Khoa.makhoa, Khoa.tenkhoa, sum(Lop.siso) as total_students from Khoa join Lop on Khoa.makhoa = Lop.makhoa join Phonghoc on Lop.sophong = Phonghoc.sophong where Phonghoc.chucnang = 'Da nang' group by Khoa.makhoa, Khoa.tenkhoa having sum(Lop.siso) = (select min(total_students_count) from (select Khoa.makhoa, sum(Lop.siso) as total_students_count from Khoa join Lop on Khoa.makhoa = Lop.makhoa join Phonghoc on Lop.sophong = Phonghoc.sophong where Phonghoc.chucnang = 'Da nang' group by Khoa.makhoa) as department_counts);

-- 4
select makhoa, tenkhoa from khoa where makhoa in (select makhoa from Khoa join Lop on Khoa.makhoa = Lop.makhoa where malop in (select malop from Lichgiangday natural join Monhoc where Lichgiangday.mamh = Monhoc.mamh and tenmh = "Co so du lieu"));

-- 5
select magv, hoten, sum(siso) from Giangvien join Lichgiangday join Lop on Lichgiangday.magv = Giangvien.magv and Lichgiangday.malop = Lop.malop group by magv order by sum(siso) asc;
