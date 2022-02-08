
--camiones
--listar 
CREATE PROCEDURE Camiones_Listar
@Disponibilidad bit = null
AS
BEGIN
	SELECT * FROM Camiones
	WHERE Disponibilidad =
	ISNULL (@Disponibilidad, Disponibilidad)
END
GO
--insertar 
create  PROCEDURE Camiones_Insertar
@Matricula varchar(8),
@TipoCamion varchar(25),
@Modelo int,
@Marca varchar(25),
@Capacidad int,
@Kilometraje float,
@UrlFoto varchar(MAX)
as
begin
insert into Camiones
(Matricula, TipoCamion, Modelo, Marca, Capacidad, Kilometraje,
Disponibilidad, UrlFoto)

values
(@Matricula, @TipoCamion, @Modelo, @Marca, @Capacidad, @Kilometraje, 
1, @UrlFoto)
end
go
--actualizar 

CREATE PROCEDURE Camiones_Actualizar
@id int,
@Matricula varchar(8) = null,
@TipoCamion varchar(25) = null,
@Modelo int = null,
@Marca varchar(25) =null,
@Capacidad int = null,
@Kilometraje float = null,
@Disponibilidad bit = null,
@UrlFoto varchar(MAX) = null
as
BEGIN

UPDATE Camiones
SET Matricula = ISNULL(@Matricula, Matricula),
TipoCamion = ISNULL(@TipoCamion, TipoCamion),
Modelo = ISNULL(@Modelo, Modelo),
Marca = ISNULL (@Marca, Marca),
Capacidad = ISNULL(@Capacidad, Capacidad),
Kilometraje = ISNULL(@Kilometraje, Kilometraje),
Disponibilidad = ISNULL(@Disponibilidad, Disponibilidad),
UrlFoto = ISNULL (@UrlFoto, UrlFoto)
where id = @id
End
go
--eliminiar 

CREATE PROC Camiones_Eliminar
@id int
AS
BEGIN
	DELETE FROM Camiones
	WHERE id= @id
END
go
--getbyid

CREATE PROC Camiones_GetByID
@id int
as
begin
	select * from Camiones
	where id = @id
end
go
--------C H O F E R E S
--listar#

CREATE PROCEDURE Choferes_listar
@Disponibilidad BIT = null
AS
BEGIN
	SELECT * FROM Choferes
	WHERE Disponibilidad =
	ISNULL (@Disponibilidad, Disponibilidad)
END
GO
--Insertar
alter proc Choferes_Insertar
@Nombre varchar(50),
@ApPaterno varchar(50),
@Telefono varchar(50),
@FechaNacimiento smalldatetime,
--@Disponibilidad bit,
@Licencia varchar(50),
@UrlFoto varchar(MAX)
as 
begin
insert into Choferes
	(Nombre,
	ApPaterno,
	Telefono, 
	FechaNacimiento,
	Disponibilidad, 
	Licencia, 
	UrlFoto)
values
	(@Nombre,
	@ApPaterno, 
	@Telefono, 
	@FechaNacimiento,
	1,
	@Licencia, 
	@UrlFoto)
end
go

--actualizar 

CREATE PROCEDURE Choferes_Actualizar
@id int,
@Nombre varchar(8) = null, 
@ApPaterno varchar(8) = null, 
@Telefono varchar(8) = null, 
@FechaNacimiento smalldatetime = null,
@Disponibilidad bit = null,
@UrlFoto varchar(MAX)
as 
begin

update Choferes
set 
Nombre = ISNULL(@Nombre, Nombre),
ApPaterno = ISNULL(@ApPaterno, ApPaterno),
Telefono = ISNULL(@Telefono, Telefono),
FechaNacimiento = ISNULL(@FechaNacimiento, FechaNacimiento),
Disponibilidad = ISNULL(@Disponibilidad, Disponibilidad),
UrlFoto = ISNULL(@UrlFoto, UrlFoto)
where id = @id
end
go

--eliminiar 

CREATE PROC Choferes_Eliminar
@id int
AS
BEGIN
	DELETE FROM Choferes
	WHERE id= @id
END
go

--getbyid

CREATE PROC Choferes_GetByID
@id int
as
begin
	select * from Choferes
	where id = @id
end
go


-------DIRECCIONES
---listar
create proc Direcciones_listar
AS
BEGIN
	SELECT * FROM Direcciones
END
go
---insert
create proc Direcciones_Insertar
@Calle varchar(255),
@Numero varchar(250),
@Colonia varchar(250),
@Ciudad varchar(250),
@Estado varchar(250),
@CP varchar(50)
as
begin
insert into Direcciones
(calle, Numero, Colonia, Ciudad, Estado, CP)
values
(@Calle, @Numero, @Colonia, @Ciudad, @Estado, @CP)
select id = SCOPE_IDENTITY()
end
go

