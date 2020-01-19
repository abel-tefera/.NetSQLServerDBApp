USE [master]
GO
/****** Object:  Database [Musikas]    Script Date: 11/24/2017 9:59:36 AM ******/
CREATE DATABASE [Musikas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Musikas', FILENAME = N'C:\Users\murilo.rodrigues\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Musikas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Musikas_log', FILENAME = N'C:\Users\murilo.rodrigues\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Musikas_0.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Musikas] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Musikas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Musikas] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Musikas] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Musikas] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Musikas] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Musikas] SET ARITHABORT ON 
GO
ALTER DATABASE [Musikas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Musikas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Musikas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Musikas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Musikas] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Musikas] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Musikas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Musikas] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [Musikas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Musikas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Musikas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Musikas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Musikas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Musikas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Musikas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Musikas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Musikas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Musikas] SET RECOVERY FULL 
GO
ALTER DATABASE [Musikas] SET  MULTI_USER 
GO
ALTER DATABASE [Musikas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Musikas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Musikas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Musikas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Musikas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Musikas] SET QUERY_STORE = OFF
GO
USE [Musikas]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Musikas]
GO
/****** Object:  Table [dbo].[Musika]    Script Date: 11/24/2017 9:59:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musika](
	[Id] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[Director] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [Musikas] SET  READ_WRITE 
GO
INSERT [dbo].[Musika] ([Id], [Title], [ReleaseDate], [Director]) VALUES (1, N'Terminator', CAST(N'1985-03-25T00:00:00.000' AS DateTime), N'James Cameron')
GO

