﻿SELECT TENPHG, COUNT(*) AS 'Số lượng đề án' FROM PHONGBAN, DEAN
WHERE MAPHG=PHONG
GROUP BY TENPHGD