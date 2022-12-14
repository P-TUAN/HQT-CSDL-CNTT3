--16 
SELECT TENSP,MASP FROM SANPHAM WHERE MASP NOT IN (SELECT MASP FROM CTHD INNER JOIN HOADON ON HOADON.SOHD = CTHD.SOHD WHERE YEAR(NGHD) = 2006)
--17
SELECT MASP, TENSP FROM SANPHAM WHERE NUOCSX = 'TRUNG QUOC' AND MASP NOT IN(SELECT MASP FROM CTHD INNER JOIN HOADON ON CTHD.SOHD = HOADON.SOHD WHERE YEAR(NGHD) = 2006)
--18
SELECT SOHD  FROM HOADON 
WHERE NOT EXISTS(SELECT * FROM SANPHAM WHERE NUOCSX = 'SINGAPORE' AND NOT EXISTS(SELECT *  FROM CTHD  WHERE CTHD.SOHD = HOADON.SOHD AND CTHD.MASP = SANPHAM.MASP))
SELECT DISTINCT CTHD.SOHD FROM CTHD 
WHERE NOT EXISTS(SELECT * FROM SANPHAM WHERE NUOCSX = 'SINGAPORE' AND NOT EXISTS(SELECT * FROM CTHD WHERE CTHD.SOHD = CTHD.SOHD AND CTHD.MASP = SANPHAM.MASP))
--19
SELECT HOADON.SOHD FROM HOADON 
WHERE YEAR(NGHD) = 2006 AND NOT EXISTS(SELECT * FROM SANPHAM WHERE NUOCSX = 'SINGAPORE' AND NOT EXISTS(SELECT * FROM CTHD WHERE CTHD.SOHD = HOADON.SOHD AND CTHD.MASP = MASP)) 
--20
SELECT COUNT(*) FROM HOADON
WHERE MAKH NOT IN(SELECT MAKH FROM KHACHHANG WHERE KHACHHANG.MAKH = HOADON.MAKH)
--21
SELECT COUNT(DISTINCT MASP)AS 'SỐ ĐƠN CỦA KHÁCH KHÔNG PHẢI THÀNH VIÊN' FROM CTHD INNER JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
WHERE YEAR(NGHD) = 2006
--22.
SELECT MAX(TRIGIA) AS 'CAO NHẤT', MIN(TRIGIA) AS 'THẤP NHẤT'
FROM HOADON
--23.
SELECT AVG(TRIGIA)AS 'TRUNG BÌNH'
FROM HOADON
--24.
SELECT SUM(TRIGIA) AS 'DOANHTHU'
FROM HOADON WHERE YEAR(NGHD) = 2006
--25.
SELECT SOHD FROM HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON)
--26.
SELECT HOTEN
FROM KHACHHANG INNER JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH  AND SOHD = (SELECT SOHD FROM HOADON WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON))
--27.
SELECT TOP 3 MAKH, HOTEN FROM KHACHHANG
ORDER BY DOANHSO DESC
--28.
SELECT MASP, TENSP FROM SANPHAM
WHERE GIA IN (SELECT DISTINCT TOP 3 GIA FROM SANPHAM ORDER BY GIA DESC)
--29.
SELECT MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'THAI LAN' AND GIA IN (SELECT DISTINCT TOP 3 GIA FROM SANPHAM ORDER BY GIA DESC)
--30.
SELECT MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'trung qupc' AND GIA IN (SELECT DISTINCT TOP 3 GIA FROM SANPHAM ORDER BY GIA DESC)
--31.
SELECT TOP 3 MAKH, HOTEN FROM KHACHHANG ORDER BY DOANHSO DESC
--32.
SELECT COUNT(DISTINCT MASP) AS 'tổng số sản phẩm của trung quoc' FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
--33.
SELECT NUOCSX, COUNT(DISTINCT MASP) AS 'Tổng số SP' FROM SANPHAM GROUP BY NUOCSX
--34.
SELECT NUOCSX, MAX(GIA) AS 'CAO NHẤT', MIN(GIA) AS 'THẤP NHẤT', AVG(GIA) AS 'TRUNG BÌNH' FROM SANPHAM GROUP BY NUOCSX
--35.
SELECT NGHD, SUM(TRIGIA) AS 'DOANH THU' FROM HOADON GROUP BY NGHD
--36.
SELECT MASP, COUNT(DISTINCT MASP) AS 'Tổng số' FROM SANPHAM
WHERE MASP IN(SELECT MASP FROM CTHD INNER JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006) GROUP BY MASP
