use master
go
drop database pampaDB
go
create database pampaDB
go
USE pampaDB
GO

CREATE TABLE [opciones](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[opcion] [varchar](20) NOT NULL DEFAULT (''),
	[orden] [decimal](5, 2) NULL DEFAULT ((0)),
	[padre] [int] NULL,
	[accion] [varchar](20) NOT NULL DEFAULT (''),
	[descripcion] [varchar](50) NOT NULL DEFAULT (''))

GO
CREATE TABLE [dbo].[reservaciones](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL DEFAULT (''),
	[correo] [varchar](25) NOT NULL DEFAULT (''),
	[telefono] [varchar](15) NOT NULL DEFAULT (''),
	[fechaReservaciones] [datetime] NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	[numPersonas] [int] NOT NULL DEFAULT ((0)),
	[idSucursal] [int] NOT NULL,
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
	[usuario] [varchar](25) NOT NULL DEFAULT (''),
	[clave] [varchar](25) NOT NULL DEFAULT (''),
	[idRol] [int] NOT NULL
)

GO
INSERT into [opciones] ([opcion], [orden], [padre], [accion], [descripcion]) VALUES (N'Inicio', CAST(0.00 AS Decimal(5, 2)), NULL, N'./index', N'index de la aplicacion')
GO
INSERT [dbo].[opciones] ([opcion], [orden], [padre], [accion], [descripcion]) VALUES (N'Cerrar<br />sesión', CAST(999.00 AS Decimal(5, 2)), NULL, N'./logOut', N'cerrar la sesion de la aplicacion')
GO
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'tefy', N'tefy@tefy.tefy', N'7555555555', CAST(N'2016-06-10 11:06:00.000' AS DateTime), 2, 1, N'sd', CAST(N'2016-09-24 22:15:09.890' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'isabella', N'tefy@tefy.tefy', N'7555555555', CAST(N'2016-10-02 12:00:00.000' AS DateTime), 2, 1, N'ww', CAST(N'2016-09-24 22:12:26.430' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:51:50.477' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:51:50.477' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-08-09 10:52:00.000' AS DateTime), 0, 1, N'jhjjjjj', CAST(N'2016-09-24 22:22:00.987' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'uno', N'', N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime), 0, 1, N'', CAST(N'2016-09-24 10:52:20.663' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'x', N'x', N'x', CAST(N'2016-10-01 17:00:00.000' AS DateTime), 2, 1, N'x', CAST(N'2016-09-24 17:00:33.167' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'dx', N'tefy@tefy.tefy', N'7555555555', CAST(N'2016-01-08 06:14:00.000' AS DateTime), 2, 1, N'xx', CAST(N'2016-09-25 13:00:35.650' AS DateTime))
GO                                                                                                                                                          
INSERT [dbo].[reservaciones] ([nombre], [correo], [telefono], [fechaReservaciones], [numPersonas], [idSucursal], [comentarios], [fechaCreacion]) VALUES (N'tefy', N'tefy@tefy.tefy', N'7555555555', CAST(N'2016-09-10 01:00:00.000' AS DateTime), 2, 1, N'dfd', CAST(N'2016-09-25 13:00:19.003' AS DateTime))
GO
INSERT [dbo].[roles] ([rol], [descripcion]) VALUES (N'administrador', N'el que controla todo el sistema')
GO
INSERT [dbo].[roles] ([rol], [descripcion]) VALUES (N'gerente', N'controla solo las reservas del sistema')
GO
INSERT [dbo].[sucursales] ([sucursal], [nacional], [direccion], [telefono]) VALUES (N'SS', 1, N'', N'')
GO
INSERT [dbo].[sucursales] ([sucursal], [nacional], [direccion], [telefono]) VALUES (N'constitucion', 2, N'cvfvf', N'2555454455')
GO
INSERT [dbo].[sucursales] ([sucursal], [nacional], [direccion], [telefono]) VALUES (N'constitucion', 503, N'cvfvf', N'598595959')
GO
ALTER TABLE [dbo].[reservaciones] ADD FOREIGN KEY([idSucursal])
REFERENCES [dbo].[sucursales] ([id])
GO
ALTER TABLE [dbo].[usuarios] ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[roles] ([id])
GO
