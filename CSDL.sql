USE [master]
GO
/****** Object:  Database [QLsach]    Script Date: 04/11/2017 9:08:54 PM ******/
CREATE DATABASE [QLsach] ON  PRIMARY 
( NAME = N'QLsach', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\QLsach.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLsach_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\QLsach_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLsach] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLsach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLsach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLsach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLsach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLsach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLsach] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLsach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLsach] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLsach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLsach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLsach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLsach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLsach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLsach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLsach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLsach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLsach] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLsach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLsach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLsach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLsach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLsach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLsach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLsach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLsach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLsach] SET  MULTI_USER 
GO
ALTER DATABASE [QLsach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLsach] SET DB_CHAINING OFF 
GO
USE [QLsach]
GO
/****** Object:  Table [dbo].[BaocaoDLs]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaocaoDLs](
	[IdBC] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [datetime] NOT NULL,
	[IdDL] [int] NOT NULL,
 CONSTRAINT [PK_BaocaoDLs] PRIMARY KEY CLUSTERED 
(
	[IdBC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Congnoes]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Congnoes](
	[Ngay] [datetime] NOT NULL,
	[IdDL] [int] NOT NULL,
	[SLsachlay] [int] NOT NULL,
	[Tongtienno] [int] NOT NULL,
	[Tongtiendatra] [int] NOT NULL,
 CONSTRAINT [PK_Congnoes] PRIMARY KEY CLUSTERED 
(
	[Ngay] ASC,
	[IdDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTBCDLs]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTBCDLs](
	[IdBC] [int] NOT NULL,
	[IdSach] [int] NOT NULL,
	[SLBanDc] [int] NOT NULL,
 CONSTRAINT [PK_CTBCDLs] PRIMARY KEY CLUSTERED 
(
	[IdBC] ASC,
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPNs]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPNs](
	[IdPn] [int] NOT NULL,
	[IdSach] [int] NOT NULL,
	[SL] [int] NOT NULL,
 CONSTRAINT [PK_CTPNs] PRIMARY KEY CLUSTERED 
(
	[IdPn] ASC,
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPXes]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPXes](
	[IdPx] [int] NOT NULL,
	[IdSach] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_CTPXes] PRIMARY KEY CLUSTERED 
(
	[IdPx] ASC,
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dailis]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dailis](
	[IdDL] [int] IDENTITY(1,1) NOT NULL,
	[TenDL] [nvarchar](max) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[SDT] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Dailis] PRIMARY KEY CLUSTERED 
(
	[IdDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoDLs]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoDLs](
	[IdSach] [int] NOT NULL,
	[SL] [int] NOT NULL,
	[IdDL] [int] NOT NULL,
 CONSTRAINT [PK_KhoDLs] PRIMARY KEY CLUSTERED 
(
	[IdSach] ASC,
	[IdDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khoes]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoes](
	[NgayGhi] [datetime] NOT NULL,
	[IdSach] [int] NOT NULL,
	[SL] [int] NOT NULL,
 CONSTRAINT [PK_Khoes] PRIMARY KEY CLUSTERED 
(
	[NgayGhi] ASC,
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NoNXBs]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoNXBs](
	[NgayNhap] [datetime] NOT NULL,
	[TienNo] [int] NOT NULL,
	[IdNXB] [int] NOT NULL,
 CONSTRAINT [PK_NoNXBs] PRIMARY KEY CLUSTERED 
(
	[IdNXB] ASC,
	[NgayNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NXBs]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NXBs](
	[IdNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](max) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[SDT] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_NXBs] PRIMARY KEY CLUSTERED 
(
	[IdNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phieunhaps]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phieunhaps](
	[IdPn] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[NguoiGiao] [nvarchar](max) NOT NULL,
	[IdNXB] [int] NOT NULL,
	[NguoiNhan] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Phieunhaps] PRIMARY KEY CLUSTERED 
(
	[IdPn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phieuxuats]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phieuxuats](
	[IdPx] [int] IDENTITY(1,1) NOT NULL,
	[NgayXuat] [datetime] NOT NULL,
	[NguoiNhan] [nvarchar](max) NOT NULL,
	[IdDL] [int] NOT NULL,
 CONSTRAINT [PK_Phieuxuats] PRIMARY KEY CLUSTERED 
(
	[IdPx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Saches]    Script Date: 04/11/2017 9:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saches](
	[IdSach] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](max) NOT NULL,
	[TacGia] [nvarchar](max) NOT NULL,
	[GiaNhap] [int] NOT NULL,
	[GiaXuat] [int] NOT NULL,
	[IdNXB] [int] NOT NULL,
 CONSTRAINT [PK_Saches] PRIMARY KEY CLUSTERED 
(
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Dailis] ON 

INSERT [dbo].[Dailis] ([IdDL], [TenDL], [DiaChi], [SDT]) VALUES (1, N'DL1', N'117/25 Trần Đình Xu, Q1, Tp.HCM', N'090807052')
INSERT [dbo].[Dailis] ([IdDL], [TenDL], [DiaChi], [SDT]) VALUES (2, N'DL2', N'69/96 An Dương Vương, Q5, Tp.HCM', N'090230579')
SET IDENTITY_INSERT [dbo].[Dailis] OFF
SET IDENTITY_INSERT [dbo].[NXBs] ON 

INSERT [dbo].[NXBs] ([IdNXB], [TenNXB], [DiaChi], [SDT]) VALUES (1, N'Tuổi Trẻ', N'132 Nguyễn Thị Minh Khai, Q1 Tp.HCM', N'0123456789')
INSERT [dbo].[NXBs] ([IdNXB], [TenNXB], [DiaChi], [SDT]) VALUES (2, N'Kim Đồng', N'1 Nguyễn Kiệm, Phú Nhuận', N'0987654321')
SET IDENTITY_INSERT [dbo].[NXBs] OFF
SET IDENTITY_INSERT [dbo].[Saches] ON 

INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (1, N'Tuổi Trẻ Đáng Giá Bao Nhiêu', N'Rosie Nguyễn', 50000, 60000, 1)
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (2, N'Cho Tôi Xin Một Vé Đi Tuổi Thơ ', N'Nguyễn Nhật Ánh', 40000, 50000, 1)
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (3, N'Lĩnh Nam Chích Quái', N'Nhiều Tác Giả', 250000, 280000, 2)
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (4, N'Nhiều Tác Giả', N'Nguyễn Phương Mai', 50000, 60000, 2)
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (5, N'Nếu Biết Trăm Năm Là Hữu Hạn', N'Phạm Lữ Ân', 60000, 75000, 1)
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (6, N'Quá Trẻ Để Chết: Hành Trình Nước Mỹ', N'Đinh Hằng', 40000, 55000, 2)
SET IDENTITY_INSERT [dbo].[Saches] OFF
/****** Object:  Index [IX_FK_DailiBaocaoDL]    Script Date: 04/11/2017 9:08:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_DailiBaocaoDL] ON [dbo].[BaocaoDLs]
(
	[IdDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DailiCongno]    Script Date: 04/11/2017 9:08:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_DailiCongno] ON [dbo].[Congnoes]
(
	[IdDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CTBCDLSach]    Script Date: 04/11/2017 9:08:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CTBCDLSach] ON [dbo].[CTBCDLs]
(
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SachCTPN]    Script Date: 04/11/2017 9:08:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SachCTPN] ON [dbo].[CTPNs]
(
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SachCTPX]    Script Date: 04/11/2017 9:08:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SachCTPX] ON [dbo].[CTPXes]
(
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DailiKhoDL]    Script Date: 04/11/2017 9:08:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_DailiKhoDL] ON [dbo].[KhoDLs]
(
	[IdDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SachKho]    Script Date: 04/11/2017 9:08:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SachKho] ON [dbo].[Khoes]
(
	[IdSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NXBPhieunhap]    Script Date: 04/11/2017 9:08:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_NXBPhieunhap] ON [dbo].[Phieunhaps]
(
	[IdNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DailiPhieuxuat]    Script Date: 04/11/2017 9:08:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_DailiPhieuxuat] ON [dbo].[Phieuxuats]
(
	[IdDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NXBSach]    Script Date: 04/11/2017 9:08:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_NXBSach] ON [dbo].[Saches]
(
	[IdNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BaocaoDLs]  WITH CHECK ADD  CONSTRAINT [FK_DailiBaocaoDL] FOREIGN KEY([IdDL])
REFERENCES [dbo].[Dailis] ([IdDL])
GO
ALTER TABLE [dbo].[BaocaoDLs] CHECK CONSTRAINT [FK_DailiBaocaoDL]
GO
ALTER TABLE [dbo].[Congnoes]  WITH CHECK ADD  CONSTRAINT [FK_DailiCongno] FOREIGN KEY([IdDL])
REFERENCES [dbo].[Dailis] ([IdDL])
GO
ALTER TABLE [dbo].[Congnoes] CHECK CONSTRAINT [FK_DailiCongno]
GO
ALTER TABLE [dbo].[CTBCDLs]  WITH CHECK ADD  CONSTRAINT [FK_BaocaoDLCTBCDL] FOREIGN KEY([IdBC])
REFERENCES [dbo].[BaocaoDLs] ([IdBC])
GO
ALTER TABLE [dbo].[CTBCDLs] CHECK CONSTRAINT [FK_BaocaoDLCTBCDL]
GO
ALTER TABLE [dbo].[CTBCDLs]  WITH CHECK ADD  CONSTRAINT [FK_CTBCDLSach] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Saches] ([IdSach])
GO
ALTER TABLE [dbo].[CTBCDLs] CHECK CONSTRAINT [FK_CTBCDLSach]
GO
ALTER TABLE [dbo].[CTPNs]  WITH CHECK ADD  CONSTRAINT [FK_PhieunhapCTPN] FOREIGN KEY([IdPn])
REFERENCES [dbo].[Phieunhaps] ([IdPn])
GO
ALTER TABLE [dbo].[CTPNs] CHECK CONSTRAINT [FK_PhieunhapCTPN]
GO
ALTER TABLE [dbo].[CTPNs]  WITH CHECK ADD  CONSTRAINT [FK_SachCTPN] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Saches] ([IdSach])
GO
ALTER TABLE [dbo].[CTPNs] CHECK CONSTRAINT [FK_SachCTPN]
GO
ALTER TABLE [dbo].[CTPXes]  WITH CHECK ADD  CONSTRAINT [FK_PhieuxuatCTPX] FOREIGN KEY([IdPx])
REFERENCES [dbo].[Phieuxuats] ([IdPx])
GO
ALTER TABLE [dbo].[CTPXes] CHECK CONSTRAINT [FK_PhieuxuatCTPX]
GO
ALTER TABLE [dbo].[CTPXes]  WITH CHECK ADD  CONSTRAINT [FK_SachCTPX] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Saches] ([IdSach])
GO
ALTER TABLE [dbo].[CTPXes] CHECK CONSTRAINT [FK_SachCTPX]
GO
ALTER TABLE [dbo].[KhoDLs]  WITH CHECK ADD  CONSTRAINT [FK_DailiKhoDL] FOREIGN KEY([IdDL])
REFERENCES [dbo].[Dailis] ([IdDL])
GO
ALTER TABLE [dbo].[KhoDLs] CHECK CONSTRAINT [FK_DailiKhoDL]
GO
ALTER TABLE [dbo].[KhoDLs]  WITH CHECK ADD  CONSTRAINT [FK_SachKhoDL] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Saches] ([IdSach])
GO
ALTER TABLE [dbo].[KhoDLs] CHECK CONSTRAINT [FK_SachKhoDL]
GO
ALTER TABLE [dbo].[Khoes]  WITH CHECK ADD  CONSTRAINT [FK_SachKho] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Saches] ([IdSach])
GO
ALTER TABLE [dbo].[Khoes] CHECK CONSTRAINT [FK_SachKho]
GO
ALTER TABLE [dbo].[NoNXBs]  WITH CHECK ADD  CONSTRAINT [FK_NXBNoNXB] FOREIGN KEY([IdNXB])
REFERENCES [dbo].[NXBs] ([IdNXB])
GO
ALTER TABLE [dbo].[NoNXBs] CHECK CONSTRAINT [FK_NXBNoNXB]
GO
ALTER TABLE [dbo].[Phieunhaps]  WITH CHECK ADD  CONSTRAINT [FK_NXBPhieunhap] FOREIGN KEY([IdNXB])
REFERENCES [dbo].[NXBs] ([IdNXB])
GO
ALTER TABLE [dbo].[Phieunhaps] CHECK CONSTRAINT [FK_NXBPhieunhap]
GO
ALTER TABLE [dbo].[Phieuxuats]  WITH CHECK ADD  CONSTRAINT [FK_DailiPhieuxuat] FOREIGN KEY([IdDL])
REFERENCES [dbo].[Dailis] ([IdDL])
GO
ALTER TABLE [dbo].[Phieuxuats] CHECK CONSTRAINT [FK_DailiPhieuxuat]
GO
ALTER TABLE [dbo].[Saches]  WITH CHECK ADD  CONSTRAINT [FK_NXBSach] FOREIGN KEY([IdNXB])
REFERENCES [dbo].[NXBs] ([IdNXB])
GO
ALTER TABLE [dbo].[Saches] CHECK CONSTRAINT [FK_NXBSach]
GO
USE [master]
GO
ALTER DATABASE [QLsach] SET  READ_WRITE 
GO
