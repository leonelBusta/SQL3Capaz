USE [master]
GO
/****** Object:  Database [LavanderiaLeo]    Script Date: 12/02/2022 12:39:50 a. m. ******/
CREATE DATABASE [LavanderiaLeo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LavanderiaLeo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LavanderiaLeo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LavanderiaLeo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LavanderiaLeo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LavanderiaLeo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LavanderiaLeo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LavanderiaLeo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET ARITHABORT OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LavanderiaLeo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LavanderiaLeo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LavanderiaLeo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LavanderiaLeo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET RECOVERY FULL 
GO
ALTER DATABASE [LavanderiaLeo] SET  MULTI_USER 
GO
ALTER DATABASE [LavanderiaLeo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LavanderiaLeo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LavanderiaLeo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LavanderiaLeo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LavanderiaLeo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LavanderiaLeo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LavanderiaLeo', N'ON'
GO
ALTER DATABASE [LavanderiaLeo] SET QUERY_STORE = OFF
GO
USE [LavanderiaLeo]
GO
/****** Object:  Table [dbo].[ClientesLa]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientesLa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClientesLa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadosLa]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadosLa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Puesto] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[UrlFoto] [varchar](max) NULL,
 CONSTRAINT [PK_EmpleadosLa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrendaLa]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrendaLa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NoPrendas] [int] NOT NULL,
	[Peso] [int] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
 CONSTRAINT [PK_PrendaLa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiciosLa]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiciosLa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[idClientes] [int] NOT NULL,
 CONSTRAINT [PK_ServiciosLa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaLa]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaLa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPrenda] [int] NOT NULL,
	[idServicio] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[FechaEntrada] [datetime] NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[pagado] [bit] NOT NULL,
 CONSTRAINT [PK_VentaLa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServiciosLa]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosLa_ClientesLa] FOREIGN KEY([idClientes])
REFERENCES [dbo].[ClientesLa] ([id])
GO
ALTER TABLE [dbo].[ServiciosLa] CHECK CONSTRAINT [FK_ServiciosLa_ClientesLa]
GO
ALTER TABLE [dbo].[VentaLa]  WITH CHECK ADD  CONSTRAINT [FK_VentaLa_ClientesLa] FOREIGN KEY([idCliente])
REFERENCES [dbo].[ClientesLa] ([id])
GO
ALTER TABLE [dbo].[VentaLa] CHECK CONSTRAINT [FK_VentaLa_ClientesLa]
GO
ALTER TABLE [dbo].[VentaLa]  WITH CHECK ADD  CONSTRAINT [FK_VentaLa_EmpleadosLa] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[EmpleadosLa] ([id])
GO
ALTER TABLE [dbo].[VentaLa] CHECK CONSTRAINT [FK_VentaLa_EmpleadosLa]
GO
ALTER TABLE [dbo].[VentaLa]  WITH CHECK ADD  CONSTRAINT [FK_VentaLa_PrendaLa] FOREIGN KEY([idPrenda])
REFERENCES [dbo].[PrendaLa] ([id])
GO
ALTER TABLE [dbo].[VentaLa] CHECK CONSTRAINT [FK_VentaLa_PrendaLa]
GO
ALTER TABLE [dbo].[VentaLa]  WITH CHECK ADD  CONSTRAINT [FK_VentaLa_ServiciosLa] FOREIGN KEY([idServicio])
REFERENCES [dbo].[ServiciosLa] ([id])
GO
ALTER TABLE [dbo].[VentaLa] CHECK CONSTRAINT [FK_VentaLa_ServiciosLa]
GO
/****** Object:  StoredProcedure [dbo].[Clientes_Actualizar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Clientes_Actualizar]
@id int,
@Nombre varchar(25) = null,
@Apellido varchar(25) = null,
@Telefono int = null
as
BEGIN

UPDATE ClientesLa
SET Nombre = ISNULL(@Nombre, Nombre),
Apellido = ISNULL(@Apellido, Apellido),
Telefono = ISNULL(@Telefono, Telefono)
where id = @id
End
GO
/****** Object:  StoredProcedure [dbo].[Clientes_Eliminar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Clientes_Eliminar]
@id int
AS
BEGIN
	DELETE FROM ClientesLa
	WHERE id= @id
END
GO
/****** Object:  StoredProcedure [dbo].[Clientes_GetByID]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Clientes_GetByID]
@id int
as
begin
	select * from ClientesLa
	where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[Clientes_Insertar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[Clientes_Insertar]
@Nombre varchar(25),
@Apellido varchar(25),
@Telefono varchar(25)
as
begin
insert into ClientesLa
(Nombre,
Apellido, 
Telefono)

values
(@Nombre, @Apellido, @Telefono)
end
GO
/****** Object:  StoredProcedure [dbo].[Clientes_Listar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Clientes_Listar]

AS
BEGIN
	SELECT * FROM ClientesLa
END
GO
/****** Object:  StoredProcedure [dbo].[comprobanteCliente]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[comprobanteCliente]
as
begin
select 
VentaLa.id, VentaLa.FechaEntrada, VentaLa.FechaSalida,
EmpleadosLa.Nombre, EmpleadosLa.Telefono,
PrendaLa.PrecioUnitario, total = PrendaLa.PrecioUnitario * PrendaLa.NoPrendas

from VentaLa inner join EmpleadosLa 
on VentaLa.idEmpleado = EmpleadosLa.id inner join 
PrendaLa on PrendaLa.id = VentaLa.idPrenda
where EmpleadosLa.id != 0 and VentaLa.pagado = 1 
end
GO
/****** Object:  StoredProcedure [dbo].[ComprobanteEmpleado]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ComprobanteEmpleado]
as
begin
select
VentaLa.id, VentaLa.FechaEntrada, VentaLa.FechaSalida,
ClientesLa.Nombre, ClientesLa.Telefono,
PrendaLa.NoPrendas, PrendaLa.PrecioUnitario,
total = PrendaLa.PrecioUnitario *PrendaLa.NoPrendas
from VentaLa inner join ClientesLa
on VentaLa.idCliente = ClientesLa.id inner join
PrendaLa on PrendaLa.id = VentaLa.idPrenda
where ClientesLa.id != 0  and VentaLa.pagado = 1
end
GO
/****** Object:  StoredProcedure [dbo].[Empleados_Actualizar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Empleados_Actualizar]
@id int,
@Nombre varchar(25) = null,
@Apellido varchar(25) = null,
@Puesto varchar(25) = null,
@Telefono int = null,
@UrlFoto varchar(MAX)
as
BEGIN

UPDATE EmpleadosLa
SET Nombre = ISNULL(@Nombre, Nombre),
Apellido = ISNULL(@Apellido, Apellido),
Puesto = ISNULL(@Puesto, Puesto),
Telefono = ISNULL(@Telefono, Telefono),
UrlFoto = ISNULL(@UrlFoto, UrlFoto)
where id = @id
End
GO
/****** Object:  StoredProcedure [dbo].[Empleados_Eliminar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Empleados_Eliminar]
@id int
AS
BEGIN
	DELETE FROM EmpleadosLa
	WHERE id= @id
END
GO
/****** Object:  StoredProcedure [dbo].[Empleados_GetByID]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Empleados_GetByID]
@id int
as
begin
	select * from EmpleadosLa
	where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[Empleados_Insertar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[Empleados_Insertar]
@Nombre varchar(25),
@Apellido varchar(25),
@Puesto varchar(25),
@Telefono varchar(25),
@UrlFoto varchar(MAX)
as
begin
insert into EmpleadosLa
(Nombre,
Apellido, 
Puesto,
Telefono,
UrlFoto)

values
(@Nombre, @Apellido, @Puesto, @Telefono, @UrlFoto)
end
GO
/****** Object:  StoredProcedure [dbo].[Empleados_Listar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Empleados_Listar]

AS
BEGIN
	SELECT * FROM EmpleadosLa
END
GO
/****** Object:  StoredProcedure [dbo].[Prendas_Actualizar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[Prendas_Actualizar]
@id int,
@NoPrendas int = null,
@Peso int = null,
@Tipo varchar(25) = null,
@PrecioUnitario float = null
as
BEGIN

UPDATE PrendaLa
SET NoPrendas = ISNULL(@NoPrendas, NoPrendas),
Peso = ISNULL(@Peso, Peso),
Tipo = ISNULL(@Tipo, Tipo),
PrecioUnitario = ISNULL(@PrecioUnitario, PrecioUnitario)
where id = @id
End
GO
/****** Object:  StoredProcedure [dbo].[Prendas_Eliminar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Prendas_Eliminar]
@id int
AS
BEGIN
	DELETE FROM PrendaLa
	WHERE id= @id
END
GO
/****** Object:  StoredProcedure [dbo].[Prendas_GetByID]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Prendas_GetByID]
@id int
as
begin
	select * from PrendaLa
	where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[Prendas_Insertar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[Prendas_Insertar]
@NoPrendas int,
@Peso int,
@Tipo varchar(25),
@PrecioUnitario float
as
begin
insert into PrendaLa
(NoPrendas,
Peso, 
Tipo,
PrecioUnitario)
values
(@NoPrendas, @Peso, @Tipo, @PrecioUnitario)
end
GO
/****** Object:  StoredProcedure [dbo].[Prendas_Listar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Prendas_Listar]

AS
BEGIN
	SELECT * FROM PrendaLa
END
GO
/****** Object:  StoredProcedure [dbo].[Servicios_Actualizar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[Servicios_Actualizar]
@id int,
@Descripcion varchar = null,
@Tipo varchar(25) = null,
@idCliente int = null
as
BEGIN

UPDATE ServiciosLa
SET Descripcion = ISNULL(@Descripcion, Descripcion),
Tipo = ISNULL(@Tipo, Tipo),
idClientes = ISNULL(@idCliente, idClientes)
where id = @id
End
GO
/****** Object:  StoredProcedure [dbo].[Servicios_Eliminar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Servicios_Eliminar]
@id int
AS
BEGIN
	DELETE FROM ServiciosLa
	WHERE id= @id
END
GO
/****** Object:  StoredProcedure [dbo].[Servicios_GetByID]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Servicios_GetByID]
@id int
as
begin
	select * from ServiciosLa
	where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[Servicios_Insertar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[Servicios_Insertar]
@Descripcion varchar(25),
@Tipo varchar(25),
@idClientes int
as
begin
insert into ServiciosLa
(
Descripcion, 
Tipo,
idClientes)
values
(@Descripcion, @Tipo, @idClientes)
end
GO
/****** Object:  StoredProcedure [dbo].[Servicios_Listar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Servicios_Listar]

AS
BEGIN
	SELECT * FROM ServiciosLa
END
GO
/****** Object:  StoredProcedure [dbo].[Ventas_actualizar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Ventas_actualizar]
@id int,
@idPrenda int = null,
@idServicio int = null,
@idEmpleado int = null,
@idCliente int = null,
@FechaEntrada datetime = null,
@FechaSalida datetime = null,
@pagado bit = null
as
BEGIN

UPDATE VentaLa
SET idPrenda = ISNULL(@idPrenda, idPrenda),
idServicio = ISNULL(@idServicio, idServicio),
idEmpleado = ISNULL(@idEmpleado, idEmpleado),
idCliente = ISNULL(@idCliente, idCliente),
FechaEntrada = ISNULL(@FechaEntrada, FechaEntrada),
FechaSalida = ISNULL(@FechaSalida, FechaSalida),
pagado = ISNULL(@pagado, pagado)
where id = @id
End
GO
/****** Object:  StoredProcedure [dbo].[Ventas_Eliminar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Ventas_Eliminar]
@id int
AS
BEGIN
	DELETE FROM VentaLa
	WHERE id= @id
END
GO
/****** Object:  StoredProcedure [dbo].[Ventas_GetByID]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Ventas_GetByID]
@id int
as
begin
	select * from VentaLa
	where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[Ventas_Insertar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[Ventas_Insertar]
@idPrenda int,
@idServicio int,
@idEmpleado int,
@idCliente int,
@FechaEntrada datetime,
@FechaSalida datetime
as
begin
insert into VentaLa
(
idPrenda, 
idServicio,
idEmpleado,
idCliente,
FechaEntrada,
FechaSalida,
pagado)
values
(@idPrenda,
@idServicio,
@idEmpleado,
@idCliente,
@FechaEntrada,
@FechaSalida,
1)
end
GO
/****** Object:  StoredProcedure [dbo].[Ventas_Listar]    Script Date: 12/02/2022 12:39:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ventas_Listar]

AS
BEGIN
	SELECT * FROM VentaLa
END
GO
USE [master]
GO
ALTER DATABASE [LavanderiaLeo] SET  READ_WRITE 
GO
