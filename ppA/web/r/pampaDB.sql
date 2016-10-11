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
CREATE TABLE [dbo].[clientes](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL DEFAULT (''),
	[apellido] [varchar](25) NOT NULL DEFAULT (''),
	[telefono] [varchar](15) NOT NULL DEFAULT (''),
        [correo] [varchar](25) NOT NULL DEFAULT (''),
	[DUI] [varchar](10) NOT NULL DEFAULT '',
	[NIT] [varchar](17) NOT NULL DEFAULT '',
	[comprobanteIva] [varchar](100) NOT NULL DEFAULT '',
        descripcion varchar(100) not null default ''
)
GO
create table categoriasMenus(
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
        categoriaMenu varchar(25) not null default '',
        descripcion varchar(100) not null default ''
)
GO
CREATE TABLE [dbo].[menus](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
        idCategoriaMenu int not null,
	[menu] [varchar](50) NOT NULL DEFAULT (''),
	[precio] [decimal](8,2) NULL DEFAULT ((0)),
	[descripcion] [varchar](100) NOT NULL DEFAULT ('')
)
GO
CREATE TABLE [dbo].[reservaciones](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[idSucursal] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
        idCliente int not null,
        idUsuario int not null,
	[fechaReservacion] [datetime] NOT NULL DEFAULT (CURRENT_TIMESTAMP),
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
	[descripcion] [varchar](50) NOT NULL DEFAULT (''),
	[color] [varchar](20) NOT NULL DEFAULT ('')
)
GO
CREATE TABLE [dbo].[abonos](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[idReservacion] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[abono] decimal(8,2) NOT NULL DEFAULT 0,
	[fechaAbono] [datetime] NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	[idUsuario] [int] NOT NULL
)
GO
CREATE TABLE [dbo].[detallesMenus](
	[id] [int] primary key IDENTITY(1,1) NOT NULL,
	[idReservacion] [int] NOT NULL,
	[idMenu] [int] NOT NULL,
        cantidad int NOT NULL DEFAULT 0,
	[comentarios] [varchar](200) NOT NULL DEFAULT '',
	[precio] [float] NOT NULL DEFAULT 0
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

INSERT [dbo].[categoriasMenus] ([categoriaMenu]) VALUES (N'Mariscos');
INSERT [dbo].[categoriasMenus] ([categoriaMenu]) VALUES (N'Carnes');

INSERT [dbo].[menus] (idCategoriaMenu, [menu]) VALUES (1, N'Camarones');
INSERT [dbo].[menus] (idCategoriaMenu, [menu]) VALUES (2, N'Res');

INSERT [dbo].[clientes] (nombre, apellido, telefono, correo, dui) VALUES (N'Cristobal', N'Colon', N'22589963', N'cPampa@pampa.com', N'04987456');

ALTER TABLE [dbo].[reservaciones] ADD FOREIGN KEY([idSucursal]) REFERENCES [dbo].[sucursales] ([id]);
ALTER TABLE [dbo].[reservaciones] ADD FOREIGN KEY([idEstado]) REFERENCES [dbo].[estados] ([id]);
ALTER TABLE [dbo].[reservaciones] ADD FOREIGN KEY([idUsuario]) REFERENCES [dbo].[usuarios] ([id]);
ALTER TABLE [dbo].[reservaciones] ADD FOREIGN KEY([idCliente]) REFERENCES [dbo].[clientes] ([id]);

ALTER TABLE [dbo].[usuarios] ADD FOREIGN KEY([idRol]) REFERENCES [dbo].[roles] ([id]);

ALTER TABLE [dbo].[menus] ADD FOREIGN KEY([idCategoriaMenu]) REFERENCES [dbo].[categoriasMenus] ([id]);

ALTER TABLE [dbo].[abonos] ADD FOREIGN KEY([idReservacion]) REFERENCES [dbo].[reservaciones] ([id]);
ALTER TABLE [dbo].[abonos] ADD FOREIGN KEY([idCliente]) REFERENCES [dbo].[clientes] ([id]);

ALTER TABLE [dbo].[detallesMenus] ADD FOREIGN KEY([idReservacion]) REFERENCES [dbo].[reservaciones] ([id]);
ALTER TABLE [dbo].[detallesMenus] ADD FOREIGN KEY([idMenu]) REFERENCES [dbo].[menus] ([id]);