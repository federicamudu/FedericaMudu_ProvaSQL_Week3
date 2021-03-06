USE [master]
GO
/****** Object:  Database [AgenziaDiscografica]    Script Date: 18/03/2022 14:14:09 ******/
CREATE DATABASE [AgenziaDiscografica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AgenziaDiscografica', FILENAME = N'C:\Users\Federica\AgenziaDiscografica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AgenziaDiscografica_log', FILENAME = N'C:\Users\Federica\AgenziaDiscografica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AgenziaDiscografica] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AgenziaDiscografica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AgenziaDiscografica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET ARITHABORT OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AgenziaDiscografica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AgenziaDiscografica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AgenziaDiscografica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AgenziaDiscografica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AgenziaDiscografica] SET  MULTI_USER 
GO
ALTER DATABASE [AgenziaDiscografica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AgenziaDiscografica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AgenziaDiscografica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AgenziaDiscografica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AgenziaDiscografica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AgenziaDiscografica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AgenziaDiscografica] SET QUERY_STORE = OFF
GO
USE [AgenziaDiscografica]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 18/03/2022 14:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[IdAlbum] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](40) NOT NULL,
	[AnnoUscita] [int] NOT NULL,
	[CasaDiscografica] [nvarchar](20) NULL,
	[Genere] [nvarchar](20) NOT NULL,
	[SupportoDistribuzione] [nvarchar](20) NOT NULL,
	[IdBand] [int] NOT NULL,
 CONSTRAINT [Pk_Album] PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 18/03/2022 14:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[IdBand] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[NumeroComponenti] [int] NOT NULL,
 CONSTRAINT [Pk_Band] PRIMARY KEY CLUSTERED 
(
	[IdBand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 18/03/2022 14:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[IdBrano] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](40) NULL,
	[Durata] [int] NOT NULL,
 CONSTRAINT [Pk_Brano] PRIMARY KEY CLUSTERED 
(
	[IdBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranoAlbum]    Script Date: 18/03/2022 14:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranoAlbum](
	[IdAlbum] [int] NOT NULL,
	[IdBrano] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (1, N'Nord Sud Ovest Est', 1993, N'Fri Records', N'Pop', N'CD', 1)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (2, N'Il ballo della vita', 2018, N'Sony Music', N'Rock', N'Streaming', 2)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (3, N'Completamente Sold Out', 2016, N'Carosello', N'Pop', N'CD', 3)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (4, N'Night Vision', 2012, N'Interscope Records', N'Rock', N'Vinile', 4)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (5, N'Imagine', 1971, N'Apple/Emi', N'Rock', N'Vinile', 5)
INSERT [dbo].[Album] ([IdAlbum], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione], [IdBand]) VALUES (6, N'Il ballo della vita', 2018, N'Sony Music', N'Rock', N'CD', 2)
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
SET IDENTITY_INSERT [dbo].[Band] ON 

INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (1, N'883', 2)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (2, N'Maneskin', 4)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (3, N'The Giornalisti', 3)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (4, N'Imagine Dragons', 5)
INSERT [dbo].[Band] ([IdBand], [Nome], [NumeroComponenti]) VALUES (5, N'John Lennon', 1)
SET IDENTITY_INSERT [dbo].[Band] OFF
GO
SET IDENTITY_INSERT [dbo].[Brano] ON 

INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (1, N'Il pappagallo', 202)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (2, N'Sei un mito', 304)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (3, N'Non ci Spezziamo', 184)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (4, N'Come mai', 250)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (5, N'New Song', 200)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (6, N'Torna a casa', 210)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (7, N'L''altra dimensione', 123)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (8, N'Sh*t Blvd', 193)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (9, N'Completamente', 201)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (10, N'Sold Out', 207)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (11, N'Tra la strada e le stelle', 240)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (12, N'L''ultimo grido della notte', 204)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (13, N'Radioactive', 184)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (14, N'Tiptoe', 188)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (15, N'It''s Time', 240)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (16, N'Demons', 153)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (17, N'Imagine', 180)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (18, N'Crippled Inside', 209)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (19, N'Jealous Guy', 249)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (20, N'It''s so hard', 136)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (21, N'Stan', 386)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (22, N'The Real Slim Shady', 266)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (23, N'Criminal', 310)
INSERT [dbo].[Brano] ([IdBrano], [Titolo], [Durata]) VALUES (24, N'Hailie''s Song', 312)
SET IDENTITY_INSERT [dbo].[Brano] OFF
GO
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (1, 1)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (1, 2)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (1, 3)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (1, 4)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (2, 5)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (2, 6)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (2, 7)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (2, 8)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (3, 9)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (3, 10)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (3, 11)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (3, 12)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (4, 13)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (4, 14)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (4, 15)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (4, 16)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (5, 17)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (5, 18)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (5, 19)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (5, 20)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AlbumUnico]    Script Date: 18/03/2022 14:14:10 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [AlbumUnico] UNIQUE NONCLUSTERED 
(
	[Titolo] ASC,
	[AnnoUscita] ASC,
	[CasaDiscografica] ASC,
	[Genere] ASC,
	[SupportoDistribuzione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_IdBand] FOREIGN KEY([IdBand])
REFERENCES [dbo].[Band] ([IdBand])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_IdBand]
GO
ALTER TABLE [dbo].[BranoAlbum]  WITH CHECK ADD  CONSTRAINT [FK_IdAlbum] FOREIGN KEY([IdAlbum])
REFERENCES [dbo].[Album] ([IdAlbum])
GO
ALTER TABLE [dbo].[BranoAlbum] CHECK CONSTRAINT [FK_IdAlbum]
GO
ALTER TABLE [dbo].[BranoAlbum]  WITH CHECK ADD  CONSTRAINT [FK_IdBrano] FOREIGN KEY([IdBrano])
REFERENCES [dbo].[Brano] ([IdBrano])
GO
ALTER TABLE [dbo].[BranoAlbum] CHECK CONSTRAINT [FK_IdBrano]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [chk_genere] CHECK  (([Genere]='Classico' OR [Genere]='Jazz' OR [Genere]='Pop' OR [Genere]='Rock' OR [Genere]='Metal'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [chk_genere]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [chk_supporto] CHECK  (([SupportoDistribuzione]='CD' OR [SupportoDistribuzione]='Vinile' OR [SupportoDistribuzione]='Streaming'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [chk_supporto]
GO
USE [master]
GO
ALTER DATABASE [AgenziaDiscografica] SET  READ_WRITE 
GO
