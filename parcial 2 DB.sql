USE [master]
GO
/****** Object:  Database [Parcial_Ciclo2_BD_3]    Script Date: 23/09/2022 10:15:26 ******/
CREATE DATABASE [Parcial_Ciclo2_BD_3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Parcial_Ciclo2_BD_3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Parcial_Ciclo2_BD_3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Parcial_Ciclo2_BD_3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Parcial_Ciclo2_BD_3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Parcial_Ciclo2_BD_3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET  MULTI_USER 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET QUERY_STORE = OFF
GO
USE [Parcial_Ciclo2_BD_3]
GO
/****** Object:  Table [dbo].[CARGO]    Script Date: 23/09/2022 10:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARGO](
	[id_CARGO] [float] NULL,
	[n_CARGO] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTRATACION]    Script Date: 23/09/2022 10:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRATACION](
	[fk_Cc_PERSONA] [float] NULL,
	[fk_FECHA_CONTRATACION] [float] NULL,
	[fk_ID_SEDE] [float] NULL,
	[fk_ID_CARGO] [float] NULL,
	[sueldo] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTRATO]    Script Date: 23/09/2022 10:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTRATO](
	[id_ESTRATO] [float] NULL,
	[n_ESTRATO] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FECHA_CONTRATACION]    Script Date: 23/09/2022 10:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FECHA_CONTRATACION](
	[id_fechadate_CONTRATACION] [float] NULL,
	[fechadate_CONTRATACION] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONA]    Script Date: 23/09/2022 10:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONA](
	[cc] [float] NULL,
	[nombres] [nvarchar](255) NULL,
	[primer_apellido] [nvarchar](255) NULL,
	[segundo_apellido] [nvarchar](255) NULL,
	[fk_ID_Estrato] [nvarchar](255) NULL,
	[edad ] [nvarchar](255) NULL,
	[F7] [nvarchar](255) NULL,
	[F8] [nvarchar](255) NULL,
	[F9] [nvarchar](255) NULL,
	[F10] [nvarchar](255) NULL,
	[F11] [nvarchar](255) NULL,
	[F12] [nvarchar](255) NULL,
	[F13] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEDE]    Script Date: 23/09/2022 10:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEDE](
	[id_SEDE] [float] NULL,
	[n_SEDE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Parcial_Ciclo2_BD_3] SET  READ_WRITE 
GO
