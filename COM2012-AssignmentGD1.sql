
DROP TABLE IF EXISTS ChiTietPhieuMuon;
DROP TABLE IF EXISTS ListSachMuon;
DROP TABLE IF EXISTS quyensach;
DROP TABLE IF EXISTS PhieuMuonSach;
DROP TABLE IF EXISTS SinhVienMuonSach;
DROP TABLE IF EXISTS LoaiSach;

CREATE TABLE LoaiSach
(
  MaLoaiSach INT NOT NULL AUTO_INCREMENT,
  TenLoaiSach VARCHAR(255) NOT NULL,
  PRIMARY KEY (MaLoaiSach)
);

CREATE TABLE SinhVienMuonSach
(
  TenSinhVien VARCHAR(100) NOT NULL,
  MaSinhVien INT NOT NULL AUTO_INCREMENT,
  ChuyenNganhHoc VARCHAR(255) NOT NULL,
  TheSinhVien INT NOT NULL DEFAULT 1,
  Email VARCHAR(100) NOT NULL,
  SDT VARCHAR(11) NOT NULL,
  PRIMARY KEY (MaSinhVien)
);

CREATE TABLE PhieuMuonSach
(
  SoPhieu INT NOT NULL AUTO_INCREMENT,
  MaLop VARCHAR(10) NOT NULL,
  NgayMuon DATE NOT NULL,
  HanTra DATE NOT NULL,
  MaSinhVien INT NOT NULL,
  PRIMARY KEY (SoPhieu),
  FOREIGN KEY (MaSinhVien) REFERENCES SinhVienMuonSach(MaSinhVien)
);

CREATE TABLE QuyenSach
(
  MaSach INT NOT NULL AUTO_INCREMENT,
  TieuDe VARCHAR(255) NOT NULL,
  NhaXuatBan VARCHAR(255) NOT NULL,
  SoTrang INT NOT NULL,
  SoLuongBanSao INT NOT NULL,
  GiaTien INT NOT NULL,
  NgayNhapKho DATE NOT NULL,
  ViTri VARCHAR(255) NOT NULL,
  NoiDatSach VARCHAR(255) NOT NULL,
  MaLoaiSach INT NOT NULL,
  PRIMARY KEY (MaSach),
  FOREIGN KEY (MaLoaiSach) REFERENCES LoaiSach(MaLoaiSach)
);

CREATE TABLE ListSachMuon
(
  TenSach VARCHAR(255) NOT NULL,
  NhaXuatBan VARCHAR(255) NOT NULL,
  GhiChu VARCHAR(255) NOT NULL,
  MaSach INT NOT NULL,
  FOREIGN KEY (MaSach) REFERENCES QuyenSach(MaSach)
);

CREATE TABLE ChiTietPhieuMuon
(
  MaSach INT NOT NULL,
  SoPhieu INT NOT NULL,
  NgayMuon DATE NOT NULL,
  NgayTra DATE NULL,
  PRIMARY KEY (MaSach, SoPhieu),
  FOREIGN KEY (MaSach) REFERENCES QuyenSach(MaSach),
  FOREIGN KEY (SoPhieu) REFERENCES PhieuMuonSach(SoPhieu)
);

-- Insert data into LOAISACH
INSERT INTO LOAISACH (TENLOAISACH) VALUES 
('Kinh tế'),
('Công nghệ thông tin'),
('Văn học'),
('Du lịch'),
('Ngoại ngữ');

-- Insert data into SINHVIENMUONSACH without thẻ sinh viên
INSERT INTO SINHVIENMUONSACH (TENSINHVIEN, CHUYENNGANHHOC, EMAIL, SDT) VALUES 
('Nguyen Van A', 'Kinh tế', 'nguyenvana@example.com', '0912345678'),
('Le Thi B', 'Công nghệ thông tin', 'lethib@example.com', '0912345679'),
('Tran Van C', 'Văn học', 'tranvanc@example.com', '0912345680'),
('Pham Thi D', 'Du lịch', 'phamthid@example.com', '0912345681'),
('Hoang Van E', 'Ngoại ngữ', 'hoangvane@example.com', '0912345682');

-- Insert data into QUYENSACH
INSERT INTO QUYENSACH (TIEUDE, NHAXUATBAN, SOTRANG, SOLUONGBANSAO, GIATIEN, NGAYNHAPKHO, VITRI, MALOAISACH) VALUES 
('Sách Kinh Tế 1', 'NXB 1', 100, 5, 50000, '2024-01-01', 'A1', 1),
('Sách CNTT 1', 'NXB 2', 150, 3, 70000, '2024-01-01', 'B1', 2),
('Sách Văn Học 1', 'NXB 3', 200, 4, 80000, '2024-01-01', 'C1', 3),
('Sách Du Lịch 1', 'NXB 4', 250, 2, 60000, '2024-01-01', 'D1', 4),
('Sách Ngoại Ngữ 1', 'NXB 5', 300, 6, 90000, '2024-01-01', 'E1', 5);

-- Insert data into PHIEUMUONSACH
INSERT INTO PHIEUMUONSACH (MALOP, NGAYMUON, HANTRA, MASINHVIEN) VALUES 
('KinhTe01', '2024-01-01', '2024-01-08', 1),
('CNTT01', '2024-01-02', '2024-01-09', 2),
('VanHoc01', '2024-01-03', '2024-01-10', 3),
('DuLich01', '2024-01-04', '2024-01-11', 4),
('NgoaiNgu01', '2024-01-05', '2024-01-12', 5);

-- Insert data into LISTSACHMUON
INSERT INTO LISTSACHMUON (TENSACH, NHAXUATBAN, GHICHU, MASACH) VALUES 
('Sách Kinh Tế 1', 'NXB 1', 'Không Có', 1),
('Sách CNTT 1', 'NXB 2', 'Không Có', 2),
('Sách Văn Học 1', 'NXB 3', 'Không Có', 3),
('Sách Du Lịch 1', 'NXB 4', 'Không Có', 4),
('Sách Ngoại Ngữ 1', 'NXB 5', 'Không Có', 5);

-- Insert data into CHITIETPHIEUMUON
INSERT INTO CHITIETPHIEUMUON (MASACH, SOPHIEU, NGAYMUON, NGAYTRA) VALUES 
(1, 1, '2024-01-01', '2024-01-07'),
(2, 2, '2024-01-02', '2024-01-08'),
(3, 3, '2024-01-03', '2024-01-09'),
(4, 4, '2024-01-04', '2024-01-10'),
(5, 5, '2024-01-05', '2024-01-11');


