USE [master]
GO
/****** Object:  Database [PetStore]    Script Date: 22.12.2024 14:47:50 ******/
CREATE DATABASE [PetStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PetStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PetStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PetStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PetStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PetStore] SET  MULTI_USER 
GO
ALTER DATABASE [PetStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PetStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [PetStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PetStore]
GO
/****** Object:  Table [dbo].[EmployeerRole]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeerRole](
	[IDRoleEmployeer] [int] IDENTITY(1,1) NOT NULL,
	[RoleEmployeer] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_EmployeerRole] PRIMARY KEY CLUSTERED 
(
	[IDRoleEmployeer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[IdManufacturer] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[IdManufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[OrderCompleteID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DeliveryDate] [date] NOT NULL,
	[PickupPointID] [int] NOT NULL,
	[FIOClientID] [int] NULL,
	[CodeReceive] [int] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderComplete]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderComplete](
	[IDCompleteOrder] [int] IDENTITY(1,1) NOT NULL,
	[FirstPart] [varchar](350) NOT NULL,
	[SecondPart] [int] NOT NULL,
	[ThirdPart] [varchar](350) NOT NULL,
	[FourthPart] [int] NOT NULL,
 CONSTRAINT [PK_OrderComplete] PRIMARY KEY CLUSTERED 
(
	[IDCompleteOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[IdOrderStatus] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[IdOrderStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpPoint]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoint](
	[IdPickupPoint] [int] IDENTITY(1,1) NOT NULL,
	[PostIndex] [bigint] NOT NULL,
	[City] [nvarchar](350) NOT NULL,
	[Street] [nvarchar](350) NOT NULL,
	[House] [int] NULL,
 CONSTRAINT [PK_PickUpPoint] PRIMARY KEY CLUSTERED 
(
	[IdPickupPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[IdSupplier] [int] IDENTITY(1,1) NOT NULL,
	[Supplier] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[IdSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TovarCategory]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TovarCategory](
	[IdTovarCategory] [int] IDENTITY(1,1) NOT NULL,
	[TovarCategory] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_TovarCategory] PRIMARY KEY CLUSTERED 
(
	[IdTovarCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tovars]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tovars](
	[IdTovar] [int] IDENTITY(1,1) NOT NULL,
	[Article] [varchar](350) NOT NULL,
	[TovarTitleID] [int] NOT NULL,
	[Measurement] [nvarchar](350) NOT NULL,
	[Price] [int] NOT NULL,
	[SizeMaxDiscount] [int] NOT NULL,
	[ManufacturerID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[TovarCategoryID] [int] NOT NULL,
	[ActualDiscount] [int] NOT NULL,
	[QuantityStock] [int] NOT NULL,
	[Description] [text] NOT NULL,
	[ImageName] [nvarchar](350) NULL,
	[ImagePhoto] [image] NULL,
 CONSTRAINT [PK_Tovars] PRIMARY KEY CLUSTERED 
(
	[IdTovar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TovarTitle]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TovarTitle](
	[IdTovarTitle] [int] IDENTITY(1,1) NOT NULL,
	[TovarTitle] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_TovarTitle] PRIMARY KEY CLUSTERED 
(
	[IdTovarTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22.12.2024 14:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDEmployeer] [int] IDENTITY(1,1) NOT NULL,
	[RoleEmployeer] [int] NOT NULL,
	[Female] [nvarchar](350) NOT NULL,
	[Name] [nvarchar](350) NOT NULL,
	[Patronymic] [nvarchar](350) NOT NULL,
	[Login] [varchar](350) NOT NULL,
	[Password] [varchar](350) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IDEmployeer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EmployeerRole] ON 

INSERT [dbo].[EmployeerRole] ([IDRoleEmployeer], [RoleEmployeer]) VALUES (1, N'Администратор')
INSERT [dbo].[EmployeerRole] ([IDRoleEmployeer], [RoleEmployeer]) VALUES (2, N'Клиент')
INSERT [dbo].[EmployeerRole] ([IDRoleEmployeer], [RoleEmployeer]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[EmployeerRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (1, N'Cat Chow')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (2, N'Chappy')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (3, N'Dog Chow')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (4, N'Dreames')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (6, N'LIKER')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (7, N'Nobby')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (8, N'Pro Plan')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (9, N'TitBit')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (10, N'Triol')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (11, N'trixie')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (12, N'True Touch')
INSERT [dbo].[Manufacturer] ([IdManufacturer], [Manufacturer]) VALUES (13, N'ZooM')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([IdOrder], [OrderCompleteID], [OrderDate], [DeliveryDate], [PickupPointID], [FIOClientID], [CodeReceive], [OrderStatusID]) VALUES (1, 1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 25, NULL, 601, 2)
INSERT [dbo].[Order] ([IdOrder], [OrderCompleteID], [OrderDate], [DeliveryDate], [PickupPointID], [FIOClientID], [CodeReceive], [OrderStatusID]) VALUES (2, 3, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 20, NULL, 602, 2)
INSERT [dbo].[Order] ([IdOrder], [OrderCompleteID], [OrderDate], [DeliveryDate], [PickupPointID], [FIOClientID], [CodeReceive], [OrderStatusID]) VALUES (3, 2, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 22, 5, 603, 1)
INSERT [dbo].[Order] ([IdOrder], [OrderCompleteID], [OrderDate], [DeliveryDate], [PickupPointID], [FIOClientID], [CodeReceive], [OrderStatusID]) VALUES (4, 4, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 24, NULL, 604, 1)
INSERT [dbo].[Order] ([IdOrder], [OrderCompleteID], [OrderDate], [DeliveryDate], [PickupPointID], [FIOClientID], [CodeReceive], [OrderStatusID]) VALUES (5, 9, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 25, NULL, 605, 1)
INSERT [dbo].[Order] ([IdOrder], [OrderCompleteID], [OrderDate], [DeliveryDate], [PickupPointID], [FIOClientID], [CodeReceive], [OrderStatusID]) VALUES (6, 6, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 28, 4, 606, 1)
INSERT [dbo].[Order] ([IdOrder], [OrderCompleteID], [OrderDate], [DeliveryDate], [PickupPointID], [FIOClientID], [CodeReceive], [OrderStatusID]) VALUES (7, 5, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 36, NULL, 607, 2)
INSERT [dbo].[Order] ([IdOrder], [OrderCompleteID], [OrderDate], [DeliveryDate], [PickupPointID], [FIOClientID], [CodeReceive], [OrderStatusID]) VALUES (8, 7, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 32, NULL, 608, 2)
INSERT [dbo].[Order] ([IdOrder], [OrderCompleteID], [OrderDate], [DeliveryDate], [PickupPointID], [FIOClientID], [CodeReceive], [OrderStatusID]) VALUES (9, 10, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 34, 7, 609, 2)
INSERT [dbo].[Order] ([IdOrder], [OrderCompleteID], [OrderDate], [DeliveryDate], [PickupPointID], [FIOClientID], [CodeReceive], [OrderStatusID]) VALUES (10, 8, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 36, 6, 610, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderComplete] ON 

INSERT [dbo].[OrderComplete] ([IDCompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (1, N'А112Т4', 15, N'G453T5', 1)
INSERT [dbo].[OrderComplete] ([IDCompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (2, N'E532Q5', 10, N'T432F4', 10)
INSERT [dbo].[OrderComplete] ([IDCompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (3, N'F432F4', 15, N'Y324F4', 15)
INSERT [dbo].[OrderComplete] ([IDCompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (4, N'G345E4', 1, N'E345R4', 2)
INSERT [dbo].[OrderComplete] ([IDCompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (5, N'H342F5', 2, N'Q245F5', 2)
INSERT [dbo].[OrderComplete] ([IDCompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (6, N'H436R4', 1, N'D643B5', 1)
INSERT [dbo].[OrderComplete] ([IDCompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (7, N'K436T5', 1, N'V527T5', 1)
INSERT [dbo].[OrderComplete] ([IDCompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (8, N'M356R4', 1, N'W548O7', 1)
INSERT [dbo].[OrderComplete] ([IDCompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (9, N'R356F4', 1, N'E431R5', 10)
INSERT [dbo].[OrderComplete] ([IDCompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (10, N'V527T5', 1, N'K452T5', 1)
SET IDENTITY_INSERT [dbo].[OrderComplete] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([IdOrderStatus], [OrderStatus]) VALUES (1, N'Завершен')
INSERT [dbo].[OrderStatus] ([IdOrderStatus], [OrderStatus]) VALUES (2, N'Новый ')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PickUpPoint] ON 

INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (1, 344288, N'г. Нефтеюганск', N'ул. Чехова', 1)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (2, 614164, N'г. Нефтеюганск', N'ул. Степная', 30)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (3, 394242, N'г. Нефтеюганск', N'ул. Коммунистическая', 43)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (4, 660540, N'г. Нефтеюганск', N'ул. Солнечная', 25)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (5, 125837, N'г. Нефтеюганск', N'ул. Шоссейная', 40)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (6, 125703, N'г. Нефтеюганск', N'ул. Партизанская', 49)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (7, 625283, N'г. Нефтеюганск', N'ул. Победы', 46)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (8, 614611, N'г. Нефтеюганск', N'ул. Молодежная', 50)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (9, 454311, N'г. Нефтеюганск', N'ул. Новая', 19)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (10, 660007, N'г. Нефтеюганск', N'ул. Октябрьская', 19)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (11, 603036, N'г. Нефтеюганск', N'ул. Садовая', 4)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (12, 450983, N'г. Нефтеюганск', N'ул. Комсомольская', 26)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (13, 394782, N'г. Нефтеюганск', N'ул. Чехова', 3)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (14, 603002, N'г. Нефтеюганск', N'ул. Дзержинского', 28)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (15, 450558, N'г. Нефтеюганск', N'ул. Набережная', 30)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (16, 394060, N'г. Нефтеюганск', N'ул. Фрунзе', 43)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (17, 410661, N'г. Нефтеюганск', N'ул. Школьная', 50)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (18, 625590, N'г. Нефтеюганск', N'ул. Коммунистическая', 20)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (19, 625683, N'г. Нефтеюганск', N'ул. 8 Марта', NULL)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (20, 400562, N'г. Нефтеюганск', N'ул. Зеленая', 32)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (21, 614510, N'г. Нефтеюганск', N'ул. Маяковского', 47)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (22, 410542, N'г. Нефтеюганск', N'ул. Светлая', 46)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (23, 620839, N'г. Нефтеюганск', N'ул. Цветочная', 8)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (24, 443890, N'г. Нефтеюганск', N'ул. Коммунистическая', 1)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (25, 603379, N'г. Нефтеюганск', N'ул. Спортивная', 46)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (26, 603721, N'г. Нефтеюганск', N'ул. Гоголя', 41)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (27, 410172, N'г. Нефтеюганск', N'ул. Северная', 13)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (28, 420151, N'г. Нефтеюганск', N'ул. Вишневая', 32)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (29, 125061, N'г. Нефтеюганск', N'ул. Подгорная', 8)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (30, 630370, N'г. Нефтеюганск', N'ул. Шоссейная', 24)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (31, 614753, N'г. Нефтеюганск', N'ул. Полевая', 35)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (32, 426030, N'г. Нефтеюганск', N'ул. Маяковского', 44)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (33, 450375, N'г. Нефтеюганск', N'ул. Клубная', 44)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (34, 625560, N'г. Нефтеюганск', N'ул. Некрасова', 12)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (35, 630201, N'г. Нефтеюганск', N'ул. Комсомольская', 17)
INSERT [dbo].[PickUpPoint] ([IdPickupPoint], [PostIndex], [City], [Street], [House]) VALUES (36, 190949, N'г. Нефтеюганск', N'ул. Мичурина', 26)
SET IDENTITY_INSERT [dbo].[PickUpPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([IdSupplier], [Supplier]) VALUES (1, N'PetShop')
INSERT [dbo].[Supplier] ([IdSupplier], [Supplier]) VALUES (2, N'ZooMir')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[TovarCategory] ON 

INSERT [dbo].[TovarCategory] ([IdTovarCategory], [TovarCategory]) VALUES (1, N'Для животных')
INSERT [dbo].[TovarCategory] ([IdTovarCategory], [TovarCategory]) VALUES (2, N'Товары для кошек')
INSERT [dbo].[TovarCategory] ([IdTovarCategory], [TovarCategory]) VALUES (3, N'Товары для собак')
SET IDENTITY_INSERT [dbo].[TovarCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Tovars] ON 

INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (1, N'А112Т4', 3, N'шт.', 123, 30, 4, 1, 2, 3, 6, N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', N'А112Т4.png', NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (2, N'G453T5', 8, N'шт.', 149, 15, 12, 2, 1, 2, 7, N'Щетка-варежка True Touch для вычесывания шерсти, синий', N'G453T5.jpg', NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (3, N'F432F4', 7, N'шт.', 1200, 10, 8, 2, 2, 3, 15, N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', N'F432F4.jpg', NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (4, N'Y324F4', 3, N'шт.', 86, 5, 9, 1, 3, 4, 17, N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', N'Y324F4.jpg', NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (5, N'E532Q5', 3, N'шт.', 166, 15, 9, 1, 3, 5, 18, N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', N'E532Q5.jpg', NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (6, N'T432F4', 7, N'шт.', 1700, 25, 2, 2, 3, 2, 5, N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', N'T432F4.jpg', NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (7, N'G345E4', 6, N'шт.', 300, 5, 6, 2, 3, 3, 19, N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', N'G345E4.jpg', NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (8, N'E345R4', 1, N'шт.', 199, 5, 5, 2, 2, 5, 7, N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', N'E345R4.jpg', NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (9, N'R356F4', 5, N'шт.', 234, 10, 7, 1, 3, 3, 17, N'Миска Nobby с рисунком Dog для собак 130 мл красный', N'R356F4.jpg', NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (10, N'E431R5', 3, N'шт.', 170, 5, 10, 2, 3, 5, 5, N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', N'E431R5.png', NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (11, N'D563F4', 1, N'шт.', 600, 10, 10, 1, 3, 5, 5, N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (12, N'H436R4', 1, N'шт.', 300, 15, 10, 1, 3, 2, 15, N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (13, N'D643B5', 7, N'шт.', 4100, 30, 1, 1, 2, 4, 9, N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (14, N'H432F4', 5, N'шт.', 385, 10, 10, 2, 1, 2, 17, N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (15, N'S245R4', 7, N'шт.', 280, 15, 1, 2, 2, 3, 8, N'Сухой корм для кошек CAT CHOW', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (16, N'V352R4', 7, N'шт.', 1700, 25, 2, 1, 3, 4, 9, N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (17, N'H342F5', 1, N'шт.', 510, 5, 10, 2, 3, 2, 17, N'Игрушка для собак Triol Енот 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (18, N'Q245F5', 1, N'шт.', 510, 5, 10, 2, 3, 2, 17, N'Игрушка для собак Triol Бобер 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (19, N'G542F5', 7, N'шт.', 2190, 30, 8, 1, 3, 4, 7, N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (20, N'H542R6', 3, N'шт.', 177, 15, 10, 2, 3, 3, 15, N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (21, N'K436T5', 6, N'шт.', 100, 5, 10, 2, 3, 4, 21, N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (22, N'V527T5', 1, N'шт.', 640, 5, 10, 1, 3, 5, 4, N'Игрушка для собак Triol Ящерица 39 см коричневый', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (23, N'K452T5', 4, N'шт.', 800, 25, 13, 2, 3, 2, 17, N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (24, N'E466T6', 2, N'шт.', 3500, 30, 10, 2, 3, 5, 3, N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (25, N'B427R5', 5, N'шт.', 400, 15, 10, 2, 1, 4, 5, N'Миска для животных Triol "Стрекоза", 450 мл', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (26, N'H643W2', 5, N'шт.', 292, 25, 10, 1, 1, 3, 13, N'Миска Triol CB02/30231002 100 мл бежевый/голубой', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (27, N'D356R4', 6, N'шт.', 600, 15, 11, 1, 3, 2, 16, N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (28, N'E434U6', 3, N'шт.', 140, 20, 9, 2, 3, 3, 19, N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (29, N'M356R4', 3, N'шт.', 50, 5, 9, 2, 3, 4, 6, N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', NULL, NULL)
INSERT [dbo].[Tovars] ([IdTovar], [Article], [TovarTitleID], [Measurement], [Price], [SizeMaxDiscount], [ManufacturerID], [SupplierID], [TovarCategoryID], [ActualDiscount], [QuantityStock], [Description], [ImageName], [ImagePhoto]) VALUES (30, N'W548O7', 7, N'шт.', 600, 15, 3, 1, 3, 5, 15, N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tovars] OFF
GO
SET IDENTITY_INSERT [dbo].[TovarTitle] ON 

INSERT [dbo].[TovarTitle] ([IdTovarTitle], [TovarTitle]) VALUES (1, N'Игрушка')
INSERT [dbo].[TovarTitle] ([IdTovarTitle], [TovarTitle]) VALUES (2, N'Клетка')
INSERT [dbo].[TovarTitle] ([IdTovarTitle], [TovarTitle]) VALUES (3, N'Лакомство')
INSERT [dbo].[TovarTitle] ([IdTovarTitle], [TovarTitle]) VALUES (4, N'Лежак')
INSERT [dbo].[TovarTitle] ([IdTovarTitle], [TovarTitle]) VALUES (5, N'Миска')
INSERT [dbo].[TovarTitle] ([IdTovarTitle], [TovarTitle]) VALUES (6, N'Мячик')
INSERT [dbo].[TovarTitle] ([IdTovarTitle], [TovarTitle]) VALUES (7, N'Сухой корм')
INSERT [dbo].[TovarTitle] ([IdTovarTitle], [TovarTitle]) VALUES (8, N'Щетка-варежка')
SET IDENTITY_INSERT [dbo].[TovarTitle] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IDEmployeer], [RoleEmployeer], [Female], [Name], [Patronymic], [Login], [Password]) VALUES (1, 1, N'Суслов', N'Илья', N'Арсентьевич', N'pixil59@gmail.com', N'2L6KZG')
INSERT [dbo].[Users] ([IDEmployeer], [RoleEmployeer], [Female], [Name], [Patronymic], [Login], [Password]) VALUES (2, 1, N'Ярослава', N'Яковлева', N'Даниэльевна', N'deummecillummu-4992@mail.ru', N'uzWC67')
INSERT [dbo].[Users] ([IDEmployeer], [RoleEmployeer], [Female], [Name], [Patronymic], [Login], [Password]) VALUES (3, 1, N'Игнатьева', N'Алина', N'Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp')
INSERT [dbo].[Users] ([IDEmployeer], [RoleEmployeer], [Female], [Name], [Patronymic], [Login], [Password]) VALUES (4, 2, N'Филимонов', N'Роберт', N'Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos')
INSERT [dbo].[Users] ([IDEmployeer], [RoleEmployeer], [Female], [Name], [Patronymic], [Login], [Password]) VALUES (5, 2, N'Шилова', N'Майя', N'Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT')
INSERT [dbo].[Users] ([IDEmployeer], [RoleEmployeer], [Female], [Name], [Patronymic], [Login], [Password]) VALUES (6, 2, N'Чистякова', N'Виктория', N'Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr')
INSERT [dbo].[Users] ([IDEmployeer], [RoleEmployeer], [Female], [Name], [Patronymic], [Login], [Password]) VALUES (7, 2, N'Волкова', N'Эмилия', N'Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ')
INSERT [dbo].[Users] ([IDEmployeer], [RoleEmployeer], [Female], [Name], [Patronymic], [Login], [Password]) VALUES (8, 3, N'Денисов', N'Михаил', N'Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR')
INSERT [dbo].[Users] ([IDEmployeer], [RoleEmployeer], [Female], [Name], [Patronymic], [Login], [Password]) VALUES (9, 3, N'Тимофеев', N'Михаил', N'Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv')
INSERT [dbo].[Users] ([IDEmployeer], [RoleEmployeer], [Female], [Name], [Patronymic], [Login], [Password]) VALUES (10, 3, N'Соловьев', N'Ярослав', N'Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderComplete] FOREIGN KEY([OrderCompleteID])
REFERENCES [dbo].[OrderComplete] ([IDCompleteOrder])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderComplete]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([IdOrderStatus])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickUpPoint] FOREIGN KEY([PickupPointID])
REFERENCES [dbo].[PickUpPoint] ([IdPickupPoint])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickUpPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([FIOClientID])
REFERENCES [dbo].[Users] ([IDEmployeer])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[Tovars]  WITH CHECK ADD  CONSTRAINT [FK_Tovars_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([IdManufacturer])
GO
ALTER TABLE [dbo].[Tovars] CHECK CONSTRAINT [FK_Tovars_Manufacturer]
GO
ALTER TABLE [dbo].[Tovars]  WITH CHECK ADD  CONSTRAINT [FK_Tovars_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([IdSupplier])
GO
ALTER TABLE [dbo].[Tovars] CHECK CONSTRAINT [FK_Tovars_Supplier]
GO
ALTER TABLE [dbo].[Tovars]  WITH CHECK ADD  CONSTRAINT [FK_Tovars_TovarCategory] FOREIGN KEY([TovarCategoryID])
REFERENCES [dbo].[TovarCategory] ([IdTovarCategory])
GO
ALTER TABLE [dbo].[Tovars] CHECK CONSTRAINT [FK_Tovars_TovarCategory]
GO
ALTER TABLE [dbo].[Tovars]  WITH CHECK ADD  CONSTRAINT [FK_Tovars_TovarTitle] FOREIGN KEY([TovarTitleID])
REFERENCES [dbo].[TovarTitle] ([IdTovarTitle])
GO
ALTER TABLE [dbo].[Tovars] CHECK CONSTRAINT [FK_Tovars_TovarTitle]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_EmployeerRole] FOREIGN KEY([RoleEmployeer])
REFERENCES [dbo].[EmployeerRole] ([IDRoleEmployeer])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_EmployeerRole]
GO
USE [master]
GO
ALTER DATABASE [PetStore] SET  READ_WRITE 
GO
