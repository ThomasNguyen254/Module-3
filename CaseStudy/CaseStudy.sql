create database FurumaManagement;
use FurumaManagement;

create table vi_tri(
    ma_vi_tri int not null primary key ,
    ten_vi_tri varchar(50)
);

create table trinh_do(
    ma_trinh_do int not null primary key ,
    ten_trinh_do varchar(50)
);

create table bo_phan(
    ma_bo_phan int not null primary key ,
    ten_bo_phan varchar(50)
);

create table nhan_vien(
    ma_nhan_vien int not null primary key ,
    ho_ten varchar(50),
    ngay_sinh date,
    so_cmnd varchar(50),
    luong double,
    so_dien_thoai varchar(50),
    email varchar(50),
    dia_chi varchar(50),
    ma_vi_tri int,
    ma_trinh_do int,
    ma_bo_phan int,
    foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
    foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
    foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

create table loai_khach(
    ma_loai_khach int not null primary key ,
    ten_loai_khach varchar(50)
);

create table khach_hang(
    ma_khach_hang int not null primary key ,
    ma_loai_khach int,
    ho_ten varchar(50),
    ngay_sinh date,
    gioi_tinh bit(1),
    so_cmnd varchar(45),
    so_dien_thoai varchar(50),
    email varchar(45),
    dia_chi varchar(45),
    foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);

create table hop_dong(
    ma_hop_dong int not null primary key ,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc datetime,
    tien_dat_coc double,
    ma_nhan_vien int,
    ma_khach_hang int,
    ma_dich_vu int,
    foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
    foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table loai_dich_vu(
    ma_loai_dich_vu int not null primary key ,
    ten_loai_dich_vu varchar(50)
);

create table kieu_thue(
    ma_kieu_thue int not null primary key ,
    ten_kieu_thue varchar(50)
);

create table dich_vu(
    ma_dich_vu int not null primary key ,
    ten_dich_vu varchar(50),
    dien_tich int,
    chi_phi_thue double,
    so_nguoi_toi_da int,
    ma_kieu_thue int,
    ma_loai_dich_vu int,
    tieu_chuan_phong varchar(50),
    mo_ta_tien_nghi_khac varchar(50),
    dien_tich_ho_boi double,
    so_tang int,
    foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
    foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);

create table hop_dong_chi_tiet(
    ma_hop_dong_chi_tiet int not null primary key ,
    ma_hop_dong int,
    ma_dich_vu_di_kem int,
    so_luong int,
    foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
    foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);

create table dich_vu_di_kem(
    ma_dich_vu_di_kem int not null primary key ,
    ten_dich_vu_di_kem varchar(50),
    gia double,
    don_vi varchar(50),
    trang_thai varchar(50)
);
insert into vi_tri (ma_vi_tri, ten_vi_tri)
    values (1, 'Quản Lý'),
    (2, 'Nhân Viên');
SELECT * FROM vi_tri;

insert into trinh_do (ma_trinh_do, ten_trinh_do)
    values (1, 'Trung Cấp'),
    (2, 'Cao Đẳng'),
    (3, 'Đại Học'),
    (4, 'Sau Đại Học');
SELECT * FROM trinh_do;

insert into bo_phan (ma_bo_phan, ten_bo_phan)
    values (1, 'Sale-Marketing'),
    (2, 'Hành chính'),
    (3, 'Phục vụ'),
    (4, 'Quản lý');
SELECT * FROM bo_phan;

insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
    values (1, 'Nguyễn Văn An', '1970-11-07',	'456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng',	1, 3, 1),
    (2, 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
    (3, 'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
    (4, 'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
    (5, 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
    (6, 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
    (7, 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
    (8, 'Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
    (9, 'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
    (10, 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);
SELECT * FROM nhan_vien;

insert into loai_khach (ma_loai_khach, ten_loai_khach)
    values (1, 'Diamond'),
    (2, 'Platinium'),
    (3, 'Gold'),
    (4, 'Silver'),
    (5, 'Member');
SELECT * FROM loai_khach;

insert into khach_hang(ma_khach_hang, ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
    values (1, 5, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
    (2, 3, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
    (3, 1, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
    (4, 1, 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
    (5, 4, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
    (6, 4, 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
    (7, 1, 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
    (8, 3, 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
    (9, 1, 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
    (10, 2, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');
SELECT * FROM khach_hang;

insert into kieu_thue (ma_kieu_thue, ten_kieu_thue)
    values (1, 'year'),
    (2, 'month'),
    (3, 'day'),
    (4, 'hour');
SELECT * FROM kieu_thue;

insert into loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu)
    values (1, 'Villa'),
    (2, 'House'),
    (3, 'Room');
SELECT * FROM loai_dich_vu;

INSERT INTO dich_vu(ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang)
    values (1, 'Villa Beach Front', 25000, 10000000, 10, 3, 1, 'vip', 'Có hồ bơi', 500, 4),
    (2, 'House Princess 01', 14000, 5000000, 7, 2, 2, 'vip', 'Có thêm bếp nướng', null, 3),
    (3, 'Room Twin 01', 5000, 1000000, 2, 4, 3, 'normal', 'Có tivi', null, null),
    (4, 'Villa No Beach Front', 22000, 9000000, 8, 3, 1, 'normal', 'Có hồ bơi', 300, 3),
    (5, 'House Princess 02', 10000, 4000000, 5, 3, 2, 'normal', 'Có thêm bếp nướng', null, 2),
    (6, 'Room Twin 02', 3000, 900000, 2, 4, 3, 'normal', 'Có tivi', null, null);
SELECT * FROM dich_vu;

insert into dich_vu_di_kem(ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai)
    values (1, 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
    (2, 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
    (3, 'Thuê xe đạp', 20000, 'chiếc', 'tốt'),
    (4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
    (5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
    (6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');
SELECT * FROM dich_vu_di_kem;

insert into hop_dong(ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
    values (1, '2020-12-08', '2020-12-08', 0, 3, 1, 3),
    (2, '2020-07-14', '2020-07-21', 200000, 7, 3, 1),
    (3, '2021-03-15', '2021-03-17', 50000, 3, 4, 2),
    (4, '2021-01-14', '2021-01-18', 100000, 7, 5, 5),
    (5, '2021-07-14', '2021-07-15', 0, 7, 2, 6),
    (6, '2021-06-01', '2021-06-03', 0, 7, 7, 6),
    (7, '2021-09-02', '2021-09-05', 100000, 7, 4, 4),
    (8, '2021-06-17', '2021-06-18', 150000, 3, 4, 1),
    (9, '2020-11-19', '2020-11-19', 0, 3, 4, 3),
    (10, '2021-04-12', '2021-04-14', 0, 10, 3, 5),
    (11, '2021-04-25', '2021-04-25', 0, 2, 2, 1),
    (12, '2021-05-25', '2021-05-27', 0, 7, 10, 1);
SELECT * FROM hop_dong;

insert into hop_dong_chi_tiet(ma_hop_dong_chi_tiet, ma_hop_dong, ma_dich_vu_di_kem, so_luong)
    values (1,  2, 4, 5),
    (2, 2, 5, 8),
    (3, 2, 6, 15),
    (4, 3, 1, 1),
    (5, 3, 2, 11),
    (6, 1, 3, 1),
    (7, 1, 2, 2),
    (8, 12, 2, 2);
SELECT * FROM hop_dong_chi_tiet;

#  2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
# một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
from nhan_vien
where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%'
and length(ho_ten) <=15;

# 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
# có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where (year(current_date()) - year(ngay_sinh)) between 18 and 50
and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');

# 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu
# lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của
# khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là
# “Diamond”.
select kh.ho_ten as TenKhachHang,count(hd.ma_khach_hang) as SoLanDatPhong
from khach_hang kh
inner join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where lk.ten_loai_khach = 'Diamond'
group by kh.ma_khach_hang,kh.ho_ten
order by SoLanDatPhong;

# 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong,
# ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với
# tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng *
# Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
# hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những
# khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,ngay_lam_hop_dong,hd.ngay_ket_thuc,(dv.chi_phi_thue + hdct.so_luong * dvdk.gia) AS tong_tien
from khach_hang kh
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
order by kh.ma_khach_hang;

# 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
# ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng
# thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu NOT IN (
    SELECT DISTINCT hdct.ma_hop_dong
    FROM hop_dong_chi_tiet hdct
    JOIN hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2021 AND MONTH(hd.ngay_lam_hop_dong) IN (1, 2, 3)
)
ORDER BY dv.ma_dich_vu;

# 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich,
# so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại
# dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng
# chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv USING (ma_loai_dich_vu)
WHERE
    EXISTS (
        SELECT 1
            FROM hop_dong hd
            WHERE dv.ma_dich_vu = hd.ma_dich_vu
              AND YEAR(hd.ngay_lam_hop_dong) = 2020
        )
  AND NOT EXISTS (
        SELECT 1
        FROM hop_dong hd
        WHERE dv.ma_dich_vu = hd.ma_dich_vu
          AND YEAR(hd.ngay_lam_hop_dong) = 2021
    );

# 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu
# ho_ten không trùng nhau.
# Cách 1:
SELECT DISTINCT ho_ten
from khach_hang;

# Cách 2:
select ho_ten
from khach_hang
group by ho_ten;

# Cách 3:
select ho_ten
from khach_hang
group by ho_ten
having count(*) = 1;

# 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi
# tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt
# phòng.

SELECT MONTH(ngay_lam_hop_dong) AS thang, COUNT(DISTINCT ma_khach_hang) AS so_luong_khach_hang
FROM hop_dong
WHERE YEAR(ngay_lam_hop_dong) = 2021
GROUP BY MONTH(ngay_lam_hop_dong);

# 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu
# dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
# ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
# so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở
# dich_vu_di_kem).

SELECT
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc
ORDER BY
    hd.ma_hop_dong;
# 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách
# hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc
# “Quảng Ngãi”.

SELECT
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    dvdk.ten_dich_vu_di_kem,
    dvdk.gia,
    dvdk.don_vi
FROM
    hop_dong hd
        JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE
        lk.ten_loai_khach = 'Diamond'
  AND (kh.dia_chi = 'Vinh' OR kh.dia_chi = 'Quảng Ngãi');

# 12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách
# hàng), so_dien_thoai (khách hàng), ten_dich_vu,
# so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở
# dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được
# khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được
# khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT
    hd.ma_hop_dong,
    nv.ho_ten AS ho_ten_nhan_vien,
    kh.ho_ten AS ho_ten_khach_hang,
    kh.so_dien_thoai,
    dv.ten_dich_vu_di_kem,
    SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
FROM
    hop_dong hd
        JOIN nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN dich_vu_di_kem dv ON hdct.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
WHERE
        YEAR(hd.ngay_lam_hop_dong) = 2020
  AND MONTH(hd.ngay_lam_hop_dong) >= 10
  AND hd.ma_hop_dong NOT IN (
    SELECT
        ma_hop_dong
    FROM
        hop_dong
    WHERE
            YEAR(ngay_lam_hop_dong) = 2021
      AND MONTH(ngay_lam_hop_dong) <= 6
)
GROUP BY
    hd.ma_hop_dong,
    nv.ho_ten,
    kh.ho_ten,
    kh.so_dien_thoai,
    dv.ten_dich_vu_di_kem,
    hd.tien_dat_coc;

# 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các
# Khách hàng đã đặt phòng.

select dvdk.ten_dich_vu_di_kem,count(*) as so_lan_su_dung
from hop_dong
join hop_dong_chi_tiet hdct on hop_dong.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ten_dich_vu_di_kem
order by count(*) desc;

# 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một
# lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
# ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính
# dựa trên việc count các ma_dich_vu_di_kem).

SELECT
    hd.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    hop_dong hd
        JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN loai_dich_vu ldv ON dvdk.ma_dich_vu_di_kem = ldv.ma_loai_dich_vu
GROUP BY
    hd.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem
HAVING
        so_lan_su_dung = 1;

# 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten,
# ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được
# tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi
from nhan_vien nv
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi
having count(hd.ma_hop_dong) <= 3;

# 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019
# đến năm 2021.
DELETE FROM nhan_vien
WHERE ma_nhan_vien NOT IN (
    SELECT ma_nhan_vien
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) BETWEEN 2019 AND 2021
);
# 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum
# lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với
# Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
UPDATE khach_hang
SET ho_ten = 'Diamond'
WHERE ma_khach_hang IN (
    SELECT ma_khach_hang
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) = 2021
    GROUP BY ma_khach_hang
    HAVING SUM(hop_dong.tien_dat_coc) > 10000000
);
# 18. Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc
# giữa các bảng).
DELETE FROM khach_hang
WHERE ma_khach_hang IN(
    SELECT ma_khach_hang
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) < 2021
    );

# 19. Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong
# năm 2020 lên gấp đôi.
UPDATE dich_vu_di_kem
SET gia = gia * 2
WHERE ma_dich_vu_di_kem IN (
    SELECT ma_dich_vu_di_kem
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) = 2020
    GROUP BY ma_dich_vu_di_kem
    HAVING COUNT(*) > 10
);

# 20. Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ
# thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang),
# ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT ma_nhan_vien AS id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM nhan_vien
UNION
SELECT ma_khach_hang AS id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM khach_hang;

# 21.Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và
# đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng nam 2021

CREATE VIEW v_nhan_vien AS
SELECT nv.ma_nhan_vien, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
FROM nhan_vien nv
JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
WHERE nv.dia_chi = 'Hải Châu' AND YEAR(hd.ngay_lam_hop_dong) = 2021;

# 22. Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành
# “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn
# này.

update v_nhan_vien
set dia_chi = 'Liên Chiểu';

# 23. Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của
# một khách hàng nào đó với ma_khach_hang được truyền vào như là 1
# tham số của sp_xoa_khach_hang.


create procedure sp_xoa_khach_hang(p_ma_khach_hang int)
begin
delete from khach_hang where ma_khach_hang = p_ma_khach_hang;
end



