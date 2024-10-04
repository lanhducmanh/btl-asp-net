USE [Ql_phong_gim]
GO
/****** Object:  Table [dbo].[HuanLuyenVien]    Script Date: 03/10/2024 22:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HuanLuyenVien](
	[id_huan_luyen_vien] [varchar](20) NOT NULL,
	[ten_huan_luyen_vien] [nvarchar](255) NOT NULL,
	[ngay_sinh] [date] NULL,
	[gioi_tinh] [nvarchar](10) NULL,
	[so_dien_thoai] [varchar](15) NULL,
	[email] [varchar](255) NULL,
	[dia_chi] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_huan_luyen_vien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 03/10/2024 22:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[id_khach_hang] [varchar](20) NOT NULL,
	[ten_khach_hang] [nvarchar](255) NOT NULL,
	[ngay_sinh] [date] NULL,
	[gioi_tinh] [nvarchar](10) NULL,
	[so_dien_thoai] [varchar](15) NULL,
	[email] [varchar](255) NOT NULL,
	[dia_chi] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_khach_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichLamViec]    Script Date: 03/10/2024 22:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichLamViec](
	[id_lich_lam_viec] [varchar](20) NOT NULL,
	[id_huan_luyen_vien] [varchar](20) NULL,
	[id_phong_tap] [varchar](20) NULL,
	[ngay_lam_viec] [date] NOT NULL,
	[thoi_gian_bat_dau] [time](7) NOT NULL,
	[thoi_gian_ket_thuc] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lich_lam_viec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuTapLuyen]    Script Date: 03/10/2024 22:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuTapLuyen](
	[id_lich_su] [varchar](20) NOT NULL,
	[id_khach_hang] [varchar](20) NULL,
	[id_phong_tap] [varchar](20) NULL,
	[ngay_tap] [date] NOT NULL,
	[thoi_gian_tap] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lich_su] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongTap]    Script Date: 03/10/2024 22:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongTap](
	[id_phong_tap] [varchar](20) NOT NULL,
	[ten_phong_tap] [nvarchar](255) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[suc_chua] [int] NULL,
 CONSTRAINT [PK__PhongTap__F3E036C60CC39755] PRIMARY KEY CLUSTERED 
(
	[id_phong_tap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__HuanLuye__AB6E6164D62DAE1D]    Script Date: 03/10/2024 22:12:28 ******/
ALTER TABLE [dbo].[HuanLuyenVien] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__AB6E6164D756F101]    Script Date: 03/10/2024 22:12:28 ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LichLamViec]  WITH CHECK ADD  CONSTRAINT [fk_huan_luyen_vien] FOREIGN KEY([id_huan_luyen_vien])
REFERENCES [dbo].[HuanLuyenVien] ([id_huan_luyen_vien])
GO
ALTER TABLE [dbo].[LichLamViec] CHECK CONSTRAINT [fk_huan_luyen_vien]
GO
ALTER TABLE [dbo].[LichLamViec]  WITH CHECK ADD  CONSTRAINT [FK_LichLamViec_PhongTap] FOREIGN KEY([id_phong_tap])
REFERENCES [dbo].[PhongTap] ([id_phong_tap])
GO
ALTER TABLE [dbo].[LichLamViec] CHECK CONSTRAINT [FK_LichLamViec_PhongTap]
GO
ALTER TABLE [dbo].[LichSuTapLuyen]  WITH CHECK ADD  CONSTRAINT [fk_khach_hang_lichsu] FOREIGN KEY([id_khach_hang])
REFERENCES [dbo].[KhachHang] ([id_khach_hang])
GO
ALTER TABLE [dbo].[LichSuTapLuyen] CHECK CONSTRAINT [fk_khach_hang_lichsu]
GO
ALTER TABLE [dbo].[LichSuTapLuyen]  WITH CHECK ADD  CONSTRAINT [FK_LichSuTapLuyen_PhongTap] FOREIGN KEY([id_phong_tap])
REFERENCES [dbo].[PhongTap] ([id_phong_tap])
GO
ALTER TABLE [dbo].[LichSuTapLuyen] CHECK CONSTRAINT [FK_LichSuTapLuyen_PhongTap]
GO
