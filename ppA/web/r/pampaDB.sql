use master
go
drop database pampaDB
go
create database pampaDB
go
USE pampaDB
GO
Set Language 'Español'
GO

CREATE TABLE [opciones](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[opcion] [varchar](20) NOT NULL DEFAULT (''),
	[orden] [decimal](5, 2) NULL DEFAULT ((0)),
	[padre] [int] NULL,
	[accion] [varchar](20) NOT NULL DEFAULT (''),
	[descripcion] [varchar](50) NOT NULL DEFAULT ('')
)
GO
CREATE TABLE [dbo].[reservaciones](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[idSucursal] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
	[nombre] [varchar](60) NOT NULL DEFAULT (''),
	[correo] [varchar](25) NOT NULL DEFAULT (''),
	[telefono] [varchar](15) NOT NULL DEFAULT (''),
	[fechaReservaciones] [datetime] NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	[numPersonas] [int] NOT NULL DEFAULT ((0)),
	[comentarios] [varchar](500) NOT NULL DEFAULT (''),
	[fechaCreacion] [datetime] NOT NULL DEFAULT (CURRENT_TIMESTAMP)
)
GO
CREATE TABLE [dbo].[roles](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[rol] [varchar](25) NOT NULL DEFAULT (''),
	[descripcion] [varchar](100) NOT NULL DEFAULT ('')
)
GO
CREATE TABLE [dbo].[sucursales](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[sucursal] [varchar](100) NOT NULL DEFAULT (''),
	[nacional] [int] NOT NULL DEFAULT ((1)),
	[direccion] [varchar](100) NOT NULL DEFAULT (''),
	[telefono] [varchar](15) NOT NULL DEFAULT ('')
)
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[idRol] [int] NOT NULL,
	[usuario] [varchar](25) NOT NULL DEFAULT (''),
	[clave] [varchar](25) NOT NULL DEFAULT ('')
)
GO
CREATE TABLE [dbo].[estados](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[estado] [varchar](20) NOT NULL DEFAULT (''),
	[descripcion] [varchar](50) NOT NULL DEFAULT ('')
)
GO

INSERT [opciones] ([opcion], [orden], [padre], [accion], [descripcion]) VALUES (N'Inicio', CAST(0.00 AS Decimal(5, 2)), NULL, N'./index', N'index de la aplicacion')
INSERT [dbo].[opciones] ([opcion], [orden], [padre], [accion], [descripcion]) VALUES (N'Cerrar<br />sesi�n', CAST(999.00 AS Decimal(5, 2)), NULL, N'./logOut', N'cerrar la sesion de la aplicacion');

INSERT [dbo].[estados] ([estado]) VALUES ('Registrado');

INSERT [dbo].[roles] ([rol], [descripcion]) VALUES (N'administrador', N'el que controla todo el sistema');
INSERT [dbo].[roles] ([rol], [descripcion]) VALUES (N'gerente', N'controla solo las reservas del sistema');

INSERT [dbo].[usuarios] ([usuario], [clave], [idRol]) VALUES (N'admin', N'admin', 1);
INSERT [dbo].[usuarios] ([usuario], [clave], [idRol]) VALUES (N'gerente', N'gerente', 2);

INSERT [dbo].[sucursales] ([sucursal], [nacional], [direccion], [telefono]) VALUES (N'SS', 1, N'', N'');
INSERT [dbo].[sucursales] ([sucursal], [nacional], [direccion], [telefono]) VALUES (N'constitucion', 2, N'cvfvf', N'2555454455');
INSERT [dbo].[sucursales] ([sucursal], [nacional], [direccion], [telefono]) VALUES (N'constitucion', 503, N'cvfvf', N'598595959');

ALTER TABLE [dbo].[reservaciones] ADD FOREIGN KEY([idSucursal]) REFERENCES [dbo].[sucursales] ([id]);
ALTER TABLE [dbo].[reservaciones] ADD FOREIGN KEY([idEstado]) REFERENCES [dbo].[estados] ([id]);
ALTER TABLE [dbo].[usuarios] ADD FOREIGN KEY([idRol]) REFERENCES [dbo].[roles] ([id]);
