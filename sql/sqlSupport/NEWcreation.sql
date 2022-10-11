DROP TABLE FEDERACION CASCADE CONSTRAINT;
DROP TABLE DEPORTISTA CASCADE CONSTRAINT;
DROP TABLE CLUB CASCADE CONSTRAINT;
DROP TABLE FICHAFEDERATIVA CASCADE CONSTRAINT;
DROP TABLE COMPETICION CASCADE CONSTRAINT;
DROP TABLE EDICION CASCADE CONSTRAINT;
DROP TABLE DIVISION CASCADE CONSTRAINT;
DROP TABLE SECCION CASCADE CONSTRAINT;
DROP TABLE PARTICIPANTES CASCADE CONSTRAINT;
DROP TABLE CONTROL CASCADE CONSTRAINT;
DROP TABLE HFEDERACION CASCADE CONSTRAINT;
DROP TABLE HDEPORTISTA CASCADE CONSTRAINT;
DROP TABLE HCLUB CASCADE CONSTRAINT;
DROP TABLE TRIBUNAL CASCADE CONSTRAINT;
DROP TABLE HSECCION CASCADE CONSTRAINT;

-- Creamos la tabla federacion

CREATE TABLE FEDERACION (
name varchar2(90),
deporte varchar2(50),
pais varchar2(45),
CONSTRAINT PK_FEDERACION PRIMARY KEY (name, pais, deporte)
);

-- Creamos la tabla deportista

CREATE TABLE DEPORTISTA (
spic varchar(12),
nombre varchar2(40) NOT NULL,
apellido1 varchar2(40) NOT NULL,
apellido2 varchar2(40),
apodo varchar2(50),
edad NUMBER (2) NOT NULL,
fecha_nac DATE NOT NULL,
pais_nac varchar2(45) NOT NULL,
CONSTRAINT PK_DEPORTISTA PRIMARY KEY (spic),
CONSTRAINT CHECK_EDAD_EN_VALOR CHECK (edad BETWEEN 1 AND 99)
);

-- Creamos la tabla  CLUB

CREATE TABLE CLUB (
nombre varchar2(100),
pais varchar2(45),
año DATE NOT NULL,
CONSTRAINT PK_CLUB PRIMARY KEY (nombre,pais)
);

-- Creamos la tabla FICHAFEDERATIVA

CREATE TABLE FICHAFEDERATIVA (
federacion varchar2(90),
pais_fed varchar2(45),
deporte_fed varchar2(50),
deportista varchar(12),
num_fed varchar2(5) NOT NULL,
fecha_expedicion DATE NOT NULL,
fecha_expiracion DATE NOT NULL,
categoria varchar2(14) NOT NULL,
club varchar2(100),
club_pais varchar2(45),
CONSTRAINT PK_FICHAFEDERATIVA PRIMARY KEY (federacion, pais_fed, deporte_fed, deportista),
CONSTRAINT FK_FICHAFEDERATIVA_FEDERACION FOREIGN KEY (federacion, pais_fed, deporte_fed) REFERENCES FEDERACION(name, pais, deporte),
CONSTRAINT FK_FICHAFEDERATIVA_DEPORTISTA FOREIGN KEY (deportista) REFERENCES DEPORTISTA(spic) ON DELETE CASCADE,
CONSTRAINT FK_FICHAFEDERATIVA_CLUB FOREIGN KEY (club, club_pais) REFERENCES CLUB(nombre, pais)
);


-- Creamos la tabla Competicion

CREATE TABLE COMPETICION (
pais varchar2(45),
categoria varchar(14),
deporte varchar2(15),
nombre varchar2(100) NOT NULL,
federacion varchar2(90) NOT NULL,
deporte_fed varchar2(15) NOT NULL,
CONSTRAINT PK_COMPETICION PRIMARY KEY (nombre,categoria, pais, deporte_fed, federacion, deporte),
CONSTRAINT FK_COMPETICION_FEDERACION FOREIGN KEY (federacion, pais, deporte_fed) REFERENCES FEDERACION(name, pais, deporte) ON DELETE CASCADE
);

-- Creamos la tabla edicion

CREATE TABLE EDICION(
pais varchar2(45),
categoria varchar(14),
deporte varchar2(14),
nombre varchar2(100) NOT NULL,
año NUMBER(4) NOT NULL,
federacion varchar2(90) NOT NULL,
deporte_fed varchar2(15) NOT NULL,
edicion varchar2(14),
premio varchar2(10),
ganador varchar2(100),
pais_ganador varchar2(45),
CONSTRAINT PK_EDICION PRIMARY KEY (nombre,categoria, pais, deporte_fed, federacion, año),
CONSTRAINT FK_EDICION_CLUB FOREIGN KEY (ganador, pais_ganador) REFERENCES CLUB(nombre, pais),
CONSTRAINT FK_EDICION_COMPETICION FOREIGN KEY (nombre,categoria, pais, deporte_fed, federacion,deporte) REFERENCES COMPETICION(nombre,categoria, pais, deporte_fed, federacion, deporte)
);

-- Creamos la tabla division

