USE [QLsach]
GO
/****** Object:  Table [dbo].[BaocaoDLs]    Script Date: 02/11/2017 10:25:23 CH ******/
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
/****** Object:  Table [dbo].[Congnoes]    Script Date: 02/11/2017 10:25:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Congnoes](
	[Ngay] [int] IDENTITY(1,1) NOT NULL,
	[IdDL] [int] NOT NULL,
	[SLsachlay] [int] NOT NULL,
	[Tongtienno] [int] NOT NULL,
	[Tongtiendatra] [int] NOT NULL,
 CONSTRAINT [PK_Congnoes] PRIMARY KEY CLUSTERED 
(
	[Ngay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTBCDLs]    Script Date: 02/11/2017 10:25:24 CH ******/
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
/****** Object:  Table [dbo].[CTPNs]    Script Date: 02/11/2017 10:25:24 CH ******/
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
/****** Object:  Table [dbo].[CTPXes]    Script Date: 02/11/2017 10:25:24 CH ******/
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
/****** Object:  Table [dbo].[Dailis]    Script Date: 02/11/2017 10:25:24 CH ******/
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
/****** Object:  Table [dbo].[KhoDLs]    Script Date: 02/11/2017 10:25:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoDLs](
	[IdSach] [int] NOT NULL,
	[SL] [nvarchar](max) NOT NULL,
	[IdDL] [int] NOT NULL,
 CONSTRAINT [PK_KhoDLs] PRIMARY KEY CLUSTERED 
(
	[IdSach] ASC,
	[IdDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoes]    Script Date: 02/11/2017 10:25:24 CH ******/
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
/****** Object:  Table [dbo].[NoNXBs]    Script Date: 02/11/2017 10:25:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoNXBs](
	[NgayNhap] [datetime] NOT NULL,
	[TienNo] [nvarchar](max) NOT NULL,
	[IdNXB] [int] NOT NULL,
 CONSTRAINT [PK_NoNXBs] PRIMARY KEY CLUSTERED 
(
	[IdNXB] ASC,
	[NgayNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NXBs]    Script Date: 02/11/2017 10:25:24 CH ******/
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
/****** Object:  Table [dbo].[Phieunhaps]    Script Date: 02/11/2017 10:25:24 CH ******/
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
/****** Object:  Table [dbo].[Phieuxuats]    Script Date: 02/11/2017 10:25:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phieuxuats](
	[IdPx] [int] IDENTITY(1,1) NOT NULL,
	[NgayXuat] [nvarchar](max) NOT NULL,
	[NguoiNhan] [nvarchar](max) NOT NULL,
	[IdDL] [int] NOT NULL,
 CONSTRAINT [PK_Phieuxuats] PRIMARY KEY CLUSTERED 
(
	[IdPx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saches]    Script Date: 02/11/2017 10:25:24 CH ******/
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
GO
INSERT [dbo].[Dailis] ([IdDL], [TenDL], [DiaChi], [SDT]) VALUES (1, N'Anh Tuấn', N'117/25 Trần Đình Xu, Q1, Tp.HCM', N'090807052')
GO
INSERT [dbo].[Dailis] ([IdDL], [TenDL], [DiaChi], [SDT]) VALUES (2, N'Chị Ngọc', N'69/96 An Dương Vương, Q5, Tp.HCM', N'090230579')
GO
SET IDENTITY_INSERT [dbo].[Dailis] OFF
GO
SET IDENTITY_INSERT [dbo].[NXBs] ON 
GO
INSERT [dbo].[NXBs] ([IdNXB], [TenNXB], [DiaChi], [SDT]) VALUES (1, N'Tuổi Trẻ', N'132 Nguyễn Thị Minh Khai, Q1 Tp.HCM', N'0123456789')
GO
INSERT [dbo].[NXBs] ([IdNXB], [TenNXB], [DiaChi], [SDT]) VALUES (2, N'Kim Đồng', N'1 Nguyễn Kiệm, Phú Nhuận', N'0987654321')
GO
SET IDENTITY_INSERT [dbo].[NXBs] OFF
GO
SET IDENTITY_INSERT [dbo].[Saches] ON 
GO
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (1, N'Tuổi Trẻ Đáng Giá Bao Nhiêu', N'Rosie Nguyễn', 50000, 60000, 1)
GO
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (2, N'Cho Tôi Xin Một Vé Đi Tuổi Thơ ', N'Nguyễn Nhật Ánh', 40000, 50000, 1)
GO
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (3, N'Lĩnh Nam Chích Quái', N'Nhiều Tác Giả', 250000, 280000, 2)
GO
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (4, N'Nhiều Tác Giả', N'Nguyễn Phương Mai', 50000, 60000, 2)
GO
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (5, N'Nếu Biết Trăm Năm Là Hữu Hạn', N'Phạm Lữ Ân', 60000, 75000, 1)
GO
INSERT [dbo].[Saches] ([IdSach], [TenSach], [TacGia], [GiaNhap], [GiaXuat], [IdNXB]) VALUES (6, N'Quá Trẻ Để Chết: Hành Trình Nước Mỹ', N'Đinh Hằng', 40000, 55000, 2)
GO
SET IDENTITY_INSERT [dbo].[Saches] OFF
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
