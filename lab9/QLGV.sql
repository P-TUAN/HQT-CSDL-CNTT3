create database QLGV
GO
USE QLGV
GO

create table HOCVIEN
(
MAHV char(5) not null,
HO varchar(40) not null,
TEN varchar(10) not null,
NGSINH smalldatetime not null,
GIOITINH varchar(3) not null,
NOISINH varchar(40) not null,
MALOP char(3) not null,
CONSTRAINT pk_HOCVIEN PRIMARY KEY(MAHV)
)

create table LOP
(
MALOP char(3) not null,
TENLOP varchar(40) not null,
TRGLOP char(5) not null,
SISO tinyint not null,
MAGVCN char(4) not null,
CONSTRAINT pk_LOP PRIMARY KEY(MALOP)
)

create table KHOA
(
MAKHOA varchar(4) not null,
TENKHOA varchar(40) not null,
NGTLAP smalldatetime not null,
TRGKHOA char(4),
CONSTRAINT pk_KHOA PRIMARY KEY(MAKHOA)
)

create table MONHOC
(
MAMH varchar(10),
TENMH varchar(40) not null,
TCLT tinyint not null,
TCTH tinyint not null,
MAKHOA varchar(4) not null,
CONSTRAINT pk_MONHOC PRIMARY KEY(MAMH)
)

create table DIEUKIEN
(
MAMH varchar(10) not null,
MAMH_TRUOC varchar(10) not null,
CONSTRAINT pk_DIEUKIEN PRIMARY KEY(MAMH,MAMH_TRUOC)
)

create table GIAOVIEN
(
MAGV char(4) ,
HOTEN varchar(40) not null,
HOCVIHOCHAM varchar(10) not null,
GIOITINH varchar(3) not null,
NGSINHNGVL smalldatetime not null,
HESO numeric(4,2) not null,
MUCLUONG money not null,
MAKHOA varchar(4) not null,
CONSTRAINT pk_GIAOVIEN PRIMARY KEY(MAGV)
)

create table GIANGDAY
(
MALOP char(3) not null,
MAMH varchar(10) not null,
MAGV char(4) not null,
HOCKY tinyint not null,
NAM smallint not null,
TUNGAYDENNGAY smalldatetime not null,
CONSTRAINT pk_GIANGDAY PRIMARY KEY(MALOP,MAMH)
)

create table KETQUATHI
(
MAHV char(5) not null,
MAMH varchar(10) not null,
LANTHI tinyint not null,
NGTHI smalldatetime not null,
DIEM numeric(4,2) not null,
KQUA varchar(10) not null,
CONSTRAINT pk_KETQUATHI PRIMARY KEY(MAHV,MAMH,LANTHI)
)
ALTER TABLE dbo.MONHOC ADD CONSTRAINT
	FK_MONHOC_KHOA FOREIGN KEY(MAKHOA) REFERENCES dbo.KHOA(MAKHOA) 
	
GO
ALTER TABLE dbo.KETQUATHI ADD CONSTRAINT
	FK_tKETQUATHI_HOCVIEN FOREIGN KEY(MAHV) REFERENCES dbo.HOCVIEN(MAHV) 
	
GO
ALTER TABLE dbo.KETQUATHI ADD CONSTRAINT
	FK_tKETQUATHI_MONHOC FOREIGN KEY(MAMH) REFERENCES dbo.MONHOC(MAMH)

GO
ALTER TABLE dbo.GIAOVIEN ADD CONSTRAINT
	FK_GIAOVIEN_KHOA FOREIGN KEY(MAKHOA) REFERENCES dbo.KHOA(MAKHOA)



GO
ALTER TABLE dbo.GIANGDAY ADD CONSTRAINT
	FK_GIANGDAY_GIAOVIEN FOREIGN KEY(MAGV) REFERENCES dbo.GIAOVIEN(MAGV) 
GO
ALTER TABLE dbo.GIANGDAY ADD CONSTRAINT
	FK_GIANGDAY_LOP FOREIGN KEY(MALOP) REFERENCES dbo.LOP(MALOP)
	
GO
ALTER TABLE dbo.GIANGDAY ADD CONSTRAINT
	FK_GIANGDAY_MONHOC FOREIGN KEY(MAMH) REFERENCES dbo.MONHOC(MAMH) 


GO
ALTER TABLE dbo.DIEUKIEN ADD CONSTRAINT
	FK_DIEUKIEN_MONHOC FOREIGN KEY(MAMH) REFERENCES dbo.MONHOC(MAMH) 

