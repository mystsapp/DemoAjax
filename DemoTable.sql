USE [master]
GO
/****** Object:  Database [DemoTable]    Script Date: 26/04/2019 1:26:11 PM ******/
CREATE DATABASE [DemoTable]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoTable', FILENAME = N'D:\DB\DemoTable.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoTable_log', FILENAME = N'D:\DB\DemoTable_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DemoTable] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoTable].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoTable] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoTable] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoTable] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoTable] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoTable] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoTable] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoTable] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoTable] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoTable] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoTable] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoTable] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoTable] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoTable] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoTable] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoTable] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoTable] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoTable] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoTable] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoTable] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoTable] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoTable] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoTable] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoTable] SET RECOVERY FULL 
GO
ALTER DATABASE [DemoTable] SET  MULTI_USER 
GO
ALTER DATABASE [DemoTable] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoTable] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoTable] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoTable] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoTable] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DemoTable', N'ON'
GO
ALTER DATABASE [DemoTable] SET QUERY_STORE = OFF
GO
USE [DemoTable]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DemoTable]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 26/04/2019 1:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Salary] [float] NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (1, N'Nguyễn Văn A', 10000000, CAST(N'2019-04-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (2, N'Nguyễn Văn B', 11000000, CAST(N'2019-04-19T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (3, N'Nguyễn Văn C', 12000000, CAST(N'2019-04-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (4, N'Nguyễn Văn D', 13000000, CAST(N'2019-04-17T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (5, N'Nguyễn Văn E', 14000000, CAST(N'2019-04-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (6, N'Nguyễn Văn F', 15000000, CAST(N'2019-04-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (7, N'Nguyễn Văn G', 16000000, CAST(N'2019-04-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (8, N'Nguyễn Văn H', 17000000, CAST(N'2019-04-13T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (9, N'Nguyễn Văn I', 18000000, CAST(N'2019-04-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (10, N'Nguyễn Văn K', 19000000, CAST(N'2019-04-11T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (11, N'Nguyễn Văn M', 10000000, NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (13, N'hongvt', 123456, NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (16, N'Admin', 14789, CAST(N'2019-04-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (17, N'Teo banh xeo', 123456, CAST(N'2019-04-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (20, N'Cu Tin', 11000000, NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (21, N'A ly cu ty', 5000000, CAST(N'2019-04-24T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (23, N'Teo em', 5632147, CAST(N'2019-04-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [CreatedDate], [Status]) VALUES (25, N'hongvt', 123457689, CAST(N'2019-04-26T11:03:02.733' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
USE [master]
GO
ALTER DATABASE [DemoTable] SET  READ_WRITE 
GO
