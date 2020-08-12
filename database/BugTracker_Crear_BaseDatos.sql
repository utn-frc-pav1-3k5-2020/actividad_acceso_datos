USE [master]

-------------------------------------------------------------------------------------------
/*-------------------------------------------------------------------------------------------
IMPORTANTE!!! REEMPLAZAR nombre de base de datos usando el legajo de cada uno: Ej. BugTracker12345 */
	
CREATE DATABASE [BugTracker12345]
GO

USE [BugTracker12345]
GO
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

/****** Object:  Table [dbo].[Bugs]    Script Date: 3/9/2019 20:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bugs](
	[id_bug] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[descripcion] [varchar](1000) NULL,
	[fecha_alta] [date] NOT NULL,
	[id_usuario_responsable] [int] NULL,
	[id_usuario_asignado] [int] NULL,
	[id_producto] [int] NULL,
	[id_prioridad] [int] NULL,
	[id_criticidad] [int] NULL,
	[id_estado] [int] NOT NULL,
 CONSTRAINT [PK_Bugs] PRIMARY KEY CLUSTERED 
(
	[id_bug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BugsHistorico]    Script Date: 3/9/2019 20:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BugsHistorico](
	[id_bug_historico] [int] IDENTITY(1,1) NOT NULL,
	[fecha_historico] [date] NULL,
	[titulo] [varchar](100) NOT NULL,
	[descripcion] [varchar](1000) NULL,
	[id_bug] [int] NOT NULL,
	[id_usuario_responsable] [int] NOT NULL,
	[id_usuario_asignado] [int] NULL,
	[id_producto] [int] NULL,
	[id_prioridad] [int] NULL,
	[id_criticidad] [int] NULL,
	[id_estado] [int] NOT NULL,
 CONSTRAINT [PK_BugsHistorico] PRIMARY KEY CLUSTERED 
(
	[id_bug_historico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criticidades]    Script Date: 3/9/2019 20:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criticidades](
	[id_criticidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Criticidades] PRIMARY KEY CLUSTERED 
(
	[id_criticidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 3/9/2019 20:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formularios]    Script Date: 3/9/2019 20:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formularios](
	[id_formulario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Formularios] PRIMARY KEY CLUSTERED 
(
	[id_formulario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 3/9/2019 20:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 3/9/2019 20:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[id_formulario] [int] NOT NULL,
	[id_perfil] [int] NOT NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[id_formulario] ASC,
	[id_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prioridades]    Script Date: 3/9/2019 20:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prioridades](
	[id_prioridad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prioridades] PRIMARY KEY CLUSTERED 
(
	[id_prioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 3/9/2019 20:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 3/9/2019 20:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_perfil] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bugs] ON 

INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (2, N'Test', N'First bug of test', CAST(N'2019-08-23' AS Date), 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (3, N'TEST FIRST BUG', N'hsfhkADSFHAKDS', CAST(N'2019-07-23' AS Date), 1, 2, 1, 1, 1, 2)
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [fecha_alta], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (5, N'Tercer bug test', N'Tercer bug test', CAST(N'2019-07-24' AS Date), NULL, NULL, 1, 2, 3, 3)
SET IDENTITY_INSERT [dbo].[Bugs] OFF
SET IDENTITY_INSERT [dbo].[BugsHistorico] ON 

INSERT [dbo].[BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (1, CAST(N'2019-08-24' AS Date), N'Test', N'First bug of test', 2, 1, NULL, 1, 4, 3, 1)
INSERT [dbo].[BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (2, CAST(N'2019-08-25' AS Date), N'Test', N'Test', 2, 1, NULL, 1, 3, 3, 1)
INSERT [dbo].[BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (3, CAST(N'2019-08-26' AS Date), N'Test', N'First bug of test', 2, 1, NULL, 1, 3, 3, 1)
INSERT [dbo].[BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (4, CAST(N'2019-07-24' AS Date), N'TEST FIRST BUG', N'TEST FIRST BUG', 3, 1, 4, 1, 4, 3, 2)
INSERT [dbo].[BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (5, CAST(N'2019-07-25' AS Date), N'TEST FIRST BUG', N'TEST FIRST BUG', 3, 1, 6, 1, 3, 3, 2)
INSERT [dbo].[BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (6, CAST(N'2019-07-26' AS Date), N'TEST FIRST BUG', N'TEST FIRST BUG', 3, 1, 7, 1, 3, 3, 2)
INSERT [dbo].[BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (7, CAST(N'2019-07-24' AS Date), N'Tercer bug test', N'Tercer bug test', 5, 1, 1, 1, 4, 3, 2)
INSERT [dbo].[BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (8, CAST(N'2019-07-25' AS Date), N'Tercer bug test', N'Tercer bug test', 5, 1, 5, 1, 2, 3, 2)
INSERT [dbo].[BugsHistorico] ([id_bug_historico], [fecha_historico], [titulo], [descripcion], [id_bug], [id_usuario_responsable], [id_usuario_asignado], [id_producto], [id_prioridad], [id_criticidad], [id_estado]) VALUES (9, CAST(N'2019-07-26' AS Date), N'Tercer bug test', N'Tercer bug test', 5, 1, 7, 1, 3, 3, 2)
SET IDENTITY_INSERT [dbo].[BugsHistorico] OFF
SET IDENTITY_INSERT [dbo].[Criticidades] ON 

INSERT [dbo].[Criticidades] ([id_criticidad], [nombre]) VALUES (1, N'LEVE')
INSERT [dbo].[Criticidades] ([id_criticidad], [nombre]) VALUES (2, N'GRAVE')
INSERT [dbo].[Criticidades] ([id_criticidad], [nombre]) VALUES (3, N'INVALIDANTE')
SET IDENTITY_INSERT [dbo].[Criticidades] OFF
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([id_estado], [nombre]) VALUES (1, N'Nuevo')
INSERT [dbo].[Estados] ([id_estado], [nombre]) VALUES (2, N'Asignado')
INSERT [dbo].[Estados] ([id_estado], [nombre]) VALUES (3, N'Cerrado')
INSERT [dbo].[Estados] ([id_estado], [nombre]) VALUES (4, N'En testing')
SET IDENTITY_INSERT [dbo].[Estados] OFF
SET IDENTITY_INSERT [dbo].[Perfiles] ON 

INSERT [dbo].[Perfiles] ([id_perfil], [nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Perfiles] ([id_perfil], [nombre]) VALUES (2, N'Tester')
INSERT [dbo].[Perfiles] ([id_perfil], [nombre]) VALUES (3, N'Desarrollador')
INSERT [dbo].[Perfiles] ([id_perfil], [nombre]) VALUES (4, N'Responsable de Reportes')
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
SET IDENTITY_INSERT [dbo].[Prioridades] ON 

INSERT [dbo].[Prioridades] ([id_prioridad], [nombre]) VALUES (1, N'BAJA')
INSERT [dbo].[Prioridades] ([id_prioridad], [nombre]) VALUES (2, N'MEDIA')
INSERT [dbo].[Prioridades] ([id_prioridad], [nombre]) VALUES (3, N'ALTA')
INSERT [dbo].[Prioridades] ([id_prioridad], [nombre]) VALUES (4, N'URGENTE')
SET IDENTITY_INSERT [dbo].[Prioridades] OFF
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([id_producto], [nombre]) VALUES (1, N'SOFTWARE GESTION II')
SET IDENTITY_INSERT [dbo].[Productos] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado]) VALUES (1, 1, N'ADMIN', N'123', N'admin@bt.com', N'S')
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado]) VALUES (2, 2, N'acme', N'test123', N'test123', N'N')
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado]) VALUES (4, 3, N'Test3', N'test', N'test2@bt.com', N'')
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado]) VALUES (5, 2, N'one21', N'fhkjasdhfa', N'fhkjasdhfa', N'N')
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado]) VALUES (6, 3, N'Test11-09', N'123', N'test1109@bugs.com.ar', N'N')
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado]) VALUES (7, 4, N'Melisa', N'123', N'meli@gmail.com', N'S')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Criticidades] FOREIGN KEY([id_criticidad])
REFERENCES [dbo].[Criticidades] ([id_criticidad])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Criticidades]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[Estados] ([id_estado])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Estados]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Prioridades] FOREIGN KEY([id_prioridad])
REFERENCES [dbo].[Prioridades] ([id_prioridad])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Prioridades]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Productos]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Usuarios] FOREIGN KEY([id_usuario_asignado])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Usuarios]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Usuarios1] FOREIGN KEY([id_usuario_responsable])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Usuarios1]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Bugs] FOREIGN KEY([id_bug])
REFERENCES [dbo].[Bugs] ([id_bug])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Bugs]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Criticidades] FOREIGN KEY([id_criticidad])
REFERENCES [dbo].[Criticidades] ([id_criticidad])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Criticidades]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[Estados] ([id_estado])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Estados]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Prioridades] FOREIGN KEY([id_prioridad])
REFERENCES [dbo].[Prioridades] ([id_prioridad])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Prioridades]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Productos]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Usuarios] FOREIGN KEY([id_usuario_responsable])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Usuarios]
GO
ALTER TABLE [dbo].[BugsHistorico]  WITH CHECK ADD  CONSTRAINT [FK_BugsHistorico_Usuarios1] FOREIGN KEY([id_usuario_asignado])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[BugsHistorico] CHECK CONSTRAINT [FK_BugsHistorico_Usuarios1]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Formularios] FOREIGN KEY([id_formulario])
REFERENCES [dbo].[Formularios] ([id_formulario])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Formularios]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[Perfiles] ([id_perfil])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Perfiles]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[Perfiles] ([id_perfil])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Perfiles]
GO
USE [master]
GO
ALTER DATABASE [BugTracker] SET  READ_WRITE 
GO
