USE [master]
GO
/****** Object:  Database [BD_Templates]    Script Date: 07/07/2024 23:35:08 ******/
CREATE DATABASE [BD_Templates]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_Templates', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BD_Templates.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_Templates_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BD_Templates_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BD_Templates] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_Templates].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_Templates] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_Templates] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_Templates] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_Templates] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_Templates] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_Templates] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_Templates] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_Templates] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_Templates] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_Templates] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_Templates] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_Templates] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_Templates] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_Templates] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_Templates] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_Templates] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_Templates] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_Templates] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_Templates] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_Templates] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_Templates] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_Templates] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_Templates] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_Templates] SET  MULTI_USER 
GO
ALTER DATABASE [BD_Templates] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_Templates] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_Templates] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_Templates] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_Templates] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_Templates] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BD_Templates] SET QUERY_STORE = ON
GO
ALTER DATABASE [BD_Templates] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BD_Templates]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 07/07/2024 23:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[ID_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Categoria] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especiales]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especiales](
	[ID_Especial] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[Imagen] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__Especial__95600965B7A8FB2F] PRIMARY KEY CLUSTERED 
(
	[ID_Especial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajes_Contacto]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensajes_Contacto](
	[ID_Contacto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Mensaje] [varchar](300) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ID_Producto] [int] IDENTITY(1,1) NOT NULL,
	[ID_Categoria] [int] NOT NULL,
	[Imagen] [varchar](100) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[Precio] [money] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__Producto__9B4120E2FD55AD7F] PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Rol] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([ID_Categoria], [Nombre_Categoria], [Estado]) VALUES (1, N'Frías', 1)
INSERT [dbo].[Categorias] ([ID_Categoria], [Nombre_Categoria], [Estado]) VALUES (2, N'Calientes', 1)
INSERT [dbo].[Categorias] ([ID_Categoria], [Nombre_Categoria], [Estado]) VALUES (3, N'Jugos', 1)
INSERT [dbo].[Categorias] ([ID_Categoria], [Nombre_Categoria], [Estado]) VALUES (4, N'Gaseosas', 0)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Especiales] ON 

INSERT [dbo].[Especiales] ([ID_Especial], [Nombre], [Descripcion], [Imagen], [Estado]) VALUES (1, N'Jugos Naturales', N'Jugos exprimidos de las más ricas frutas. Elaboración a la vista. Variedad de sabores.', N'img/special-01.jpg', 1)
INSERT [dbo].[Especiales] ([ID_Especial], [Nombre], [Descripcion], [Imagen], [Estado]) VALUES (2, N'Panadería', N'Los más ricos panificados, elaborados en el día y con las mejores recetas.', N'img/special-02.jpg', 1)
INSERT [dbo].[Especiales] ([ID_Especial], [Nombre], [Descripcion], [Imagen], [Estado]) VALUES (3, N'Comidas Rápidas', N'Ofrecemos deliciosas hamburguesas y sandwiches, preparados con ingredientes de primera calidad.', N'img/special-03.jpg', 1)
INSERT [dbo].[Especiales] ([ID_Especial], [Nombre], [Descripcion], [Imagen], [Estado]) VALUES (4, N'Postres', N'Para brindar una experiencia completa, también ofrecemos los más deliciosos postres. ¡No te los pierdas!.', N'img/special-04.jpg', 1)
INSERT [dbo].[Especiales] ([ID_Especial], [Nombre], [Descripcion], [Imagen], [Estado]) VALUES (5, N'Tragos Exclusivos', N'A la hora de brindar, también te brindamos una colección única de tragos para que disfrutes los mejores momentos.', N'img/special-05.jpg', 1)
INSERT [dbo].[Especiales] ([ID_Especial], [Nombre], [Descripcion], [Imagen], [Estado]) VALUES (6, N'Menú Especial', N'Ofrecemos también menú para vegetarianos, veganos y celíacos.', N'mg/special-06.jpg', 1)
SET IDENTITY_INSERT [dbo].[Especiales] OFF
GO
SET IDENTITY_INSERT [dbo].[Mensajes_Contacto] ON 

