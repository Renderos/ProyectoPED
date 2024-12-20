USE [master]
GO
/****** Object:  Database [ProgramaMedico]    Script Date: 01/11/2024 11:37:57 ******/
CREATE DATABASE [ProgramaMedico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProgramaMedico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProgramaMedico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProgramaMedico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProgramaMedico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProgramaMedico] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProgramaMedico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProgramaMedico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProgramaMedico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProgramaMedico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProgramaMedico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProgramaMedico] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProgramaMedico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProgramaMedico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProgramaMedico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProgramaMedico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProgramaMedico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProgramaMedico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProgramaMedico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProgramaMedico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProgramaMedico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProgramaMedico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProgramaMedico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProgramaMedico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProgramaMedico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProgramaMedico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProgramaMedico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProgramaMedico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProgramaMedico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProgramaMedico] SET RECOVERY FULL 
GO
ALTER DATABASE [ProgramaMedico] SET  MULTI_USER 
GO
ALTER DATABASE [ProgramaMedico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProgramaMedico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProgramaMedico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProgramaMedico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProgramaMedico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProgramaMedico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProgramaMedico', N'ON'
GO
ALTER DATABASE [ProgramaMedico] SET QUERY_STORE = OFF
GO
USE [ProgramaMedico]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 01/11/2024 11:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[CitaID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NOT NULL,
	[EmpleadoID] [int] NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[Descripcion] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CitaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 01/11/2024 11:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[EmpleadoID] [int] IDENTITY(1,1) NOT NULL,
	[DUI] [nvarchar](20) NULL,
	[NombreCompleto] [nvarchar](20) NULL,
	[Estado] [int] NULL,
	[TipoEmpleadoID] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[Especialidad] [nvarchar](100) NULL,
 CONSTRAINT [PK__Empleado__958BE6F06A2B38C4] PRIMARY KEY CLUSTERED 
(
	[EmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 01/11/2024 11:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[EstadoID] [int] IDENTITY(1,1) NOT NULL,
	[TipoEstado] [nvarchar](50) NULL,
 CONSTRAINT [PK__Estado__FEF86B604C23A0E5] PRIMARY KEY CLUSTERED 
(
	[EstadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialMedico]    Script Date: 01/11/2024 11:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialMedico](
	[HistorialID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NULL,
	[FechaConsulta] [date] NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Diagnostico] [nvarchar](max) NULL,
	[Tratamiento] [nvarchar](max) NULL,
 CONSTRAINT [PK__Historia__975206EF3DE14266] PRIMARY KEY CLUSTERED 
(
	[HistorialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 01/11/2024 11:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[PacienteID] [int] IDENTITY(1,1) NOT NULL,
	[DUI] [nvarchar](20) NULL,
	[NombreCompleto] [nvarchar](250) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Sexo] [nvarchar](10) NULL,
	[Edad] [int] NULL,
	[TipoSangre] [nvarchar](5) NULL,
	[Estatura] [decimal](5, 2) NULL,
	[Peso] [decimal](5, 2) NULL,
 CONSTRAINT [PK__Paciente__9353C07FFD30F044] PRIMARY KEY CLUSTERED 
(
	[PacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 01/11/2024 11:37:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[TipoEmpleadoID] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](50) NULL,
 CONSTRAINT [PK__TipoEmpl__0636C37B1856E5FF] PRIMARY KEY CLUSTERED 
(
	[TipoEmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Citas] ON 

INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (1, 1, 8, CAST(N'2024-11-30T12:00:00.000' AS DateTime), N'Duele panza')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (2, 1, 7, CAST(N'2024-11-29T22:00:00.000' AS DateTime), N'Prueba')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (3, 1, 7, CAST(N'2024-12-06T14:00:00.000' AS DateTime), N'Holaa')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (4, 1, 7, CAST(N'2024-12-06T12:00:00.000' AS DateTime), N'Holaa')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (5, 1, 13, CAST(N'2024-12-06T21:00:00.000' AS DateTime), N'Citaa')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (6, 1, 7, CAST(N'2024-11-06T12:00:00.000' AS DateTime), N'Ayudaaa')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (7, 1, 7, CAST(N'2024-08-06T23:00:00.000' AS DateTime), N'Nose que me pasa')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (8, 1, 7, CAST(N'2024-12-06T17:00:00.000' AS DateTime), N'Prueba')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (9, 1, 7, CAST(N'2024-12-06T13:00:00.000' AS DateTime), N'Prueba')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (10, 1, 7, CAST(N'2024-12-06T12:00:00.000' AS DateTime), N'Hola')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (11, 1, 9, CAST(N'2024-12-06T17:00:00.000' AS DateTime), N'Crayola')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (12, 1, 13, CAST(N'2024-12-06T17:00:00.000' AS DateTime), N'Nose')
INSERT [dbo].[Citas] ([CitaID], [PacienteID], [EmpleadoID], [FechaHora], [Descripcion]) VALUES (13, 1, 13, CAST(N'2024-12-01T17:00:00.000' AS DateTime), N'Que pasa')
SET IDENTITY_INSERT [dbo].[Citas] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([EmpleadoID], [DUI], [NombreCompleto], [Estado], [TipoEmpleadoID], [Usuario], [Password], [Especialidad]) VALUES (7, N'12345678-9', N'Juan Pérez', 1, 1, N'juanperez', N'123456', N'Cardiología')
INSERT [dbo].[Empleados] ([EmpleadoID], [DUI], [NombreCompleto], [Estado], [TipoEmpleadoID], [Usuario], [Password], [Especialidad]) VALUES (8, N'98765432-1', N'María González', 1, 1, N'mariagonzalez', N'abcdef', N'Pediatría')
INSERT [dbo].[Empleados] ([EmpleadoID], [DUI], [NombreCompleto], [Estado], [TipoEmpleadoID], [Usuario], [Password], [Especialidad]) VALUES (9, N'87654321-0', N'Carlos López', 1, 1, N'carloslopez', N'qwerty', N'Neurología')
INSERT [dbo].[Empleados] ([EmpleadoID], [DUI], [NombreCompleto], [Estado], [TipoEmpleadoID], [Usuario], [Password], [Especialidad]) VALUES (10, N'05577995-5', N'Ronald Renderos', 1, 2, N'ronaldrenderos', N'password', N'NA')
INSERT [dbo].[Empleados] ([EmpleadoID], [DUI], [NombreCompleto], [Estado], [TipoEmpleadoID], [Usuario], [Password], [Especialidad]) VALUES (11, N'05555555-2', N'Admin Admin', 1, 2, N'admin', N'admin', N'NA')
INSERT [dbo].[Empleados] ([EmpleadoID], [DUI], [NombreCompleto], [Estado], [TipoEmpleadoID], [Usuario], [Password], [Especialidad]) VALUES (12, N'45678901-3', N'Oscar Morales', 1, 2, N'oscarmorales', N'123abc', N'NA')
INSERT [dbo].[Empleados] ([EmpleadoID], [DUI], [NombreCompleto], [Estado], [TipoEmpleadoID], [Usuario], [Password], [Especialidad]) VALUES (13, N'12345678-9', N'Pedro Pedro', 1, 1, N'pedropedrope', N'hola12345', N'Medicina Familiar')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([EstadoID], [TipoEstado]) VALUES (1, N'Activo')
INSERT [dbo].[Estado] ([EstadoID], [TipoEstado]) VALUES (2, N'Inactivo')
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([PacienteID], [DUI], [NombreCompleto], [Telefono], [Sexo], [Edad], [TipoSangre], [Estatura], [Peso]) VALUES (1, N'12345555-6', N'Carlos Campo', N'1234-1234', N'Masculino', 12, N'A-', CAST(181.00 AS Decimal(5, 2)), CAST(123.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoEmpleado] ON 

INSERT [dbo].[TipoEmpleado] ([TipoEmpleadoID], [Tipo]) VALUES (1, N'Medico')
INSERT [dbo].[TipoEmpleado] ([TipoEmpleadoID], [Tipo]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[TipoEmpleado] OFF
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Empleados] FOREIGN KEY([EmpleadoID])
REFERENCES [dbo].[Empleados] ([EmpleadoID])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Empleados]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Pacientes] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([PacienteID])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Pacientes]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK__Empleados__TipoE__29572725] FOREIGN KEY([TipoEmpleadoID])
REFERENCES [dbo].[TipoEmpleado] ([TipoEmpleadoID])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK__Empleados__TipoE__29572725]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_EstadoID] FOREIGN KEY([Estado])
REFERENCES [dbo].[Estado] ([EstadoID])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_EstadoID]
GO
ALTER TABLE [dbo].[HistorialMedico]  WITH CHECK ADD  CONSTRAINT [FK__Historial__Pacie__36B12243] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([PacienteID])
GO
ALTER TABLE [dbo].[HistorialMedico] CHECK CONSTRAINT [FK__Historial__Pacie__36B12243]
GO
USE [master]
GO
ALTER DATABASE [ProgramaMedico] SET  READ_WRITE 
GO
