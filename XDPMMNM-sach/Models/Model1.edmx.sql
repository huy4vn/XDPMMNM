
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/02/2017 10:32:36
-- Generated from EDMX file: C:\Users\PC\Documents\XDPMMNM\XDPMMNM-sach\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [QLsach];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_NXBSach]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Saches] DROP CONSTRAINT [FK_NXBSach];
GO
IF OBJECT_ID(N'[dbo].[FK_NXBPhieunhap]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Phieunhaps] DROP CONSTRAINT [FK_NXBPhieunhap];
GO
IF OBJECT_ID(N'[dbo].[FK_PhieunhapCTPN]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CTPNs] DROP CONSTRAINT [FK_PhieunhapCTPN];
GO
IF OBJECT_ID(N'[dbo].[FK_SachCTPN]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CTPNs] DROP CONSTRAINT [FK_SachCTPN];
GO
IF OBJECT_ID(N'[dbo].[FK_PhieuxuatCTPX]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CTPXes] DROP CONSTRAINT [FK_PhieuxuatCTPX];
GO
IF OBJECT_ID(N'[dbo].[FK_SachCTPX]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CTPXes] DROP CONSTRAINT [FK_SachCTPX];
GO
IF OBJECT_ID(N'[dbo].[FK_DailiPhieuxuat]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Phieuxuats] DROP CONSTRAINT [FK_DailiPhieuxuat];
GO
IF OBJECT_ID(N'[dbo].[FK_SachKho]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Khoes] DROP CONSTRAINT [FK_SachKho];
GO
IF OBJECT_ID(N'[dbo].[FK_DailiBaocaoDL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BaocaoDLs] DROP CONSTRAINT [FK_DailiBaocaoDL];
GO
IF OBJECT_ID(N'[dbo].[FK_BaocaoDLCTBCDL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CTBCDLs] DROP CONSTRAINT [FK_BaocaoDLCTBCDL];
GO
IF OBJECT_ID(N'[dbo].[FK_CTBCDLSach]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CTBCDLs] DROP CONSTRAINT [FK_CTBCDLSach];
GO
IF OBJECT_ID(N'[dbo].[FK_DailiCongno]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Congnoes] DROP CONSTRAINT [FK_DailiCongno];
GO
IF OBJECT_ID(N'[dbo].[FK_SachKhoDL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KhoDLs] DROP CONSTRAINT [FK_SachKhoDL];
GO
IF OBJECT_ID(N'[dbo].[FK_NXBNoNXB]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NoNXBs] DROP CONSTRAINT [FK_NXBNoNXB];
GO
IF OBJECT_ID(N'[dbo].[FK_DailiKhoDL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KhoDLs] DROP CONSTRAINT [FK_DailiKhoDL];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[NXBs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NXBs];
GO
IF OBJECT_ID(N'[dbo].[Dailis]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Dailis];
GO
IF OBJECT_ID(N'[dbo].[Saches]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Saches];
GO
IF OBJECT_ID(N'[dbo].[Phieunhaps]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Phieunhaps];
GO
IF OBJECT_ID(N'[dbo].[CTPNs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CTPNs];
GO
IF OBJECT_ID(N'[dbo].[Phieuxuats]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Phieuxuats];
GO
IF OBJECT_ID(N'[dbo].[CTPXes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CTPXes];
GO
IF OBJECT_ID(N'[dbo].[Khoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Khoes];
GO
IF OBJECT_ID(N'[dbo].[BaocaoDLs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BaocaoDLs];
GO
IF OBJECT_ID(N'[dbo].[CTBCDLs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CTBCDLs];
GO
IF OBJECT_ID(N'[dbo].[Congnoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Congnoes];
GO
IF OBJECT_ID(N'[dbo].[KhoDLs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KhoDLs];
GO
IF OBJECT_ID(N'[dbo].[NoNXBs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NoNXBs];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'NXBs'
CREATE TABLE [dbo].[NXBs] (
    [IdNXB] int IDENTITY(1,1) NOT NULL,
    [TenNXB] nvarchar(max)  NOT NULL,
    [DiaChi] nvarchar(max)  NOT NULL,
    [SDT] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Dailis'
CREATE TABLE [dbo].[Dailis] (
    [IdDL] int IDENTITY(1,1) NOT NULL,
    [TenDL] nvarchar(max)  NOT NULL,
    [DiaChi] nvarchar(max)  NOT NULL,
    [SDT] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Saches'
CREATE TABLE [dbo].[Saches] (
    [IdSach] int IDENTITY(1,1) NOT NULL,
    [TenSach] nvarchar(max)  NOT NULL,
    [TacGia] nvarchar(max)  NOT NULL,
    [GiaNhap] int  NOT NULL,
    [GiaXuat] int  NOT NULL,
    [IdNXB] int  NOT NULL
);
GO

-- Creating table 'Phieunhaps'
CREATE TABLE [dbo].[Phieunhaps] (
    [IdPn] int IDENTITY(1,1) NOT NULL,
    [NgayNhap] datetime  NOT NULL,
    [NguoiGiao] nvarchar(max)  NOT NULL,
    [IdNXB] int  NOT NULL,
    [NguoiNhan] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CTPNs'
CREATE TABLE [dbo].[CTPNs] (
    [IdPn] int  NOT NULL,
    [IdSach] int  NOT NULL,
    [SL] int  NOT NULL
);
GO

-- Creating table 'Phieuxuats'
CREATE TABLE [dbo].[Phieuxuats] (
    [IdPx] int IDENTITY(1,1) NOT NULL,
    [NgayXuat] nvarchar(max)  NOT NULL,
    [NguoiNhan] nvarchar(max)  NOT NULL,
    [IdDL] int  NOT NULL
);
GO

-- Creating table 'CTPXes'
CREATE TABLE [dbo].[CTPXes] (
    [IdPx] int  NOT NULL,
    [IdSach] int  NOT NULL,
    [SoLuong] int  NOT NULL
);
GO

-- Creating table 'Khoes'
CREATE TABLE [dbo].[Khoes] (
    [NgayGhi] datetime  NOT NULL,
    [IdSach] int  NOT NULL,
    [SL] int  NOT NULL
);
GO

-- Creating table 'BaocaoDLs'
CREATE TABLE [dbo].[BaocaoDLs] (
    [IdBC] int IDENTITY(1,1) NOT NULL,
    [Ngay] datetime  NOT NULL,
    [IdDL] int  NOT NULL
);
GO

-- Creating table 'CTBCDLs'
CREATE TABLE [dbo].[CTBCDLs] (
    [IdBC] int  NOT NULL,
    [IdSach] int  NOT NULL,
    [SLBanDc] int  NOT NULL
);
GO

-- Creating table 'Congnoes'
CREATE TABLE [dbo].[Congnoes] (
    [Ngay] int IDENTITY(1,1) NOT NULL,
    [IdDL] int  NOT NULL,
    [SLsachlay] int  NOT NULL,
    [Tongtienno] int  NOT NULL,
    [Tongtiendatra] int  NOT NULL
);
GO

-- Creating table 'KhoDLs'
CREATE TABLE [dbo].[KhoDLs] (
    [IdSach] int  NOT NULL,
    [SL] nvarchar(max)  NOT NULL,
    [IdDL] int  NOT NULL
);
GO

-- Creating table 'NoNXBs'
CREATE TABLE [dbo].[NoNXBs] (
    [NgayNhap] datetime  NOT NULL,
    [TienNo] nvarchar(max)  NOT NULL,
    [IdNXB] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdNXB] in table 'NXBs'
ALTER TABLE [dbo].[NXBs]
ADD CONSTRAINT [PK_NXBs]
    PRIMARY KEY CLUSTERED ([IdNXB] ASC);
GO

-- Creating primary key on [IdDL] in table 'Dailis'
ALTER TABLE [dbo].[Dailis]
ADD CONSTRAINT [PK_Dailis]
    PRIMARY KEY CLUSTERED ([IdDL] ASC);
GO

-- Creating primary key on [IdSach] in table 'Saches'
ALTER TABLE [dbo].[Saches]
ADD CONSTRAINT [PK_Saches]
    PRIMARY KEY CLUSTERED ([IdSach] ASC);
GO

-- Creating primary key on [IdPn] in table 'Phieunhaps'
ALTER TABLE [dbo].[Phieunhaps]
ADD CONSTRAINT [PK_Phieunhaps]
    PRIMARY KEY CLUSTERED ([IdPn] ASC);
GO

-- Creating primary key on [IdPn], [IdSach] in table 'CTPNs'
ALTER TABLE [dbo].[CTPNs]
ADD CONSTRAINT [PK_CTPNs]
    PRIMARY KEY CLUSTERED ([IdPn], [IdSach] ASC);
GO

-- Creating primary key on [IdPx] in table 'Phieuxuats'
ALTER TABLE [dbo].[Phieuxuats]
ADD CONSTRAINT [PK_Phieuxuats]
    PRIMARY KEY CLUSTERED ([IdPx] ASC);
GO

-- Creating primary key on [IdPx], [IdSach] in table 'CTPXes'
ALTER TABLE [dbo].[CTPXes]
ADD CONSTRAINT [PK_CTPXes]
    PRIMARY KEY CLUSTERED ([IdPx], [IdSach] ASC);
GO

-- Creating primary key on [NgayGhi], [IdSach] in table 'Khoes'
ALTER TABLE [dbo].[Khoes]
ADD CONSTRAINT [PK_Khoes]
    PRIMARY KEY CLUSTERED ([NgayGhi], [IdSach] ASC);
GO

-- Creating primary key on [IdBC] in table 'BaocaoDLs'
ALTER TABLE [dbo].[BaocaoDLs]
ADD CONSTRAINT [PK_BaocaoDLs]
    PRIMARY KEY CLUSTERED ([IdBC] ASC);
GO

-- Creating primary key on [IdBC], [IdSach] in table 'CTBCDLs'
ALTER TABLE [dbo].[CTBCDLs]
ADD CONSTRAINT [PK_CTBCDLs]
    PRIMARY KEY CLUSTERED ([IdBC], [IdSach] ASC);
GO

-- Creating primary key on [Ngay] in table 'Congnoes'
ALTER TABLE [dbo].[Congnoes]
ADD CONSTRAINT [PK_Congnoes]
    PRIMARY KEY CLUSTERED ([Ngay] ASC);
GO

-- Creating primary key on [IdSach], [IdDL] in table 'KhoDLs'
ALTER TABLE [dbo].[KhoDLs]
ADD CONSTRAINT [PK_KhoDLs]
    PRIMARY KEY CLUSTERED ([IdSach], [IdDL] ASC);
GO

-- Creating primary key on [IdNXB], [NgayNhap] in table 'NoNXBs'
ALTER TABLE [dbo].[NoNXBs]
ADD CONSTRAINT [PK_NoNXBs]
    PRIMARY KEY CLUSTERED ([IdNXB], [NgayNhap] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IdNXB] in table 'Saches'
ALTER TABLE [dbo].[Saches]
ADD CONSTRAINT [FK_NXBSach]
    FOREIGN KEY ([IdNXB])
    REFERENCES [dbo].[NXBs]
        ([IdNXB])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NXBSach'
CREATE INDEX [IX_FK_NXBSach]
ON [dbo].[Saches]
    ([IdNXB]);
GO

-- Creating foreign key on [IdNXB] in table 'Phieunhaps'
ALTER TABLE [dbo].[Phieunhaps]
ADD CONSTRAINT [FK_NXBPhieunhap]
    FOREIGN KEY ([IdNXB])
    REFERENCES [dbo].[NXBs]
        ([IdNXB])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NXBPhieunhap'
CREATE INDEX [IX_FK_NXBPhieunhap]
ON [dbo].[Phieunhaps]
    ([IdNXB]);
GO

-- Creating foreign key on [IdPn] in table 'CTPNs'
ALTER TABLE [dbo].[CTPNs]
ADD CONSTRAINT [FK_PhieunhapCTPN]
    FOREIGN KEY ([IdPn])
    REFERENCES [dbo].[Phieunhaps]
        ([IdPn])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdSach] in table 'CTPNs'
ALTER TABLE [dbo].[CTPNs]
ADD CONSTRAINT [FK_SachCTPN]
    FOREIGN KEY ([IdSach])
    REFERENCES [dbo].[Saches]
        ([IdSach])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SachCTPN'
CREATE INDEX [IX_FK_SachCTPN]
ON [dbo].[CTPNs]
    ([IdSach]);
GO

-- Creating foreign key on [IdPx] in table 'CTPXes'
ALTER TABLE [dbo].[CTPXes]
ADD CONSTRAINT [FK_PhieuxuatCTPX]
    FOREIGN KEY ([IdPx])
    REFERENCES [dbo].[Phieuxuats]
        ([IdPx])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdSach] in table 'CTPXes'
ALTER TABLE [dbo].[CTPXes]
ADD CONSTRAINT [FK_SachCTPX]
    FOREIGN KEY ([IdSach])
    REFERENCES [dbo].[Saches]
        ([IdSach])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SachCTPX'
CREATE INDEX [IX_FK_SachCTPX]
ON [dbo].[CTPXes]
    ([IdSach]);
GO

-- Creating foreign key on [IdDL] in table 'Phieuxuats'
ALTER TABLE [dbo].[Phieuxuats]
ADD CONSTRAINT [FK_DailiPhieuxuat]
    FOREIGN KEY ([IdDL])
    REFERENCES [dbo].[Dailis]
        ([IdDL])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DailiPhieuxuat'
CREATE INDEX [IX_FK_DailiPhieuxuat]
ON [dbo].[Phieuxuats]
    ([IdDL]);
GO

-- Creating foreign key on [IdSach] in table 'Khoes'
ALTER TABLE [dbo].[Khoes]
ADD CONSTRAINT [FK_SachKho]
    FOREIGN KEY ([IdSach])
    REFERENCES [dbo].[Saches]
        ([IdSach])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SachKho'
CREATE INDEX [IX_FK_SachKho]
ON [dbo].[Khoes]
    ([IdSach]);
GO

-- Creating foreign key on [IdDL] in table 'BaocaoDLs'
ALTER TABLE [dbo].[BaocaoDLs]
ADD CONSTRAINT [FK_DailiBaocaoDL]
    FOREIGN KEY ([IdDL])
    REFERENCES [dbo].[Dailis]
        ([IdDL])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DailiBaocaoDL'
CREATE INDEX [IX_FK_DailiBaocaoDL]
ON [dbo].[BaocaoDLs]
    ([IdDL]);
GO

-- Creating foreign key on [IdBC] in table 'CTBCDLs'
ALTER TABLE [dbo].[CTBCDLs]
ADD CONSTRAINT [FK_BaocaoDLCTBCDL]
    FOREIGN KEY ([IdBC])
    REFERENCES [dbo].[BaocaoDLs]
        ([IdBC])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdSach] in table 'CTBCDLs'
ALTER TABLE [dbo].[CTBCDLs]
ADD CONSTRAINT [FK_CTBCDLSach]
    FOREIGN KEY ([IdSach])
    REFERENCES [dbo].[Saches]
        ([IdSach])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CTBCDLSach'
CREATE INDEX [IX_FK_CTBCDLSach]
ON [dbo].[CTBCDLs]
    ([IdSach]);
GO

-- Creating foreign key on [IdDL] in table 'Congnoes'
ALTER TABLE [dbo].[Congnoes]
ADD CONSTRAINT [FK_DailiCongno]
    FOREIGN KEY ([IdDL])
    REFERENCES [dbo].[Dailis]
        ([IdDL])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DailiCongno'
CREATE INDEX [IX_FK_DailiCongno]
ON [dbo].[Congnoes]
    ([IdDL]);
GO

-- Creating foreign key on [IdSach] in table 'KhoDLs'
ALTER TABLE [dbo].[KhoDLs]
ADD CONSTRAINT [FK_SachKhoDL]
    FOREIGN KEY ([IdSach])
    REFERENCES [dbo].[Saches]
        ([IdSach])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdNXB] in table 'NoNXBs'
ALTER TABLE [dbo].[NoNXBs]
ADD CONSTRAINT [FK_NXBNoNXB]
    FOREIGN KEY ([IdNXB])
    REFERENCES [dbo].[NXBs]
        ([IdNXB])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdDL] in table 'KhoDLs'
ALTER TABLE [dbo].[KhoDLs]
ADD CONSTRAINT [FK_DailiKhoDL]
    FOREIGN KEY ([IdDL])
    REFERENCES [dbo].[Dailis]
        ([IdDL])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DailiKhoDL'
CREATE INDEX [IX_FK_DailiKhoDL]
ON [dbo].[KhoDLs]
    ([IdDL]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------