INSERT [dbo].[Mensajes_Contacto] ([ID_Contacto], [Nombre], [Email], [Mensaje]) VALUES (1, N'Ariel', N'azulian@hotmail.com', N'Quiero organizar un evento el viernes')
INSERT [dbo].[Mensajes_Contacto] ([ID_Contacto], [Nombre], [Email], [Mensaje]) VALUES (2, N'Ariel', N'azulian@hotmail.com', N'Quiero organizar un evento el viernes')
INSERT [dbo].[Mensajes_Contacto] ([ID_Contacto], [Nombre], [Email], [Mensaje]) VALUES (3, N'Ariel Zulian', N'azulian@hotmail.com', N'Quiero organizar un evento el viernes para llevar a mi esposa')
INSERT [dbo].[Mensajes_Contacto] ([ID_Contacto], [Nombre], [Email], [Mensaje]) VALUES (4, N'Ariel', N'azulian@hotmail.com', N'Quiero organizar un evento el viernes')
SET IDENTITY_INSERT [dbo].[Mensajes_Contacto] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (1, 1, N'img/iced-americano.png', N'Americano Frío', N'Café expreso con agua fría y hielo.', 1250.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (2, 1, N'img/iced-cappuccino.png', N'Cappuccino Frío', N'Expreso, leche fría espumada y hielo.', 1250.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (3, 1, N'img/iced-espresso.png', N'Espresso Frío', N'Expreso simple servido con hielo', 1425.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (4, 1, N'img/iced-latte.png', N'Latte Frío', N'Expreso con mucha leche fría y hielo.', 1150.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (5, 2, N'img/hot-americano.png', N'Americano', N'Café expreso con agua caliente.', 850.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (7, 2, N'img/hot-cappuccino.png', N'Cappuccino', N'Expreso, leche caliente y espuma.', 950.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (8, 2, N'img/hot-espresso.png', N'Espresso', N'Café concentrado en poca cantidad.', 750.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (9, 2, N'img/hot-latte.png', N'Latte', N'Expreso con mucha leche caliente.', 650.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (10, 3, N'img/smoothie-1.png', N'Smoothie de Frutillas', N'Licuado de frutillas, leche y hielo.', 1250.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (11, 3, N'img/smoothie-2.png', N'Smoothie de Frutos Rojos', N'Licuado de frutos rojos, leche y hielo.', 1450.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (12, 3, N'img/smoothie-3.png', N'Smoothie de Ananá', N'Licuado de ananá, leche y hielo.', 1650.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (13, 3, N'img/smoothie-4.png', N'Smoothie de Espinaca', N'Licuado de espinaca, leche y hielo.', 1850.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (14, 2, N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdH', N'Café con Leche', N'Delicioso café con leche en tamaño mediano', 1500.0000, 1)
INSERT [dbo].[Productos] ([ID_Producto], [ID_Categoria], [Imagen], [Nombre], [Descripcion], [Precio], [Estado]) VALUES (15, 3, N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhUSExMWFRUVFRcVGBUVFxcXFRcYFxUWFxUVG', N'Jugo de Manzana', N'Jugo de Manzanas Rojas de Rio Negro', 1600.0000, 1)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [Nombre_Usuario], [Contraseña], [Rol]) VALUES (1, N'admin', N'admin123', N'Admin')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Categorias] ADD  CONSTRAINT [DF_Categorias_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Especiales] ADD  CONSTRAINT [DF_Especiales_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [DF_Productos_Estado]  DEFAULT ((1)) FOR [Estado]
GO
/****** Object:  StoredProcedure [dbo].[Categorias_Agregar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Categorias_Agregar]

@Nombre_Categoria varchar(50),
@Estado bit
as
insert into Categorias
values(@Nombre_Categoria, @Estado)
GO
/****** Object:  StoredProcedure [dbo].[Categorias_ConsultarActivas]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Categorias_ConsultarActivas]	
as
select * from Categorias
where Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[Categorias_ConsultarID]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Categorias_ConsultarID]
@ID_Categoria int
as
select * from Categorias
where ID_Categoria = @ID_Categoria
GO
/****** Object:  StoredProcedure [dbo].[Categorias_ConsultarTodas]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Categorias_ConsultarTodas]
as
select * from Categorias
GO
/****** Object:  StoredProcedure [dbo].[Categorias_Eliminar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Categorias_Eliminar]
@ID_Categoria int
as
delete Categorias
where ID_Categoria = @ID_Categoria
GO
/****** Object:  StoredProcedure [dbo].[Categorias_Modificar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Categorias_Modificar]
@ID_Categoria int,
@Nombre_Categoria varchar(50),
@Estado bit
as
update Categorias
set Nombre_Categoria = @Nombre_Categoria, Estado = @Estado
where ID_Categoria = @ID_Categoria
GO
/****** Object:  StoredProcedure [dbo].[Especiales_Agregar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Especiales_Agregar]
@Nombre varchar(50),
@Descripcion varchar(150),
@Imagen varchar(100),
@Estado bit
as
insert into Especiales 
values (@Nombre, @Descripcion, @Imagen, @Estado)
GO
/****** Object:  StoredProcedure [dbo].[Especiales_ConsultarActivos]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Especiales_ConsultarActivos]
as
select * from Especiales
where Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[Especiales_ConsultarID]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Especiales_ConsultarID]
@ID_Especial int
as
select * from Especiales
where ID_Especial = @ID_Especial
GO
/****** Object:  StoredProcedure [dbo].[Especiales_ConsultarTodos]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Especiales_ConsultarTodos]
as
select * from Especiales
GO
/****** Object:  StoredProcedure [dbo].[Especiales_Eliminar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Especiales_Eliminar]
@ID_Especial int
as
delete Especiales
where ID_Especial = @ID_Especial
GO
/****** Object:  StoredProcedure [dbo].[Especiales_Modificar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Especiales_Modificar]
@ID_Especial int,
@Nombre varchar(50),
@Descripcion varchar(150),
@Imagen varchar(100),
@Estado bit
as
update Especiales 
set Nombre = @Nombre,Descripcion = @Descripcion,Imagen = @Imagen,Estado = @Estado
where ID_Especial = @ID_Especial
GO
/****** Object:  StoredProcedure [dbo].[Mensajes_Contacto_Agregar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Mensajes_Contacto_Agregar]

@Nombre varchar(50),
@Email varchar (100),
@Mensaje varchar(300)

as
insert into Mensajes_Contacto
values (@Nombre, @Email, @Mensaje)
GO
/****** Object:  StoredProcedure [dbo].[Mensajes_Contacto_ConsultarID]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Mensajes_Contacto_ConsultarID]
@ID_Contacto int
as
select * from Mensajes_Contacto 
where ID_Contacto = @ID_Contacto
GO
/****** Object:  StoredProcedure [dbo].[Mensajes_Contacto_ConsultarTodos]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Mensajes_Contacto_ConsultarTodos]
as
select * from Mensajes_Contacto
GO
/****** Object:  StoredProcedure [dbo].[Mensajes_Contacto_Eliminar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Mensajes_Contacto_Eliminar]
@ID_Contacto int
as
delete from Mensajes_Contacto 
where ID_Contacto = @ID_Contacto
GO
/****** Object:  StoredProcedure [dbo].[Mensajes_Contacto_Modificar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Mensajes_Contacto_Modificar]
@ID_Contacto int,
@Nombre varchar(50),
@Email varchar (100),
@Mensaje varchar(300)

as
update Mensajes_Contacto
set Nombre=@Nombre, Email=@Email, Mensaje=@Mensaje
where ID_Contacto=@ID_Contacto
GO
/****** Object:  StoredProcedure [dbo].[Productos_Agregar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Productos_Agregar]
@ID_Categoria int,
@Imagen varchar(100),
@Nombre varchar(50),
@Descripcion varchar(150),
@Precio money,
@Estado bit
as
insert into Productos	
values (@ID_Categoria, @Imagen, @Nombre, @Descripcion, @Precio, @Estado)
GO
/****** Object:  StoredProcedure [dbo].[Productos_ConsultarActivos]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Productos_ConsultarActivos]
as
select ID_Producto, Nombre_Categoria, Nombre, Descripcion, Precio from Productos	P
join Categorias C
on p.ID_Categoria = C.ID_Categoria

where p.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[Productos_ConsultarActivosPorCategoria]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Productos_ConsultarActivosPorCategoria]
@categoria varchar(50)
as
select ID_Producto, Nombre_Categoria, Imagen, Nombre, Descripcion, (SELECT CAST(Precio AS DECIMAL(18, 2))) AS Precio
from Productos	P
join Categorias C
on p.ID_Categoria = C.ID_Categoria

where p.Estado = 1 and c.Nombre_Categoria = @categoria
GO
/****** Object:  StoredProcedure [dbo].[Productos_ConsultarID]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Productos_ConsultarID]
@ID_Producto int
as
select * from Productos	

where ID_Producto = @ID_Producto
GO
/****** Object:  StoredProcedure [dbo].[Productos_ConsultarTodos]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Productos_ConsultarTodos]

as
select * from Productos	
GO
/****** Object:  StoredProcedure [dbo].[Productos_Eliminar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Productos_Eliminar]
@ID_Producto int
as
delete Productos	

where ID_Producto = @ID_Producto
GO
/****** Object:  StoredProcedure [dbo].[Productos_Modificar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Productos_Modificar]
@ID_Producto int,
@ID_Categoria int,
@Imagen varchar(100),
@Nombre varchar(50),
@Descripcion varchar(150),
@Precio money,
@Estado bit
as
update Productos	
set ID_Categoria=@ID_Categoria, Imagen = @Imagen, Nombre = @Nombre, Descripcion = @Descripcion, Precio = @Precio,Estado = @Estado
where ID_Producto = @ID_Producto
GO
/****** Object:  StoredProcedure [dbo].[Usuario_contar]    Script Date: 07/07/2024 23:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Usuario_contar]
(
@usuario varchar(50),
@contra varchar(50)
)
as
SELECT COUNT(*) FROM Usuarios WHERE Nombre_Usuario = @usuario AND Contraseña = @contra
GO
USE [master]
GO
ALTER DATABASE [BD_Templates] SET  READ_WRITE 
GO
