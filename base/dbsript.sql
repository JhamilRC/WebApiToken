USE [master]
GO
/****** Object:  Database [PracticoSI1]    Script Date: 25/01/2024 10:32:08 ******/
CREATE DATABASE [PracticoSI1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PracticoSI1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PracticoSI1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PracticoSI1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PracticoSI1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PracticoSI1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PracticoSI1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PracticoSI1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PracticoSI1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PracticoSI1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PracticoSI1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PracticoSI1] SET ARITHABORT OFF 
GO
ALTER DATABASE [PracticoSI1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PracticoSI1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PracticoSI1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PracticoSI1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PracticoSI1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PracticoSI1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PracticoSI1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PracticoSI1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PracticoSI1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PracticoSI1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PracticoSI1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PracticoSI1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PracticoSI1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PracticoSI1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PracticoSI1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PracticoSI1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PracticoSI1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PracticoSI1] SET RECOVERY FULL 
GO
ALTER DATABASE [PracticoSI1] SET  MULTI_USER 
GO
ALTER DATABASE [PracticoSI1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PracticoSI1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PracticoSI1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PracticoSI1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PracticoSI1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PracticoSI1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PracticoSI1', N'ON'
GO
ALTER DATABASE [PracticoSI1] SET QUERY_STORE = OFF
GO
USE [PracticoSI1]
GO
/****** Object:  User [IIS APPPOOL\webapiServicio]    Script Date: 25/01/2024 10:32:08 ******/
CREATE USER [IIS APPPOOL\webapiServicio] FOR LOGIN [IIS APPPOOL\webapiServicio] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IIS APPPOOL\core]    Script Date: 25/01/2024 10:32:08 ******/
CREATE USER [IIS APPPOOL\core] FOR LOGIN [IIS APPPOOL\core] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\core]
GO
/****** Object:  Table [dbo].[cIGrupoArticulo]    Script Date: 25/01/2024 10:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cIGrupoArticulo](
	[IdGrupoArticulo] [int] IDENTITY(1,1) NOT NULL,
	[NombreGrupoArticulo] [nvarchar](max) NULL,
	[Abreviatura] [nvarchar](max) NULL,
	[IdPadre] [int] NULL,
	[IdPartida] [int] NULL,
	[Nivel] [int] NULL,
	[Sector] [nvarchar](max) NULL,
	[FechaRegistro] [datetime] NULL,
	[EstadoRegistro] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGrupoArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clInsumo]    Script Date: 25/01/2024 10:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clInsumo](
	[IdInsumo] [int] IDENTITY(1,1) NOT NULL,
	[Codigo1] [int] NULL,
	[Codigo2] [int] NULL,
	[NombreInsumo] [nvarchar](max) NULL,
	[Imagen] [nvarchar](max) NULL,
	[CantidadMaxima] [int] NULL,
	[CantidadMinima] [int] NULL,
	[PrecioCompra] [decimal](10, 2) NULL,
	[ConFechaVencimiento] [date] NULL,
	[IdMoneda] [int] NULL,
	[IdLineaArticulo] [int] NULL,
	[IdGrupoArticulo] [int] NULL,
	[IdUnidadMedida] [int] NULL,
	[IdSerialización] [int] NULL,
	[IdMarca] [int] NULL,
	[IdColor] [int] NULL,
	[Estante] [nvarchar](max) NULL,
	[Nivel] [nvarchar](max) NULL,
	[FechaRegistro] [datetime] NULL,
	[EstadoRegistro] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdInsumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clStock]    Script Date: 25/01/2024 10:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clStock](
	[IdStock] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[IdInsumo] [int] NOT NULL,
	[IdAlmacen] [int] NOT NULL,
	[IdIngreso] [int] NOT NULL,
	[FechaIngreso] [datetime] NULL,
	[EstadoRegistra] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clUnidadDeMedida]    Script Date: 25/01/2024 10:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clUnidadDeMedida](
	[IdUnidadDeMedida] [int] IDENTITY(1,1) NOT NULL,
	[NombreUnidadDeMedida] [nvarchar](max) NULL,
	[Abreviacion] [nvarchar](max) NULL,
	[FechaRegistro] [datetime] NULL,
	[EstadoRegistro] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUnidadDeMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnUsuario]    Script Date: 25/01/2024 10:32:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trnUsuario](
	[IdUsuario] [int] NULL,
	[NombreUsuario] [nvarchar](50) NULL,
	[Clave] [nvarchar](100) NULL,
	[Salt] [varchar](10) NULL,
	[FechaRegistro] [datetime] NULL,
	[EstadoRegistro] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clInsumo]  WITH CHECK ADD FOREIGN KEY([IdGrupoArticulo])
REFERENCES [dbo].[cIGrupoArticulo] ([IdGrupoArticulo])
GO
ALTER TABLE [dbo].[clInsumo]  WITH CHECK ADD FOREIGN KEY([IdUnidadMedida])
REFERENCES [dbo].[clUnidadDeMedida] ([IdUnidadDeMedida])
GO
ALTER TABLE [dbo].[clStock]  WITH CHECK ADD FOREIGN KEY([IdInsumo])
REFERENCES [dbo].[clInsumo] ([IdInsumo])
GO
USE [master]
GO
ALTER DATABASE [PracticoSI1] SET  READ_WRITE 
GO
