USE [master]
GO
/****** Object:  Database [BanDoDienTu]    Script Date: 04/09/2023 21:10:26 ******/
CREATE DATABASE [BanDoDienTu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanDoDienTu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BanDoDienTu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanDoDienTu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BanDoDienTu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BanDoDienTu] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanDoDienTu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanDoDienTu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanDoDienTu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanDoDienTu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanDoDienTu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanDoDienTu] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanDoDienTu] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BanDoDienTu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanDoDienTu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanDoDienTu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanDoDienTu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanDoDienTu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanDoDienTu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanDoDienTu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanDoDienTu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanDoDienTu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BanDoDienTu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanDoDienTu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanDoDienTu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanDoDienTu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanDoDienTu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanDoDienTu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanDoDienTu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanDoDienTu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BanDoDienTu] SET  MULTI_USER 
GO
ALTER DATABASE [BanDoDienTu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanDoDienTu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanDoDienTu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanDoDienTu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanDoDienTu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BanDoDienTu] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BanDoDienTu] SET QUERY_STORE = ON
GO
ALTER DATABASE [BanDoDienTu] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BanDoDienTu]
GO
/****** Object:  Table [dbo].[ChiTietHDB]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDB](
	[MaHDB] [nvarchar](20) NOT NULL,
	[MaSP] [nvarchar](20) NOT NULL,
	[SLBan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHDN]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDN](
	[MaHDN] [nvarchar](20) NOT NULL,
	[MaSP] [nvarchar](20) NOT NULL,
	[SLNhap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSP]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSP](
	[MaSP] [nvarchar](20) NOT NULL,
	[TrongLuong] [float] NULL,
	[BoNho] [nvarchar](100) NULL,
	[HeDieuHanh] [nvarchar](100) NULL,
	[Camera] [nvarchar](100) NULL,
	[BaoHanh] [nvarchar](100) NULL,
	[KichThuoc] [nvarchar](100) NULL,
	[MoTa] [nvarchar](3000) NULL,
	[Pin] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TaiKhoan] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
	[RoleID] [nvarchar](20) NOT NULL,
	[Status] [bit] NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [nvarchar](20) NOT NULL,
	[TenDM] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHDB] [nvarchar](20) NOT NULL,
	[NgayBan] [date] NULL,
	[MaKH] [nvarchar](20) NOT NULL,
	[MaNV] [nvarchar](20) NOT NULL,
	[TongTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHDN] [nvarchar](20) NOT NULL,
	[MaNCC] [nvarchar](20) NOT NULL,
	[NgayNhap] [date] NULL,
	[MaNV] [nvarchar](20) NOT NULL,
	[TongTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[SDTKH] [nvarchar](30) NULL,
	[DiaChiKH] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](20) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[SDTNCC] [nvarchar](30) NULL,
	[DiaChiNCC] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](20) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[SDTNV] [nvarchar](30) NULL,
	[GioiTinh] [nvarchar](20) NULL,
	[DiaChiNV] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [nvarchar](20) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 04/09/2023 21:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](20) NOT NULL,
	[MaDM] [nvarchar](20) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[SoLuong] [int] NULL,
	[GiaSP] [money] NULL,
	[AnhSP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'104/04/2023 14:57:2', N'tn15', 1)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'104/04/2023 14:59:1', N'c7', 1)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'104/04/2023 15:12:0', N's4', 1)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB01', N'bp2', 1)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB01', N'mt3', 1)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB02', N'tivi3', 2)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB03', N'mtb2', 3)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB03', N'tn1', 5)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB04', N'tivi4', 2)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB04', N'tn3', 5)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB05', N'c6', 10)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB06', N'dt1', 10)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB06', N'mtb10', 2)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB07', N'tivi9', 4)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB08', N'dt2', 6)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB09', N'mt7', 3)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB09', N'tivi3', 1)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB09', N'tn5', 5)
INSERT [dbo].[ChiTietHDB] ([MaHDB], [MaSP], [SLBan]) VALUES (N'HDB10', N'tivi3', 2)
GO
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN01', N'mtb1', 21)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN01', N'mtb2', 12)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN01', N'mtb5', 11)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN010', N'mtb7', 23)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN010', N'mtb8', 14)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN010', N'tivi5', 20)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN011', N'bp11', 23)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN012', N'c9', 34)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN013', N'mtb10', 12)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN02', N'tivi1', 15)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN02', N'tivi2', 17)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN03', N'bp2', 23)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN03', N'bp6', 30)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN04', N'tn5', 35)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN05', N'c6', 23)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN05', N'c7', 22)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN06', N'dt5', 43)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN06', N'dt7', 23)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN06', N'dt8', 43)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN07', N'mt2', 23)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN07', N'mt6', 13)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN08', N'mt15', 17)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN09', N'dt2', 22)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN09', N'dt3', 12)
INSERT [dbo].[ChiTietHDN] ([MaHDN], [MaSP], [SLNhap]) VALUES (N'HDN09', N'mt3', 5)
GO
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp1', 150, NULL, NULL, NULL, N'12 tháng', N' 296,2 x 94,5 x 5,3mm', N'Chỉ 150g (4,9 oz), cầm trên tay với một số hình nhỏ không thực sự là một vấn đề. Thiết kế có thể gập lại với các tính năng từ tính thông minh.', N' 120mAh / 3.7V / 0.444Wh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp10', 1000, NULL, NULL, NULL, N'24 tháng', N'360,5 x 130,5 x 10,9 mm', N'Công nghệ switch cơ học độc quyền của Razer cho phím bấm cực êm và nhạy. Hệ thống đèn Led RGB nhiều hiệu ứng, điều chỉnh linh hoạt qua phần mềm Razer Synapse. Kiểu rút gọn - Tenkeyless đẹp mắt, gọn gàng, dễ mang theo. Tuổi thọ ấn tượng lên đến 100 triệu l', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp11', 1740, NULL, NULL, NULL, N'24 tháng', N'440,5 x 160 x 20,5 mm', N'Kiểu dáng hiện đại, màu đen thanh lịch, dễ sử dụng. Đáp ứng nhu cầu gõ chữ, chơi game với 104 phím. Độ bền Green Mechanical Switch tới 80 triệu lần bấm, độ nảy cao. Hiệu ứng ánh sáng phóng phú với dàn đèn LED RGB Chroma 16.8 triệu màu.', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp12', 1370, NULL, NULL, NULL, N'24 tháng', N'450,5 x 170 x 50 mm', N'Tổng thể bàn phím này được hoàn thiện bằng nhựa mờ (nhựa ABS) nhưng phản ánh ngược lại cho người dùng thấy được về độ bền, sự cứng cáp và chắc chắn đến từ chất lượng bên trong của “em” nó. Cảm giác đầu tiên khi sờ lên K68 phải nói là thực sự rất mịn tựa n', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp13', 1042, NULL, NULL, NULL, N'12 tháng', N'430,5 x 150 x 32 mm ', N' Thiết kế phím nổi chống nước không chỉ giúp bàn phím đẹp hơn, mà còn giúp cho bạn dễ dàng lau chùi bàn phím hơn khi dính bẩn.', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp14', 1020, NULL, NULL, NULL, N'12 tháng', N'420,5 x 130 x 30 mm', N'Thiết kế hiện đại, chất liệu cứng chắc bền bỉ, kích thước gọn gàng dễ dàng bố trí và sử dụng. Bàn phím cơ sử dụng 104 nút bấm chuẩn, Switch Rapoo Blue kiểu treo độ bền tới 60 triệu lần nhấn. Sử dụng dây cổng USB kết nối thiết bị thuận tiện. Tương thích vớ', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp15', 1000, NULL, NULL, NULL, N'12 tháng', N'350,1 x 150,3 x 30,7 mm ', N'Thiết kế kiểu Tenkeyless nhỏ gọn, cá tính, dễ bố trí. Bàn phím cơ sử dụng 87 nút bấm cơ bản, Switch Rapoo Blue bền tới 60 triệu lần nhấn. Sử dụng dây cổng USB kết nối thiết bị thuận tiện.  Tương thích với hệ điều hành Windows và MacOS.', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp2', 423, NULL, NULL, NULL, N'12 tháng', N' 279 x 124 x 16 mm', N'Giới thiệu K380. Bàn phím đa thiết bị với kiểu dáng nhỏ gọn và khả năng gõ yên tĩnh cho máy tính, máy tính bảng và điện thoại, tại nhà hay khi di chuyển.', N' 2 x AAA')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp3', 737, NULL, NULL, NULL, N'12 tháng', N'361 x 135 x 36 mm', N'Bàn phím cơ không dây, thiết kế TKL 87 phím, 2 chế độ kết nối: Wireless 2.4G và Type-C, Switch cơ OUTEMU (Blue/ Red/ Brown), hỗ trợ hot-swap, độ bền đến 50 triệu lần nhấn phím.', N'2.000 mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp4', 660, NULL, NULL, NULL, N'12 tháng', N'454 x 148 x 36.5 mm', N' có dây Gaming Zadez G-850K được làm từ chất liệu nhựa ABS cao cấp, phím khắc Laser. Với màu đen cứng cáp tạo nên sự mạnh mẽ đến từng chi tiết của bàn phím. ', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp5', 312, NULL, NULL, NULL, N'36 tháng', N'288 x 139 x 21 mm', N'Kiểu dáng đơn giản, nhỏ gọn, tiết kiệm không gian, Công nghệ không dây 2.4GHz giúp kết nối nhanh chóng, Vô tư di chuyển trong phạm vi 10m, kết nối ổn định.', N'AAA')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp6', 500, NULL, NULL, NULL, N'24 tháng', N'365 x 174 x 5 mm', N'Corsair K63 là bàn phím cơ kiểu rút gọn (Tenkeyless) dành cho game thủ, tích hợp các phím riêng (Stop, Backward, Play/Pause, Forward) bên góc trái, Các phím chỉnh biên độ sáng đèn nền, Windows Lock và 3 phím điều chỉnh âm lượng bên phải', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp7', 239, NULL, NULL, NULL, N'36 tháng', N'270,89 x 110,49 x 10,09 mm', N'Bàn phím Apple Magic Keyboard 2021 MK2A3 được người dùng trải nghiệm và cho đánh giá cao về khả năng gõ êm ái, độ phản hồi nhanh, tốc độ gõ cũng được cải thiện vì khoảng cách các phím được đặt cách rộng rãi, rõ ràng. Mặc dù có thiết kế không bàn phím số n', N'Li-ion')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp8', 1000, NULL, NULL, NULL, N'24 tháng', N'350,5 x 120,5 x 30 mm', N'Sử dụng Razer Orange Switch với tuổi thọ 80 triệu lượt nhấn, Thiết kế dạng tenkeyless với 87 phím nhấn. Hệ thống led màu trắng với nhiều hiệu ứng khác nhau. Cáp kết nối cổng ra Micro USB có thể tháo rời, cổng USB để kết nối laptop, PC.', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'bp9', 1690, NULL, NULL, NULL, N'36 tháng', N'440,8 x 150 x 30,8 mm', N'Kiểu dáng hình chữ nhật, các phím được sắp xếp giúp tối ưu thao tác cho người sử dụng, có giá kê tay giúp giảm áp lực cho cổ tay, đảm bảo sự thoải mái ngay cả khi chơi game trong thời gian dài. Có phần khung làm từ nhôm độ bền cao, tin cậy về chất lượng. ', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c1', 300, NULL, NULL, NULL, N'12 tháng', N'99 x 60 x 39 mm', N'Đến từ dòng sản phẩm Asus gaming rất được lòng giới đam mê Esport, chuột máy tính CERBERUS sở hữu thiết kế ấn tượng với những đường cắt xẻ hiện đại, thể hiện hiệu năng tốt khi vận hành và đặc biệt là có giá bán phải chăng. Ngoài ra, công tắc DPI bốn nấc v', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c10', 56, NULL, NULL, NULL, N'12 tháng', N'9.52 x 4 x 5.65 cm', N'Đem đến sự lựa chọn nhẹ nhàng và đa dụng, chuột không dây Targus W620 có thể giúp ích rất nhiều cho mọi tác vụ trong đời sống của bạn, từ học tập, giải trí cho đến công việc. Điểm đặc biệt ở sản phẩm là khả năng tinh chỉnh độ nhạy quang học giữa ba mức gồ', N'AA 1,5 V')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c11', 60, NULL, NULL, NULL, N'36 tháng', N'10.5 x 6.4 x 3.9 cm', N'Chuột không dây Bluetooth TARGUS Midsize Comfort kháng khuẩn – B582, Thiết kế gọn nhẹ, di động, Kết nối không dây 2.4 GHz + Bluetooth® 5.0, Bảo vệ kháng khuẩn DefenseGuard', N'AA 1,5 V')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c12', 239, NULL, NULL, NULL, N'12 tháng', N'132 x 75 x 40 mm', N'Tinh chỉnh cảm giác chuột và hành vi trượt theo sở thích của bạn. Năm khối nặng 3,6 g đi kèm với HERO G502 đều có thể điều chỉnh theo nhiều cách: ở phía trước, phía sau, trái, phải và trung tâm. Thử nghiệm với sự liên kết và cân bằng để tìm ra vị trí phù ', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c13', 85, NULL, NULL, NULL, N'12 tháng', N'116.6 x 62.15 x 38.2 mm', N'Chuột gaming Logitech G102 Gen2 Lightsync có một thiết kế hiện đại, cao cấp. Sở hữu công nghệ LIGHTSYNC, cảm biến DPI cao và 6 nút tiện lợi giúp bạn dễ dàng sử dụng làm việc và chơi game hơn.', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c14', 170, NULL, NULL, NULL, N'12 tháng', N'100 x 50 x 150 mm', N'Chuột chơi game không dây LIGHTSPEED được thiết kế cho hiệu suất thực sự với các đột phá công nghệ mới nhất. Tuổi thọ pin 250 giờ đầy ấn tượng. Giờ đây có nhiều màu sắc rực rỡ.', N'AA 1,5 V')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c15', 105, NULL, NULL, NULL, N'24 tháng', N'130 x 80 x45 mm', N'Chuột gaming Corsair IronClaw RGB - FPS MOBA kết hợp cảm biến quang 18.000 DPI, trọng lượng nhẹ chỉ 105g và kiểu dáng công thái học mang đến sự thoải mái và độ chính xác cao, hiệu năng cao trong suốt quá trình sử dụng.', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c2', 78, NULL, NULL, NULL, N'12 tháng', N'99 x 60 x 39 mm', N'Nhằm để giảm thiểu những sự phiền toái và giới hạn khoảng cách do chuột máy tính có dây thì chuột không dây Logitech M221 được ra đời. Với công nghệ không dây 2.4GHz, chuột Logitech M221 cho phép người dùng kết nối xa lên đến 10m.', N'AA 1,5 V')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c3', 90, NULL, NULL, NULL, N'12 tháng', N'10 x 63 x 3.8 mm', N'Sử dụng cơ chế tương tác không dây, chuột quang Microsoft 1850 có khả năng kết nối trong bán kính 5m tính từ thiết bị được gắn bộ thu phát nhờ khả năng bắt sóng mạnh mẽ. Cảm nhận thực tế cho thấy sản phẩm vận hành rất mượt mà, duy trì tín hiệu ổn định và ', N'AA 1,5 V')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c4', 78, NULL, NULL, NULL, N'12 tháng', N'99 x 60 x 39 mm', N'Nhằm để giảm thiểu những sự phiền toái và giới hạn khoảng cách do chuột máy tính có dây thì chuột không dây Logitech M221 được ra đời. Với công nghệ không dây 2.4GHz, chuột Logitech M221 cho phép người dùng kết nối xa lên đến 10m.', N'AA 1,5 V')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c5', 85, NULL, NULL, NULL, N'12 tháng', N'10 x 63 x 3.8 mm', N'Prolink PMC1005 dùng giao tiếp USB có dây, là chuẩn phổ biến trên hầu hết các loại laptop hiện nay', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c6', 79, NULL, NULL, NULL, N'12 tháng', N'99 x 60 x 39 mm', N'Chuột không dây kết nối chuẩn Bluetooth và 2.4GHz. Với 3 chế độ chuyển đổi và kết nối đồng thời cho Blueooth 3.0, 4.0 và 2.4GHz', N'AA 1,5 V')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c7', 48, NULL, NULL, NULL, N'12 tháng', N'103 x 64 x 31 mm', N'Để giảm thiểu những sự phiền toái và giới hạn khoảng cách do chuột máy tính có dây thì chuột không dây  Prolink PMW5008  được ra đời. Với công nghệ không dây 2.4GHz, chuột  Prolink PMW5008  cho phép người dùng kết nối xa lên đến 10m.', N'AA 1,5 V')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c8', 55, NULL, NULL, NULL, N'12 tháng', N'105 x 70 x 30 mm', N'Chuột không dây ZADEZ M390 được xem là phiên bản cao cấp hơn khi mang đến những đặc điểm nổi trội hơn như độ phân giải cao lên đến 1600 DPI, thiết kế đẹp mắt với vân xước tinh tế và nhanh nhạy hơn khi thao tác', N'AA 1,5 V')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'c9', 160, NULL, NULL, NULL, N'12 tháng', N'38 x 60 x 107 mm', N'Chuột G3-200N sở hữu công nghệ kết nối không dây 2.4GHZ mạnh mẽ. Khoảng cách kết nối lên tới 10 mét, giúp bạn thoải mái sử dụng ở bất cứ đâu. G3-200N có tính năng theo dõi quang học tiên tiến của A4Tech, cho những chuyển động siêu chính xác gần như trên m', N'AA 1,5 V')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt1', 223, N'256GB', N'Android 13', N'200 - 12 MP', N'12 Tháng ', N'163.4 x78.1 x 8.9 mm', N'Samsung Galaxy S23 nổi bật với camera 200 MP chất lượng, hiệu năng mạnh mẽ nhờ tích hợp con chip Snapdragon 8 Gen 2 và được trang bị thêm nhiều công nghệ hàng đầu trong giới smartphone.', N'5000 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt10', 188, N'128GB', N'Android 12', N'200 - 12 MP', N'12 Tháng', N'Dài 164.3 mm - Ngang 76.1 mm - Dày 8.28 mm', N'Vivo đã chính thức cho ra mắt điện thoại Vivo Y35. Máy sở hữu cho mình khả năng sạc siêu nhanh 44 W, cụm camera đem đến những bức ảnh sắc nét và một hiệu năng ổn định trong phân khúc.', N'4800 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt11', 183, N'256GB', N'Android 12', N'200 - 12 MP', N'12 Tháng ', N'Dài 161.2 mm - Ngang 74.2 mm - Dày 7.34 mm ', N'OPPO Reno8 Pro 5G hướng đến sự hoàn thiện cao cấp ở phần thiết kế cùng khả năng quay chụp chuyên nghiệp nhờ trang bị vi xử lý hình ảnh MariSilicon X chuyên dụng.', N'4800 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt12', 195, N'128GB', N'Android 12', N'200 - 12 MP', N'12 Tháng', N'Dài 165.4 mm - Ngang 76.9 mm - Dày 8.4 mm', N'Samsung Galaxy A23 4GB sở hữu bộ thông số kỹ thuật khá ấn tượng trong phân khúc, máy có một hiệu năng ổn định, cụm 4 camera thông minh cùng một diện mạo trẻ trung phù hợp cho mọi đối tượng người dùng.', N'4800 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt13', 193, N'64GB', N'android 11', N'200 - 12 MP', N'12 Tháng ', N'Dài 163.6 mm - Ngang 75.7 mm - Dày 8.4 mm ', N'OPPO cho ra mắt OPPO A55 4G chiếc smartphone giá rẻ tầm trung có thiết kế đẹp mắt, cấu hình khá ổn, cụm camera chất lượng và dung lượng pin ấn tượng, mang đến một lựa chọn trải nghiệm thú vị vừa túi tiền cho người tiêu dùng.', N'4800 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt14', 190, N'256GB', N'Android 12', N'200 - 12 MP', N'12 Tháng', N'Dài 159.8 mm - Ngang 74.5 mm - Dày 8.4 mm ', N'Samsung Galaxy S20 FE là mẫu flagship cao cấp quy tụ nhiều tính năng mà Samfan yêu thích, hứa hẹn sẽ mang lại trải nghiệm cao cấp của dòng Galaxy S với mức giá dễ tiếp cận hơn', N'5000 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt15', 204, N'64GB', N'android 11', N'200 - 12 MP', N'12 Tháng ', N'Dài 169.59 mm - Ngang 76.56 mm - Dày 9.18 mm ', N'POCO C40 đã chính thức được cho ra mắt tại thị trường Việt Nam, sở hữu màn hình kích thước lớn, viên pin dung lượng khủng và một con chip JR510 mới lạ trên thị trường công nghệ hiện nay.', N'4800 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt2', 171, N'256GB', N'Android 13', N'200 - 12 MP', N'12 Tháng', N'162.3 x 74.3 x 7.7 mm', N'điện thoại OPPO Reno8 T 5G 256GB. Máy mang trong mình vẻ ngoài trẻ trung hiện đại, camera chụp ảnh đỉnh cao cùng hiệu năng ổn định cân mọi tác vụ.', N'4800 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt3', 240, N'128GB', N'IOS 16', N'200 - 12 MP', N'12 Tháng ', N' 160.7 x 77.6 x 7.85 mm', N'Sản phẩm có trong mình một diện mạo bắt mắt nhờ lối tạo hình vuông vức bắt trend tương tự thế hệ iPhone 13 series, đây được xem là kiểu thiết kế rất thành công trên các thế hệ trước khi tạo nên cơn sốt toàn cầu về kiểu dáng điện thoại cho đến nay', N'5000 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt4', 206, N'128GB', N'IOS 16', N'200 - 12 MP', N'12 Tháng', N' 147.5 x 71.5 x 7.85 mm', N'Đến với thiết kế của iPhone 14 Pro năm nay, hãng vẫn giữ lại nét đặc trưng vốn có từ các đời trước, vẫn mang trong mình ngoại hình vuông vức với các cạnh và mặt lưng vát phẳng. ', N'5001 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt5', 187, N'128GB', N'Android 12', N'200 - 12 MP', N'12 Tháng ', N'165.2 x 71.9 x 6.9 mm', N'Samsung Galaxy Z Flip4 128GB đã chính thức ra mắt thị trường công nghệ, đánh dấu sự trở lại của Samsung trên con đường định hướng người dùng về sự tiện lợi trên những chiếc điện thoại gập.', N'5002 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt6', 179, N'64GB', N'android 11', N'200 - 12 MP', N'12 Tháng', N' 159.8 mm - Ngang 73.87 mm - Dày 8.09 mm', N'Điện thoại Redmi được mệnh danh là dòng sản phẩm quốc dân ngon - bổ  - rẻ của Xiaomi và Redmi Note 11 cũng không phải ngoại lệ, máy sở hữu một hiệu năng ổn định, màn hình 90 Hz mượt mà, cùng một mức giá vô cùng tốt.', N'5003 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt7', 228, N'128GB', N'Android 12', N'200 - 12 MP', N'12 Tháng ', N'Dài 163.3 mm - Ngang 77.9 mm - Dày 8.9 mm', N'Galaxy S22 Ultra 5G được kế thừa form thiết kế từ những dòng Note trước đây của hãng đem đến cho bạn có cảm giác vừa mới lạ vừa hoài niệm. Khối lượng của máy 228 g cho cảm giác cầm nắm đầm tay, khi cầm máy trần thì hơi có cảm giác dễ trượt.', N'5004 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt8', 194, N'64GB', N'IOS 16', N'200 - 12 MP', N'12 Tháng', N'Dài 150.9 mm - Ngang 75.7 mm - Dày 8.3 mm', N'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.', N'5005 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'dt9', 195, N'128GB', N'android 11', N'200 - 12 MP', N'12 Tháng ', N'Dài 163.56 mm - Ngang 75.78 mm - Dày 8.75 mm', N'Điện thoại Xiaomi Redmi Note 11S sẵn sàng đem đến cho bạn những trải nghiệm vô cùng hoàn hảo về chơi game, các tác vụ sử dụng hằng ngày hay sự ấn tượng từ vẻ đẹp bên ngoài.', N'5006 mAH')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt1', 1100, N'8GB', N'Windows 11', NULL, N'12 Tháng', N'12.4 inch', N'Surface Laptop Go xứng đáng là chiếc laptop đáng mua trong năm nay dành cho những người đang có nhu cầu tìm mua một chiếc laptop có giá thành phải chăng nhưng hiệu năng vẫn đủ mạnh mẽ đáp ứng nhu cầu làm việc và học tập.', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt10', 1240, N'16GB', N'Mac OS', NULL, N'12 Tháng ', N'13.3 inch', N'Siêu phẩm MacBook Air M2 được trình làng vào giữa năm 2022 một lần nữa đã khẳng định vị thế của Apple trong phân khúc laptop cao cấp - sang trọng, đánh bật mọi rào cản với con chip Apple M2 đầy mạnh mẽ cùng lối thiết kế lịch lãm, thời thượng đặc trưng cùn', N'56.6Wh Lithium-Polymer ')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt11', 999, N'16GB', N'Dos', NULL, N'12 Tháng', N'14 inch', NULL, N'72Wh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt12', 1600, N'8GB', N'Windows 11', NULL, N'12 Tháng ', N'15 inch', N'Modern 15 là phiên bản laptop học tập - văn phòng đến từ nhà MSI với xu hướng thiết kế gọn nhẹ, hiện đại cùng hiệu năng vượt trội đến từ con chip Intel Gen 11 ấn tượng, đáp ứng tối đa nhu cầu giải trí và làm việc cho người dùng.', N'3 cell 52Wh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt13', 1300, N'8GB', N'Windows 11', NULL, N'12 Tháng', N'13.3 inch', N'Laptop MSI Modern 14 là phiên bản laptop văn phòng được nhà MSI cho ra mắt với sứ mệnh phục vụ tốt mọi tác vụ thiết yếu cơ bản hằng ngày của người dùng khi sở hữu cấu hình ổn định đến từ con chip Intel Gen 11 cùng ngoại hình trang nhã, thời thượng và mang', N'3 cell 39Whr')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt14', 1950, N'16GB', N'Windows 11', NULL, N'12 Tháng ', N'15 inch', N'Laptop Lenovo Ideapad Gaming 3 2022 thuộc dòng laptop gaming mang vẻ đẹp ấn tượng, cuốn hút nhưng không kém phần mạnh mẽ nhờ vào CPU Intel Gen 12, sẵn sàng đồng hành cùng bạn trên mọi đấu trường game hiện nay.', N'75Wh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt15', 2315, N'32GB', N'Windows 11', NULL, N'12 Tháng', N'14 inch', NULL, N'Integrated 60Wh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt2', 1400, N'16GB', N'Mac OS', NULL, N'12 Tháng ', N'13.3 inch', N'MacBook Pro M2 2022 sẽ đem đến cho người dùng sự cộng hưởng trong thiết kế đẳng cấp và hiệu năng vượt trội. ', N'58.2-watt-hour lithium-polymer battery ')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt3', 1470, N'8GB', N'Windows 11', NULL, N'12 Tháng', N'14 inch', NULL, N'Integrated 50Wh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt4', 1600, N'16GB', N'Windows 11', NULL, N'12 Tháng ', N'14 inch', N'Với sức mạnh hiệu năng vượt trội đến từ con chip Intel Gen 11 tân tiến ẩn bên trong vẻ ngoài đơn giản mà hiện đại, HP Pavilion 14 sẽ đáp ứng tốt các tác vụ học tập, làm việc cơ bản cũng như xem phim, chơi game giải trí nhẹ nhàng.', N'3-cell, 41 Wh Li-ion')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt5', 1600, N'8GB', N'Windows 11', NULL, N'12 Tháng', N'14 inch', N'Với sức mạnh hiệu năng vượt trội đến từ con chip Intel Gen 11 tân tiến ẩn bên trong vẻ ngoài đơn giản mà hiện đại, HP Pavilion 14 sẽ đáp ứng tốt các tác vụ học tập, làm việc cơ bản cũng như xem phim, chơi game giải trí nhẹ nhàng.', N'3-cell, 41 Wh Li-ion')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt6', 1860, N'8GB', N'Windows 11', NULL, N'12 Tháng ', N'15.6 inch', N'Khơi nguồn mọi cảm hứng game thủ với cấu hình mạnh mẽ đến từ con chip Intel thế hệ 11 tân tiến cùng lối thiết kế cơ động, chuẩn gaming, MSI Katana GF66 hứa hẹn sẽ là một chiến binh dũng mãnh cùng bạn xông pha trên mọi thế trận.', N'3 cell, 51Wh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt7', 1290, N'16GB', N'Mac OS', NULL, N'12 Tháng', N'13.6 inch', N'Thiết kế thanh lịch, sang trọng cùng hiệu năng vượt trội đến từ vi xử lý tân tiến Apple M2 có trong Macbook Pro M2, hứa hẹn sẽ mang lại nhiều giá trị cho người dùng sáng tạo, phục vụ tốt nhu cầu thiết kế đồ hoạ nâng cao.', N'Built in Polymer, 49.9Whr')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt8', 1600, N'8GB', N'Windows 11', NULL, N'12 Tháng ', N'14 inch', N'Modern 15 là phiên bản laptop học tập - văn phòng đến từ nhà MSI với xu hướng thiết kế gọn nhẹ, hiện đại cùng hiệu năng vượt trội đến từ con chip Intel Gen 11 ấn tượng, đáp ứng tối đa nhu cầu giải trí và làm việc cho người dùng.', N'3 cell 52Wh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mt9', 2100, N'8GB', N'Windows 11', NULL, N'12 Tháng', N'13.3 inch', N'Khơi nguồn mọi cảm hứng game thủ với cấu hình mạnh mẽ đến từ con chip Intel thế hệ 11 tân tiến cùng lối thiết kế cơ động, chuẩn gaming, MSI Katana GF66 hứa hẹn sẽ là một chiến binh dũng mãnh cùng bạn xông pha trên mọi thế trận.', N'3 cell, 53.5Wh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb1', 508, N'64GB', N'Android', N'8.0MP', N'12 tháng', N'10,5 inch', N'Với thiết kế kim loại nguyên khối cao cấp đặc trưng của dòng máy tính bảng Samsung, Galaxy Tab A8 2022 nổi bật với diện mạo mỏng nhẹ (6.9mm, 508g) tinh tế. Màu sắc hiện đại cho bạn thỏa sức khoe cá tính và gu thẩm mỹ đáng nể.', N'7040mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb10', 297, N'256GB', N'IPadOS', N'12MP', N'12 tháng', N'8 inch', N'iPad mini 6 Cellular sẽ khiến bạn đắm chìm từ lần đầu với thiết kế tràn cạnh, các góc bo tròn tinh tế, thanh lịch và màn hình viền mỏng sắc nét. Màu sắc thời trang cùng ngôn ngữ thiết kế hiện đại tạo nên một sản phẩm công nghệ nổi bật và ấn tượng.', N'8000mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb11', 460, N'64GB', N'Android', N'8.0MP', N'12 tháng', N' 10 inch', N'Sở hữu thiết kế đẹp mắt cùng các tính năng ấn tượng, máy tính bảng chính hãng Lenovo Tab M10 FHD Gen 3 phù hợp với đối tượng sử dụng là gia đình, phụ huynh mua cho con em để học tập và giải trí.', N'5000mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb12', 490, N'64GB', N'Android', N'13MP', N'24 tháng', N'11 inch', N'Lenovo Tab P11 Plus TB-J616X với cấu hình mạnh mẽ cùng nhiều chế độ tiện ích giúp người dùng thoải mái sáng tạo mọi lúc, mọi nơi.', N'7700mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb13', 371, N'32GB', N'Android', N'5.0MP', N'12 tháng', N'8 inch', N'Lenovo Tab M8 TB-8505X được biết đến với cấu hình mạnh mẽ, pin trâu, màn hình hiển thị rộng rãi. Quản lý nội dung trong máy với tài khoản trẻ em. Với mức giá tầm trung đáp ứng đầy đủ các yêu cầu của người dùng như đọc báo, xem phim, lướt web…', N'5000mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb14', 650, N'128GB', N'Android', N'8.0MP', N'12 tháng', N'11 inch', N'Với nhiều ưu điểm vượt trội về bộ vi xử lý, màn hình và âm thanh sống động, máy tính bảng Lenovo Yoga Tablet P11 còn sở hữu một ngoại hình độc đáo chắc chắn sẽ thu hút bạn ngay từ cái nhìn đầu tiên. ', N'7500mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb15', 490, N'64GB', N'Android', N'8.0MP', N'24 tháng', N' 11 inch', N'Lenovo Tab P11 Plus TB-J616X với cấu hình mạnh mẽ cùng nhiều chế độ tiện ích giúp người dùng thoải mái sáng tạo mọi lúc, mọi nơi.', N'7700mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb2', 371, N'32GB', N'Android', N'8.0MP', N'12 tháng', N'8 inch', N'Làm việc, giải trí hết mình với Samsung Galaxy Tab A7 Lite T225N - sản phẩm máy tính bảng Samsung với trải nghiệm linh hoạt, nội dung bất tận mọi lúc, mọi nơi.', N'5100mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb3', 467, N'64GB', N'Android ', N'8.0MP', N'12 tháng', N'5,6 inch', N'Máy tính bảng Samsung Galaxy Tab S6 Lite (2022) với thiết kế bằng kim loại nguyên khối, màn hình rộng rãi độ hiển thị lớn, pin khủng cùng S Pen thế hệ mới cho phép người dùng thoả sức sáng tạo, ghi chú dễ dàng và thuận tiện.', N'7040 mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb4', 728, N'128GB', N'Android', N'13MP+6MP', N'12 tháng', N'14 inch', N'Được ra mắt với kích thước màn hình cực khủng cùng hiệu năng mạnh mẽ ấn tượng ngang với một chiếc laptop, Máy tính bảng Samsung Galaxy Tab S8 Ultra 5G mang đến cho bạn những trải nghiệm độc đáo, ấn tượng chỉ có trên thiết bị. ', N'11200mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb5', 507, N'128GB', N'Android', N'13MP + 6MP', N'12 tháng', N'11 inch', N'Không chỉ sở hữu kích thước lớn nhất, dòng Galaxy Tab S8 còn được thiết kế cho bạn thỏa sức sáng tạo như dân chuyên nghiệp. Dễ dàng ghi lại khoảnh khắc đắt giá với camera trước góc rộng đầu tiên trên máy tính bảng Galaxy và chỉnh sửa cho bức ảnh thêm hoàn', N'8000mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb6', 498, N'64GB', N'IPadOS', N'8MP', N'12 tháng', N'10 inch', N'iPad Gen 9 10.2 inch sở hữu thiết kế hiện đại, tinh tế và sang trọng đặc trưng của dòng sản phẩm Apple. Với vỏ ngoài bằng nhôm sáng bóng mang lại cho chiếc iPad một vẻ ngoài hiện đại, cao cấp và bền bỉ.', N'8000mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb7', 470, N'128GB', N'IPadOS', N'12MP&10MP', N'12 tháng', N'11 inch', N'Là mẫu máy tính bảng nổi bật nhất của Apple trong lần trở lại năm 2022, Apple iPad Pro M2 với nhiều cải tiến về công nghệ cũng như vẻ ngoài cao cấp, sang chảnh cùng hiệu năng mạnh mẽ đã nhận được nhiều đồn đoán và sự kỳ vọng của thị trường ngay từ khi còn', N'7010mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb8', 461, N'64GB', N'IPadOS', N'12MP', N'12 tháng', N'10 inch', N'iPad Air 5 được trang bị màn hình Retina IPS LCD  mang lại cho bạn trải nghiệm màu sắc sống động. Màn hình với cảm ứng đa điểm siêu nhạy, tương thích tốt với Apple Pencil, nhờ đó giúp bạn thực hiện hóa mọi ý tưởng trong tầm tay.', N'7050mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'mtb9', 487, N'256GB', N'IPadOS', N'8MP', N'12 tháng', N'10 inch', N'iPad Gen 9 sở hữu một màn hình Retina 10.2 inch sắc nét với mài sắc sống động, hình ảnh chi tiết. Công nghệ True Tone giúp điều chỉnh màn hình theo nhiệt độ màu của môi trường giúp hình ảnh luôn vô cùng hấp dẫn. Màn hình lớn giúp đôi mắt của bạn dễ chịu h', N'8000mAh')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's1', 0, NULL, NULL, NULL, N'12 Tháng', N'Dài 8,3 cm - Ngang 4 cm - Cao 2,6 cm', N'Dòng sạc tối đa: 20 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's10', 0, NULL, NULL, NULL, N'12 Tháng', N'Dài 5.3 cm - Ngang 3.5 cm - Cao 3.7 cm', N'Dòng sạc tối đa: 30 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's11', 0, NULL, NULL, NULL, N'12 Tháng', N'Dài 7.8 cm - Ngang 4.1 cm - Cao 2.6 cm', N'Dòng sạc tối đa: 25 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's12', 0, NULL, NULL, NULL, N'12 Tháng', N'Dài 7.3 cm - Ngang 4.3 cm - Cao 2.6 cm', N'Dòng sạc tối đa: 25 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's13', 0, NULL, NULL, NULL, N'24 Tháng', N'Dài 2.8 cm - Ngang 2.8 cm - Cao 5.2 cm', N'Dòng sạc tối đa: 30 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's14', 0, NULL, NULL, NULL, N'24 Tháng', N'Dài 5.5 cm - Ngang 4 cm - Cao 3.8 cm', N'Dòng sạc tối đa: 20 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's15', 0, NULL, NULL, NULL, N'18 Tháng', N'Cao 7.3 cm - Rộng 6 cm - Dày 2.8 cm', N'Dòng sạc tối đa: 12 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's2', 0, NULL, NULL, NULL, N'12 Tháng', N'Dài 8,5 cm - Ngang 4,3 cm  - Cao 2,7 cm', N'Dòng sạc tối đa: 20 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's3', 0, NULL, NULL, NULL, N'24 Tháng', N'Dài 9,3 cm - Ngang 5,5 cm  - Cao 2,8 cm', N'Dòng sạc tối đa: 15 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's4', 0, NULL, NULL, NULL, N'12 Tháng', N'Dài 8.3 cm - Ngang 4 cm - Cao 2.6 cm', N'Dòng sạc tối đa: 15 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's5', 0, NULL, NULL, NULL, N'12 Tháng', N'Dài 4.6 cm - Ngang 2.7 cm- Cao 3 cm', N'Dòng sạc tối đa: 20 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's6', 0, NULL, NULL, NULL, N'12 Tháng', N'Dài 5.8 cm - Ngang 3.9 cm - Cao 2.7 cm', N'Dòng sạc tối đa: 20 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's7', 0, NULL, NULL, NULL, N'24 Tháng', N'Dài 7.3 cm - Ngang 4.3 cm - Cao 2.6 cm', N'Dòng sạc tối đa: 25 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's8', 0, NULL, NULL, NULL, N'24 Tháng', N'Dài 5.7 cm - Ngang 3.8 cm - Cao 2.6 cm', N'Dòng sạc tối đa: 20 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N's9', 0, NULL, NULL, NULL, N'12 Tháng', N'Dài 3.1 cm - Ngang 3 cm - Cao 5 cm', N'Dòng sạc tối đa: 20 W', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tivi1', 0, N'null', N'Android TV 10', N'null', N'24 tháng', N'55 inch', N'Công nghệ âm thanh Dolby Atmos mang rạp hát đến căn phòng của bạn', N'null')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tivi10', 0, N'null', N'Google TV', N'null', N'24 tháng', N'65 inch', N'Chiếu hình từ điện thoại lên TV cực dễ dàng với AirPlay2,Chromecast', N'null')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tivi2', 0, N'null', N'Tizen OS', N'null', N'24 tháng', N'43 inch', N'Tuyệt tác thiết kế ấn tượng từ tương lai', N'null')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tivi3', 0, N'null', N'Android TV 11', N'null', N'24 tháng', N'32 inch', N'Thiết kê màn hình tràn viền siêu mỏng, công nghệ sản xuất tinh tế tạo ra khung viền màn hình mỏng nhất, vừa khít với viền màn hình mang đến cho bạn trải nghiệm hình ảnh vô cực, thị giác vô biên', N'null')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tivi4', 0, N'null', N'Google TV', N'null', N'24 tháng', N'65 inch', N'Công nghệ âm thanh Dolby Audio + DTS mang rạp hát đến căn phòng của bạn', N'null')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tivi5', 0, N'null', N'WebOS', N'null', N'24 tháng', N'55 inch', N'Tuyệt tác thiết kế ấn tượng từ tương lai', N'null')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tivi6', 0, N'null', N'WebOS', N'null', N'24 tháng', N'55 inch', N'Trí tuệ nhân tao thông minh vượt bậc ThinQ AI', N'null')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tivi7', 0, N'null', N'Tizen OS', N'null', N'24 tháng', N'55 inch', N'Tuyệt tác thiết kế ấn tượng từ tương lai', N'null')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tivi8', 0, N'null', N'Google TV', N'null', N'24 tháng', N'50 inch', N'Hệ điều hành Google TV có giao diện gọn gàng, kho ứng dụng phong phú.', N'null')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tivi9', 0, N'null', N'Google TV', N'null', N'24 tháng', N'55 inch', N'Điều khiển tivi Sony bằng giọng nói hỗ trợ tiếng Việt nhờ trợ lý ảo Google Assistant.   ', N'null')
GO
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn1', 5.4, NULL, NULL, NULL, N'12 Tháng', N'Dài 3.09 cm - Rộng 2.18 cm - Cao 2.17 cm', N'Điều khiển: Cảm ứng chạm', N'Thời lượng pin hộp sạc: Dùng 30 giờ - Sạc Hãng không công bố')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn10', 8, NULL, NULL, NULL, N'12 Tháng', N'Dài 2.9 cm - Rộng 1.8 cm - Cao 2.8 cm', N'Điều khiển: Phím nhấn', N'Thời lượng pin hộp sạc: Dùng 32 giờ - Sạc 2 giờ')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn11', 0, NULL, NULL, NULL, N'12 Tháng', N'Độ dài dây : 1.2 m', N'Điều khiển : Nút bấm vật lý', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn12', 0, NULL, NULL, NULL, N'12 Tháng', N'Độ dài dây : 1.2 m', N'Điều khiển : Nút bấm vật lý', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn13', 35.5, NULL, NULL, NULL, N'12 Tháng', N'Độ dài dây : 1.1 m', N'Điều khiển : Nút bấm vật lý', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn14', 0, NULL, NULL, NULL, N'12 Tháng', N'Độ dài dây : 1.2 m', N'Điều khiển : Nút bấm vật lý', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn15', 6, NULL, NULL, NULL, N'12 Tháng', N'Độ dài dây : 1.25 m', N'Điều khiển : Nút bấm vật lý', NULL)
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn2', 5.3, NULL, NULL, NULL, N'12 Tháng', N'Dài 2.4 cm - Rộng 2.18 cm - Cao 3.09 cm', N'Điều khiển: Cảm ứng lực', N'Thời lượng pin hộp sạc: Dùng 24 giờ - Sạc 3 giờ')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn3', 5.4, NULL, NULL, NULL, N'12 Tháng', N'Dài 3.1 cm - Rộng 1.8 cm - Cao 2.4 cm', N'Điều khiển: Cảm ứng lực', N'Thời lượng pin hộp sạc: Dùng 24 giờ - Sạc 3 giờ')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn4', 5.6, NULL, NULL, NULL, N'12 Tháng', N'Dài 3 cm - Rộng 2.4 cm - Cao 1.9 cm', N'Điều khiển: Cảm ứng chạm', N'Thời lượng pin hộp sạc: Dùng 18 giờ - Sạc Hãng không công bố')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn5', 11, NULL, NULL, NULL, N'12 Tháng', N'Dài 7.7 cm - Rộng 7.7 cm - Cao 4.3 cm', N'Điều khiển: Phím nhấn', N'Thời lượng pin hộp sạc: Dùng 24 giờ - Sạc 3 giờ')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn6', 58, NULL, NULL, NULL, N'12 Tháng', N'Độ dài dây: 24.5 cm', N'Điều khiển: Phím nhấn', N'Thời lượng pin tai nghe: Dùng 10 giờ - Sạc 3.5 giờ')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn7', 7.3, NULL, NULL, NULL, N'12 Tháng', N'Dài 2.6 cm - Rộng 2.1 cm - Cao 2.7 cm', N'Điều khiển: Cảm ứng chạm', N'Thời lượng pin hộp sạc: Dùng 24 giờ - Sạc 2.5 giờ')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn8', 8.5, NULL, NULL, NULL, N'12 Tháng', N'Dài 3.3 cm - Rộng 1.8 cm - Cao 3 cm', N'Điều khiển: Cảm ứng chạm', N'Thời lượng pin hộp sạc: Dùng 24 giờ - Sạc 3.5 giờ')
INSERT [dbo].[ChiTietSP] ([MaSP], [TrongLuong], [BoNho], [HeDieuHanh], [Camera], [BaoHanh], [KichThuoc], [MoTa], [Pin]) VALUES (N'tn9', 4.4, NULL, NULL, NULL, N'12 Tháng', N'Dài 3 cm - Rộng 1.4 cm - Cao 2.2 cm', N'Điều khiển: Cảm ứng chạm', N'Thời lượng pin hộp sạc: Dùng 24 giờ - Sạc 2 giờ')
GO
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [RoleID], [Status], [CreatedDate]) VALUES (N'1', N'1', N'customer', 1, CAST(N'2023-04-04' AS Date))
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [RoleID], [Status], [CreatedDate]) VALUES (N'abc', N'123456', N'customer', 1, CAST(N'2023-03-29' AS Date))
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [RoleID], [Status], [CreatedDate]) VALUES (N'admin', N'123', N'admin', 1, CAST(N'2023-03-21' AS Date))
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [RoleID], [Status], [CreatedDate]) VALUES (N'hung', N'123', N'customer', 1, CAST(N'2023-04-09' AS Date))
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [RoleID], [Status], [CreatedDate]) VALUES (N'test', N'123', N'customer', 1, CAST(N'2023-03-29' AS Date))
GO
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'banphim', N'Bàn phím')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'chuot', N'Chuột')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'dienthoai', N'Điện thoại')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'laptop', N'Laptop')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'maytinhbang', N'Máy tính bảng')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'sac', N'Sạc')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'tainghe', N'Tai nghe')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (N'tv', N'Tivi')
GO
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'104/04/2023 14:57:2', CAST(N'2023-04-04' AS Date), N'1', N'robot', 161000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'104/04/2023 14:59:1', CAST(N'2023-04-04' AS Date), N'1', N'robot', 200000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'104/04/2023 15:12:0', CAST(N'2023-04-04' AS Date), N'1', N'robot', 230000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'HDB01', CAST(N'2019-02-04' AS Date), N'kh1', N'NV01', 40789000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'HDB02', CAST(N'2022-01-06' AS Date), N'kh2', N'NV02', 9980000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'HDB03', CAST(N'2021-09-12' AS Date), N'kh3', N'NV03', 43300000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'HDB04', CAST(N'2022-11-22' AS Date), N'kh4', N'NV04', 45930000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'HDB05', CAST(N'2022-04-27' AS Date), N'kh5', N'NV05', 2870000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'HDB06', CAST(N'2023-06-01' AS Date), N'kh6', N'NV06', 311680000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'HDB07', CAST(N'2024-07-15' AS Date), N'kh7', N'NV07', 97560000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'HDB08', CAST(N'2025-07-19' AS Date), N'kh8', N'NV08', 65940000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'HDB09', CAST(N'2026-10-10' AS Date), N'kh9', N'NV09', 123467000.0000)
INSERT [dbo].[HoaDonBan] ([MaHDB], [NgayBan], [MaKH], [MaNV], [TongTien]) VALUES (N'HDB10', CAST(N'2027-12-30' AS Date), N'kh15', N'NV010', 9980000.0000)
GO
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN01', N'NCC02', CAST(N'2022-11-08' AS Date), N'NV02', 339790000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN010', N'NCC03', CAST(N'2022-06-15' AS Date), N'NV010', 1095930000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN011', N'NCC02', CAST(N'2023-03-23' AS Date), N'NV09', 58880000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN012', N'NCC01', CAST(N'2023-07-23' AS Date), N'NV07', 6800000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN013', N'NCC04', CAST(N'2023-08-11' AS Date), N'NV06', 250680000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN02', N'NCC01', CAST(N'2022-12-14' AS Date), N'NV010', 382280000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN03', N'NCC01', CAST(N'2023-01-16' AS Date), N'NV08', 70670000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN04', N'NCC03', CAST(N'2023-02-17' AS Date), N'NV02', 178150000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN05', N'NCC06', CAST(N'2023-03-10' AS Date), N'NV01', 11001000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN06', N'NCC05', CAST(N'2023-03-19' AS Date), N'NV03', 1905410000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN07', N'NCC05', CAST(N'2023-03-20' AS Date), N'NV04', 1074964000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN08', N'NCC02', CAST(N'2023-04-21' AS Date), N'NV07', 424983000.0000)
INSERT [dbo].[HoaDonNhap] ([MaHDN], [MaNCC], [NgayNhap], [MaNV], [TongTien]) VALUES (N'HDN09', N'NCC04', CAST(N'2023-05-22' AS Date), N'NV011', 795655000.0000)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'1', N'1', N'12', N'12')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'hung', N'hung', N'04832942', N'nd')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh1', N'Bùi Ngọc Tiến', N'0987363222', N'Thanh Hóa')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh10', N'Nguyễn Đức Trọng', N'0987363231', N'Nam Định')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh11', N'Phạm Bích Hằng', N'0987363232', N'Quảng Ninh')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh12', N'Nguyễn Phương Hoa', N'0987363233', N'Thái Bình')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh13', N'Nguyễn Hải Linh', N'0987363234', N'Hà Nội')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh14', N'Đoàn Phi Hùng', N'0987363235', N'Hà Nội')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh15', N'Bùi Xuân Huấn', N'0987363236', N'Yên Bái')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh16', N'Nguyễn Việt Hưng', N'0987363237', N'Hà Nam')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh17', N'Lý Mai Hoa', N'0987363238', N'Thanh Hóa')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh18', N'Đặng Thị Huế', N'0987363239', N'Nam Định')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh19', N'Nguyễn Thị Ngọc', N'0987363240', N'Nam Định')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh2', N'Phạm Duy Hưng', N'0987363223', N'Nam Định')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh20', N'Lê Đình Cương', N'0987363241', N'Bắc Giang')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh3', N'Hà Tuấn Thành', N'0987363224', N'Thanh Hóa')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh4', N'Nguyễn Đức Quân', N'0987363225', N'Thanh Hóa')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh5', N'Tôn Trung Nghĩa', N'0987363226', N'Nghệ An')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh6', N'Nguyễn Phương Thảo', N'0987363227', N'Nam Định')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh7', N'Phạm Văn Minh', N'0987363228', N'Thái Bình')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh8', N'Ngô Bá Khá', N'0987363229', N'Bắc Ninh')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDTKH], [DiaChiKH]) VALUES (N'kh9', N'Nguyễn Nam Hải', N'0987363230', N'Nam Định')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDTNCC], [DiaChiNCC]) VALUES (N'NCC01', N'Công Ty TNHH Điện tử Hoàn Kiếm', N'02439437100', N'38A Hai Bà Trưng, Hoàn Kiếm, Hà Nội')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDTNCC], [DiaChiNCC]) VALUES (N'NCC02', N'Công ty TNHH Kỹ thuật T&D', N'02437672416', N'30 Nguyễn Khánh Toàn, Cầu Giấy, Hà Nội 122480')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDTNCC], [DiaChiNCC]) VALUES (N'NCC03', N'Công Ty Điện Tử Tin Học Quốc Tuấn', N'02435148315', N'Số 2A Ngõ 165 Thái Hà Đống Đa Hà Nội')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDTNCC], [DiaChiNCC]) VALUES (N'NCC04', N'Công ty TNHH Thiết bị điện – điện tử viễn thông Khánh Linh', N'0438234262', N'29 Hàng Cháo, Hà Nội')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDTNCC], [DiaChiNCC]) VALUES (N'NCC05', N'Công ty cổ phần xây lắp thiết bị cơ điện Hà Nội', N'02437919595', N'Số 16 Ngõ 477 Kim Mã, Q. Ba Đình, TP. Hà Nội')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDTNCC], [DiaChiNCC]) VALUES (N'NCC06', N'Công Ty TNHH Canon Việt Nam', N'02439746401', N'Khu Công Nghiệp Thăng Long, Lô A1,H. Đông Anh, Hà Nội')
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV01', N'Nguyễn Thị Hải', CAST(N'1990-02-23' AS Date), N'0971011513', N'Nữ', N'Hà Nội')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV010', N'Nguyễn Mai Hương', CAST(N'2000-01-01' AS Date), N'0318173811', N'Nữ', N'TP Hồ Chí Minh')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV011', N'Lê Quang Hưng', CAST(N'2000-01-01' AS Date), N'0329849843', N'Nam', N'Hưng Yên')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV012', N'Phạm Văn Minh', CAST(N'2000-02-02' AS Date), N'0972817233', N'Nam', N'Thái Nguyên')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV02', N'Nguyễn Đức Quân', CAST(N'1992-12-24' AS Date), N'0971667232', N'Nam', N'Bình Định')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV03', N'Lê Thu Bạch', CAST(N'1990-02-21' AS Date), N'0335508238', N'Nữ', N'TP Hồ Chí Minh')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV04', N'Lê Văn Hùng', CAST(N'1990-12-20' AS Date), N'0312734738', N'Nam', N'Hà Nội')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV05', N'Bùi Ngọc Tiến', CAST(N'2000-11-10' AS Date), N'0338172391', N'Nam', N'Hà Nội')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV06', N'Hà Tuấn Thành', CAST(N'1991-08-12' AS Date), N'0972823712', N'Nam', N'Hải Phòng')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV07', N'Trần Thanh Mai', CAST(N'1991-01-02' AS Date), N'0973817381', N'Nữ', N'TP Hồ Chí Minh')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV08', N'Tôn Trung Nghĩa', CAST(N'2000-01-01' AS Date), N'0328718711', N'Nam', N'Hà Nội')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'NV09', N'Phạm Duy Hưng', CAST(N'2000-02-01' AS Date), N'0971981391', N'Nam', N'Hà Nội')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDTNV], [GioiTinh], [DiaChiNV]) VALUES (N'robot', N'ROBOT', CAST(N'2023-04-04' AS Date), N'0123456789', N'BEDE', N'Bốn biển là nhà')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (N'admin', N'Admin', N'Quản trị viên')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (N'customer', N'Customer', N'Khách hàng')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (N'staff', N'Staff', N'Nhân viên bán hàng')
GO
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp1', N'banphim', N'Bàn Phím Gập Không Dây Mipow Miffy Mini Slim-Fold MPC-003 ', 62, 1590000.0000, N'bp1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp10', N'banphim', N'Bàn Phím Cơ Có Dây Gaming Razer Huntsman Tournament Edition', 44, 3550000.0000, N'bp10.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp11', N'banphim', N'Bàn Phím Cơ Có Dây Gaming Razer BlackWidow', 50, 2560000.0000, N'bp11.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp12', N'banphim', N'Bàn Phím Cơ Có Dây Gaming Corsair K68 RGB Mechanical', 15, 2635000.0000, N'bp12.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp13', N'banphim', N'Bàn Phím Có dây Gaming MSI Vigor GK30 US', 35, 970000.0000, N'bp13.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp14', N'banphim', N'Bàn Phím Cơ Có Dây Gaming Rapoo V500Pro', 33, 990000.0000, N'bp14.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp15', N'banphim', N'Bàn Phím Cơ Có Dây Gaming Rapoo V500alloy', 12, 600000.0000, N'bp15.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp2', N'banphim', N'Bàn phím Bluetooth Logitech K380', 44, 790000.0000, N'bp2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp3', N'banphim', N'Bàn phím cơ không dây Zadez GT-015DK', 50, 1490000.0000, N'bp3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp4', N'banphim', N'Bàn phím giả cơ có dây Zadez G-850K', 15, 350000.0000, N'bp4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp5', N'banphim', N'Bàn phím không dây Logitech MK240', 35, 549000.0000, N'bp5.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp6', N'banphim', N'Bàn Phím Cơ Có Dây Gaming Corsair K63 Compact Mechanical', 36, 1750000.0000, N'bp6.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp7', N'banphim', N'Bàn phím Magic Keyboard Apple MK2A3 Trắng', 12, 3190000.0000, N'bp7.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp8', N'banphim', N'Bàn Phím Cơ Có Dây Gaming Silent Razer BlackWidow Lite', 22, 2390000.0000, N'bp8.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'bp9', N'banphim', N'Bàn Phím Cơ Có Dây Gaming Razer BlackWidow V3', 60, 3640000.0000, N'bp9.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c1', N'chuot', N'Chuột Gaming Asus CERBERUS', 34, 499000.0000, N'c1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c10', N'chuot', N'Chuột không dây Targus W620', 23, 337500.0000, N'c10.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c11', N'chuot', N'Chuột Bluetooth và USB Targus B582', 24, 540000.0000, N'c11.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c12', N'chuot', N'Chuột Gaming Logitech G502 Hero High Performance', 42, 1759000.0000, N'c12.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c13', N'chuot', N'Chuột Gaming Logitech G102 Gen2 Lightsync', 36, 600000.0000, N'c13.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c14', N'chuot', N'Chuột Gaming không dây Logitech G304', 12, 890000.0000, N'c14.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c15', N'chuot', N'Chuột gaming Corsair Iron claw RGB', 22, 1611000.0000, N'c15.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c2', N'chuot', N'Chuột không dây Logitech M221', 56, 319000.0000, N'c2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c3', N'chuot', N'Chuột không dây quang Microsoft 1850', 44, 375000.0000, N'c3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c4', N'chuot', N'Chuột không dây Logitech M221', 50, 319000.0000, N'c4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c5', N'chuot', N'Chuột có dây Prolink 1005', 30, 107000.0000, N'c5.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c6', N'chuot', N'Chuột Bluetooth Rapoo M100 silent', 46, 287000.0000, N'c6.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c7', N'chuot', N'Chuột không dây Prolink PMW5008', 52, 200000.0000, N'c7.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c8', N'chuot', N'Chuột không dây ZADEZ M390', 20, 200000.0000, N'c8.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'c9', N'chuot', N'Chuột không dây A4tech G3-200N', 40, 200000.0000, N'C9.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt1', N'dienthoai', N'Samsung Galaxy S23 ultra 5G', 30, 26990000.0000, N'dt1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt10', N'dienthoai', N'Vivo Y35', 30, 6670000.0000, N'dt10.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt11', N'dienthoai', N'OPPO Reno8 T series', 33, 17990000.0000, N'dt11.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt12', N'dienthoai', N'Samsung Galaxy A23 ', 22, 5090000.0000, N'dt12.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt13', N'dienthoai', N'OPPO A55', 49, 3990000.0000, N'dt13.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt14', N'dienthoai', N'Samsung Galaxy S20 FE', 42, 9490000.0000, N'dt14.jpeg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt15', N'dienthoai', N'POCO C40', 66, 2990000.0000, N'dt15.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt2', N'dienthoai', N'OPPO reno8 T 5G', 59, 10990000.0000, N'dt2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt3', N'dienthoai', N'iPhone 14 Pro Max', 60, 29490000.0000, N'dt3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt4', N'dienthoai', N'iPhone 14 Pro', 40, 27190000.0000, N'dt4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt5', N'dienthoai', N'Samsung Galaxy Z Flip4 5G', 36, 18990000.0000, N'dt5.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt6', N'dienthoai', N'Xiaomi Redmi Note 11', 28, 4090000.0000, N'dt6.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt7', N'dienthoai', N'Samsung Galaxy S22 ultra 5G', 16, 23990000.0000, N'dt7.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt8', N'dienthoai', N'iPhone 11', 25, 12490000.0000, N'dt8.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'dt9', N'dienthoai', N'Xiaomi Redmi Note 11S series', 19, 5690000.0000, N'dt9.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt1', N'laptop', N'Surface Laptop Go', 50, 14999000.0000, N'laptop1.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt10', N'laptop', N'MacBook Air M2 ', 35, 27499000.0000, N'laptop10.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt11', N'laptop', N'Laptop LG Gram 14ZD90Q-G.AX56A5', 28, 30199000.0000, N'laptop11.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt12', N'laptop', N'Laptop MSI Modern 15', 15, 14699000.0000, N'laptop12.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt13', N'laptop', N'Laptop MSI Modern 14', 37, 14799000.0000, N'laptop13.jpeg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt14', N'laptop', N'Laptop Lenovo IdeaPad Gaming 3 15AIH7', 10, 27349000.0000, N'laptop14.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt15', N'laptop', N'Laptop Lenovo IdeaPad Slim 5 Pro 16ARH7', 29, 24999000.0000, N'laptop15.jpeg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt2', N'laptop', N'Laptop Apple Macbook Pro 13', 49, 35999000.0000, N'laptop2.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt3', N'laptop', N'Laptop Lenovo Thinkpad P14s ', 55, 39999000.0000, N'laptop3.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt4', N'laptop', N'Laptop HP Pavilion 14-dv2073TU', 30, 18999000.0000, N'laptop4.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt5', N'laptop', N'Laptop HP Pavilion 14-dv2069TU', 60, 13499000.0000, N'laptop5.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt6', N'laptop', N'Laptop MSI Gaming GF63 Thin ', 44, 18999000.0000, N'laptop6.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt7', N'laptop', N'Apple Macbook Air 13', 39, 31009000.0000, N'laptop7.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt8', N'laptop', N'Laptop MSI Modern 15', 47, 14599000.0000, N'laptop8.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mt9', N'laptop', N'Laptop MSI Gaming Katana GF66', 20, 22099000.0000, N'laptop9.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb1', N'maytinhbang', N'Máy tính bảng Samsung Galaxy Tab A8 2022 X205N', 20, 6290000.0000, N'mtb1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb10', N'maytinhbang', N'Máy tính bảng Apple IPad mini 6 Cellular', 40, 20890000.0000, N'mtb10.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb11', N'maytinhbang', N'Máy tính bảng Lenovo Tab M10 FHD Gen 3', 25, 5590000.0000, N'mtb11.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb12', N'maytinhbang', N'Máy tính bảng Lenovo Tab P11 Plus TB-J616X', 22, 6790000.0000, N'mtb12.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb13', N'maytinhbang', N'Máy tính bảng Lenovo Tab M8 TB-8505X', 34, 3250000.0000, N'mtb13.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb14', N'maytinhbang', N'Máy tính bảng Lenovo Yoga Tablet P11 YT-J706X', 37, 9990000.0000, N'mtb14.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb15', N'maytinhbang', N'Máy tính bảng Lenovo Tab P11 Plus TB-J616X', 36, 6790000.0000, N'mtb15.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb2', N'maytinhbang', N'Máy tính bảng Samsung Galaxy Tab A 7 Lite T225 ', 15, 3450000.0000, N'mtb2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb3', N'maytinhbang', N'Máy tính bảng Samsung Galaxy Tab S6 Lite ', 25, 7290000.0000, N'mtb3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb4', N'maytinhbang', N'Máy tính bảng Samsung Galaxy Tab S 8 Ultra 5G X906B', 30, 23790000.0000, N'mtb4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb5', N'maytinhbang', N'Máy tính bảng Samsung Galaxy Tab S 8 5G X706B', 40, 15690000.0000, N'mtb5.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb6', N'maytinhbang', N'Máy tính bảng Apple IPad Gen 9 10.2 Cellular', 45, 9490000.0000, N'mtb6.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb7', N'maytinhbang', N'Máy tính bảng Apple IPad Pro 11 M2 Cellular', 30, 24490000.0000, N'mtb7.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb8', N'maytinhbang', N'Máy tính bảng Apple IPad Air 5 M1 Wifi', 50, 14490000.0000, N'mtb8.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'mtb9', N'maytinhbang', N'Máy tính bảng Apple IPad Gen 9 10.2', 20, 11290000.0000, N'mtb9.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's1', N'sac', N'Sạc nhanh iPhone MHJE3', 10, 690000.0000, N's1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's10', N'sac', N'Sạc nhanh iPhone MFM30', 20, 400000.0000, N's10.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's11', N'sac', N'Sạc Type C PD 25W Samsung EP-TA800N', 20, 490000.0000, N's11.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's12', N'sac', N'Sạc Type C PD 25W Belkin WCA004', 20, 490000.0000, N's12.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's13', N'sac', N'Sạc Type C PD GaN 30W Anker Nano 3 A2147', 20, 500000.0000, N's13.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's14', N'sac', N'Sạc Type C PD 20W Belkin WCA003 Trắng', 20, 470000.0000, N's14.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's15', N'sac', N'Sạc 2 cổng USB 12W Anker PowerPort Elite 2 - A2023 Trắng', 20, 470000.0000, N's15.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's2', N'sac', N'Sạc nhanh iPhone TCE20W', 15, 300000.0000, N's2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's3', N'sac', N'Sạc nhanh iPhone DS931-WB', 20, 225000.0000, N's3.jpeg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's4', N'sac', N'Sạc nhanh iPhone DS165X', 20, 230000.0000, N's4.jpeg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's5', N'sac', N'Sạc nhanh iPhone A2633', 20, 400000.0000, N's5.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's6', N'sac', N'Sạc nhanh iPhone TC20W', 20, 450000.0000, N's6.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's7', N'sac', N'Sạc nhanh iPhone WCA004', 20, 490000.0000, N's7.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's8', N'sac', N'Sạc nhanh iPhone Mophie', 20, 440000.0000, N's8.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N's9', N'sac', N'Sạc nhanh iPhone Hydrus MFZ20QP', 20, 400000.0000, N's9.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tivi1', N'tv', N'Smart Tivi Coex 4K 55 inch 55UT8000X Android 10', 38, 10990000.0000, N'tv1.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tivi10', N'tv', N'Smart Tivi 4K Sony KD-65X80K 65 inch Google TV', 40, 19890000.0000, N'tv10.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tivi2', N'tv', N'QLED Tivi 4K Samsung 43Q60B 43 inch Smart TV', 28, 12790000.0000, N'tv2.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tivi3', N'tv', N'Smart Tivi Coex 32 inch 32FH5000X Android 11', 40, 4990000.0000, N'tv3.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tivi4', N'tv', N'Smart Tivi Coex 4K 65 inch 65UT7100XG Google TV', 46, 10990000.0000, N'tv4.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tivi5', N'tv', N'NanoCell Tivi 4K LG 55 inch 55NANO80SQA ThinQ AI', 43, 16490000.0000, N'tv5.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tivi6', N'tv', N'OLED Tivi 4K LG 55 inch 55A2PSA ThinQ AI', 54, 24990000.0000, N'tv6.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tivi7', N'tv', N'QLED Tivi 4K Samsung 55Q70B 55 inch Smart TV', 33, 18990000.0000, N'tv7.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tivi8', N'tv', N'Smart Tivi 4K Sony KD-50X75K 50 inch Google TV', 23, 13390000.0000, N'tv8.png')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tivi9', N'tv', N'Smart Tivi 4K Sony XR-55X90K 55 inch Google TV', 33, 24390000.0000, N'tv9.png')
GO
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn1', N'tainghe', N'Tai nghe Bluetooth AirPods Pro (2nd Gen) MagSafe Charge Apple MQD83', 10, 6590000.0000, N'tn1.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn10', N'tainghe', N'Tai Nghe Bluetooth True Wireless Anker SoundCore Liberty 2 Pro A3909', 10, 3500000.0000, N'tn10.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn11', N'tainghe', N'Tai nghe Apple EarPods Lightning (MMTN2) Chính hãng Apple Việt Nam', 10, 590000.0000, N'tn11.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn12', N'tainghe', N'Tai nghe Có Dây Apple MNHF2', 10, 690000.0000, N'tn12.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn13', N'tainghe', N'Tai nghe Có Dây Type C OPPO MH135-3', 10, 260000.0000, N'tn13.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn14', N'tainghe', N'Tai nghe Có dây Type C AVA+ DS815-WB', 10, 160000.0000, N'tn14.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn15', N'tainghe', N'Tai nghe Có Dây Sony MDR-E9LP', 10, 161000.0000, N'tn15.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn2', N'tainghe', N'Tai nghe Bluetooth AirPods Pro Wireless Charge Apple MWP22', 10, 4890000.0000, N'tn2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn3', N'tainghe', N'Tai nghe Bluetooth AirPods Pro MagSafe Charge Apple MLWK3', 10, 4790000.0000, N'tn3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn4', N'tainghe', N'Tai nghe Bluetooth True Wireless Beats Fit Pro Earbuds', 10, 4665000.0000, N'tn4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn5', N'tainghe', N'Tai nghe Bluetooth True Wireless Beats Powerbeats Pro', 10, 5090000.0000, N'tn5.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn6', N'tainghe', N'Tai nghe Bluetooth Sony WI-1000XM2', 10, 5240000.0000, N'tn6.jpeg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn7', N'tainghe', N'Tai nghe Bluetooth True Wireless Sony WF-1000XM4', 10, 5490000.0000, N'tn7.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn8', N'tainghe', N'Tai nghe Bluetooth True Wireless Sony WF-1000XM3', 10, 4070000.0000, N'tn8.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [SoLuong], [GiaSP], [AnhSP]) VALUES (N'tn9', N'tainghe', N'Tai nghe Bluetooth True Wireless LG TONE-FP8', 10, 4190000.0000, N'tn9.jpg')
GO
ALTER TABLE [dbo].[ChiTietHDB] ADD  DEFAULT ((1)) FOR [SLBan]
GO
ALTER TABLE [dbo].[ChiTietHDN] ADD  DEFAULT ((1)) FOR [SLNhap]
GO
ALTER TABLE [dbo].[ChiTietSP] ADD  DEFAULT ((0.0)) FOR [TrongLuong]
GO
ALTER TABLE [dbo].[DangNhap] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[DangNhap] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HoaDonBan] ADD  DEFAULT (getdate()) FOR [NgayBan]
GO
ALTER TABLE [dbo].[HoaDonBan] ADD  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[HoaDonNhap] ADD  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[HoaDonNhap] ADD  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT (getdate()) FOR [NgaySinh]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [GiaSP]
GO
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD  CONSTRAINT [fk_cthdb_hdb] FOREIGN KEY([MaHDB])
REFERENCES [dbo].[HoaDonBan] ([MaHDB])
GO
ALTER TABLE [dbo].[ChiTietHDB] CHECK CONSTRAINT [fk_cthdb_hdb]
GO
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD  CONSTRAINT [fk_cthdb_sp] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHDB] CHECK CONSTRAINT [fk_cthdb_sp]
GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD  CONSTRAINT [fk_cthdn_hdn] FOREIGN KEY([MaHDN])
REFERENCES [dbo].[HoaDonNhap] ([MaHDN])
GO
ALTER TABLE [dbo].[ChiTietHDN] CHECK CONSTRAINT [fk_cthdn_hdn]
GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD  CONSTRAINT [fk_cthdn_sp] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHDN] CHECK CONSTRAINT [fk_cthdn_sp]
GO
ALTER TABLE [dbo].[DangNhap]  WITH CHECK ADD  CONSTRAINT [fk_dn_r] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[DangNhap] CHECK CONSTRAINT [fk_dn_r]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [fk_hdb_kh] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [fk_hdb_kh]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [fk_hdb_nv] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [fk_hdb_nv]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [fk_hdn_ncc] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [fk_hdn_ncc]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [fk_hdn_nv] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [fk_hdn_nv]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [fk_sp_ctsp] FOREIGN KEY([MaSP])
REFERENCES [dbo].[ChiTietSP] ([MaSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [fk_sp_ctsp]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [fk_sp_dm] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [fk_sp_dm]
GO
USE [master]
GO
ALTER DATABASE [BanDoDienTu] SET  READ_WRITE 
GO