CREATE TABLE DIVISION(
pais varchar2(45),
categoria varchar(14),
nombre varchar2(100) NOT NULL,
federacion varchar2(90) NOT NULL,
deporte_fed varchar2(15) NOT NULL,
division varchar2(6),
año NUMBER(4),
CONSTRAINT PK_DIVISION PRIMARY KEY (nombre,categoria, pais, deporte_fed, federacion,division, año),
CONSTRAINT FK_DIVISION_EDICION FOREIGN KEY (nombre, categoria, pais, deporte_fed, federacion, año) REFERENCES EDICION(nombre,categoria, pais, deporte_fed, federacion, año)
);

-- Creamos la tabla Seccion

CREATE TABLE SECCION (
club varchar2(100),
pais_club varchar2(45),
seccion varchar2(45),
categoria varchar2(14) NOT NULL,
deporte varchar2(15),
CONSTRAINT PK_SECCION PRIMARY KEY (club,pais_club, seccion, deporte),
CONSTRAINT FK_SECCION_CLUB FOREIGN KEY (club, pais_club) REFERENCES CLUB(nombre, pais) ON DELETE CASCADE
);

-- Creamos la tabla participantes

CREATE TABLE PARTICIPANTES (
competicion varchar2(100) NOT NULL,
categoria varchar2(6),
pais varchar2(45),
deporte_fed varchar2(15),
año NUMBER(4),
federacion varchar2(90),
premio varchar2(10),
club varchar2 (45),
pais_club varchar2(45),
seccion varchar(45),
division varchar2(6),
deporte_club varchar(15),
categ_club varchar2(6),
CONSTRAINT PK_PARTICIPANTES PRIMARY KEY (competicion, pais, deporte_fed, año, federacion, premio, club, pais_club, seccion, deporte_club, categ_club),
CONSTRAINT FK_PARTICIPANTES_SECCION FOREIGN KEY (club,pais_club,seccion, deporte_club) REFERENCES SECCION(club, pais_club, seccion, deporte) ON DELETE CASCADE,
CONSTRAINT FK_PARTICIPANTES_DIVISION FOREIGN KEY (competicion, categoria, pais, deporte_fed, federacion, division, año) REFERENCES DIVISION(nombre,categoria, pais, deporte_fed, federacion,division, año)
);


-- Creamos la tabla Control

CREATE TABLE CONTROL (
fecha DATE,
hora varchar2(5) NOT NULL,
lugar varchar2(50) NOT NULL,
sujeto varchar(12) NOT NULL,
CONSTRAINT PK_CONTROL PRIMARY KEY (fecha, sujeto, lugar),
CONSTRAINT FK_CONTROL_DEPORTISTA FOREIGN KEY (sujeto) REFERENCES DEPORTISTA(spic) ON DELETE CASCADE
);

-- Creamos la tabla Tribunal

CREATE TABLE TRIBUNAL (
fecha_control DATE,
lugar_control varchar2(50),
deportista varchar2(12),
pais varchar2(45) NOT NULL,
tipo varchar2(20) NOT NULL,
sustancia varchar2(14) NOT NULL,
codigo_judicial NUMBER(4),
fecha_juicio varchar2(10),
CONSTRAINT PK_TRIBUNAL PRIMARY KEY (deportista, fecha_control, lugar_control,codigo_judicial, fecha_juicio, sustancia),
CONSTRAINT FK_TRIBUNAL_CONTROL FOREIGN KEY (fecha_control, lugar_control, deportista ) REFERENCES CONTROL(fecha, lugar, sujeto),
CONSTRAINT CHECK_CODIGO_JUDICIAL_EN_VALOR CHECK (codigo_judicial > 0)
);

-- Creamos la tabla Historico de federacion


CREATE TABLE HFEDERACION (
federacion varchar2(90),
deporte varchar2(15),
pais varchar2(45),
fecha_disolucion DATE,
motivo varchar2(300),
CONSTRAINT PK_HFEDERACION PRIMARY KEY (federacion),
CONSTRAINT FK_HFEDERACION_FEDERACION FOREIGN KEY (federacion, deporte, pais) REFERENCES FEDERACION(name, deporte, pais)
);

-- Creamos la tabla Historico de club


CREATE TABLE HCLUB (
club varchar2(100),
pais varchar2(45),
fecha_disolucion DATE,
motivo varchar2(300),
CONSTRAINT PK_HCLUB PRIMARY KEY (club, pais),
CONSTRAINT FK_HCLUB_CLUB FOREIGN KEY (club, pais) REFERENCES CLUB(nombre, pais)
);


-- Creamos la tabla Historico de deportista


CREATE TABLE HDEPORTISTA (
id_deportista varchar2(12),
fecha_eliminacion DATE,
motivo varchar2(300),
CONSTRAINT PK_HDEPORTISTA PRIMARY KEY (id_deportista),
CONSTRAINT FK_HDEPORTISTA_DEPORTISTA FOREIGN KEY (id_deportista) REFERENCES deportista(spic)
);

-- Creamos la tabla Historico de seccion


CREATE TABLE HSECCION (
club varchar2(100),
pais varchar2(45),
seccion varchar2(45),
categoria varchar2(14),
deporte varchar2(14),
fecha_disolucion DATE,
motivo varchar2(300),
CONSTRAINT PK_HSECCION PRIMARY KEY (club, pais, seccion, deporte),
CONSTRAINT FK_HSECCION_SECCION FOREIGN KEY (club, pais, seccion, deporte) REFERENCES SECCION(club, pais_club, seccion, deporte)
);