--actualizar
create proc Direcciones_Actualizar
@id int,
@Calle varchar(255) = null,
@Numero varchar(250) = null,
@Colonia varchar(250) = null,
@Ciudad varchar(250) = null,
@Estado varchar(250)= null ,
@CP varchar(50)= null
as
begin
update Direccion
set Calle = ISNULL (@Calle, calle),
Numero = ISNULL (@Numero, Numero),
Colonia = ISNULL (@Colonia, Colonia),
Ciudad = ISNULL (@Ciudad, Ciudad),
Estado = ISNULL (@Estado, Estado),
CP = ISNULL (@CP, CP)
where id = @id 
end
go

--eliminar
create proc Direcciones_Eliminar
@id int
as
begin
delete from Direcciones Where id = @id
end
go
--getByID
create proc Direcciones_getByID
@id int
as
begin
select * from Direcciones where id = @id
end
go


---RUTAS
--listar
create proc Rutas_listar

AS
BEGIN
	SELECT * FROM Rutas
END
go

--- insertar

create proc Rutas_insertar
@Camion_id int,
@Chofer_id int,
@DireccionDestino_id int,
@DireccionOrigen_id int,
@Distancia float,
@FHSalida datetime,
@FHLlegadaEstimada datetime,
@FHLlegadaReal datetime
as
begin
insert into Rutas
	(Camion_id, 
	Chofer_id, 
	DireccionDestino_id,
	DireccionOrigen_id,
	Distancia,
	FHSalida,
	FHLlegadaEstimada,
	FHLlegadaReal,
	Atiempo)
values
	(@Camion_id,
	@Chofer_id,
	@DireccionDestino_id,
	@DireccionOrigen_id,
	@Distancia, 
	@FHSalida,
	@FHLlegadaEstimada,
	@FHLlegadaReal,
	1)
select id = SCOPE_IDENTITY()
end
go

--actualizar
create proc Rutas_Actualizar
@id int,
@Camion_id int = null,
@Chofer_id int =null,
@DireccionOrigen_id int =null,
@DireccionDestino_id int =null,
@Distancia float =null,
@FHSalida datetime =null,
@FHLlegadaReal datetime =null,
@FHLlegadaEstimada datetime =null,
@Atiempo bit =null
as
begin
update Rutas set
Camion_id = isnull (@Camion_id, Camion_id),
Chofer_id = ISNULL (@Chofer_id, Chofer_id),
DireccionOrigen_id = isnull (@DireccionOrigen_id, DireccionOrigen_id),
DireccionDestino_id = isnull (@DireccionDestino_id, DireccionDestino_id),
Distancia = isnull (@Distancia, Distancia),
FHSalida = ISNULL (@FHSalida, FHSalida),
FHLlegadaEstimada = isnull (@FHLlegadaEstimada, FHLlegadaEstimada),
FHLlegadaReal = isnull (@FHLlegadaReal, FHLlegadaReal),
Atiempo = ISNULL (@Atiempo, Atiempo)
where id = @id
end
go
---Eliminar

Create proc Rutas_Eliminar
@id int
as
begin
Delete from Rutas where id = @id 
end
go
--getByID

create proc Rutas_GetByID
@id int 
As
begin
select * from Rutas where id = @id 
end
go
---Cargamento

--listar 
create proc Cargamento_Listar 
@Estatus int = null
as
begin	
	select * from Cargamento
	where Estatus = ISNULL (@Estatus, Estatus)
	order by Peso ASC
end
go
--insert
create  PROCEDURE Cargamento_Insertar
@Ruta_id int,
@Descripcion varchar(MAX),
@Peso float,
@Estatus int
as
begin
insert into Cargamento
(Ruta_id, Descripcion, Peso, Estatus)

values
(@Ruta_id, @Descripcion, @Peso, @Estatus)
end
go

--actualizar
create proc Cargamento_Actualizar
@id int,
@Ruta_id int,
@Descripcion varchar(MAX),
@Peso float,
@Estatus int
as
begin
update Cargamento set
Ruta_id = isnull (@Ruta_id, Ruta_id),
Descripcion = ISNULL (@Descripcion, Descripcion),
Peso = isnull (@Peso, Peso),
Estatus = isnull (@Estatus, Estatus)
where id = @id
end
go	

--eliminar
Create proc Cargamento_Eliminar
@id int
as
begin
Delete from Cargamento where id = @id 
end
go
--getBiID

--getByID
create proc Cargamento_getByID
@id int
as
begin
select * from Cargamento where id = @id
end
go
	----- concultas
select * from Camiones as caminones
select*from Choferes as choferes
select*from Direcciones as direcciones
select*from Rutas