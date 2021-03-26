create database Facultad
go
use Facultad
go
create table Carreras(
	ID char(4) not null primary key,
	Nombre char(50) not null,
	Fecha date not null check (Fecha<=getdate()),
	Mail char(50) not null,
	Nivel char(10) not null check (Nivel='Diplomatura' or Nivel='Pregrado' or Nivel='Grado'  or Nivel='Posgrado'),
)
go
create table Materias(
	ID int not null primary key identity (1,1),
	IDCarreras char(4) not null foreign key references Carreras (ID),
	Nombre char(50) not null,
	CargaHoraria int not null check (CargaHoraria>0)
)
go
create table Alumnos(
	Legajo bigint not null primary key identity (1000,1),
	IDCarreras char(4) not null foreign key references Carreras (ID),
	Nombre char(50) not null,
	Apellido char(50) not null,
	FechaNacimiento date not null check (FechaNacimiento< getdate()),
	Mail char(50) not null unique,
	Telefono char(10) not null
)