-- La siguiente sintaxis es válida tanto en ORACLE como en MySQL

CREATE TABLE asociacion(
codigo VARCHAR(4) NOT NULL,
nombre VARCHAR(30) DEFAULT NULL,
ubicacion VARCHAR(30) DEFAULT NULL,
CONSTRAINT asociacion_pk PRIMARY KEY (codigo));

CREATE TABLE alpinistas (
nif CHAR(9),
nombre VARCHAR(30) DEFAULT NULL,
fecha_nacimiento DATE DEFAULT NULL,
codigo VARCHAR(4) DEFAULT NULL,
fecha_ingreso DATE DEFAULT NULL,
CONSTRAINT alpinistas_pk PRIMARY KEY (nif),
CONSTRAINT codigo_asociacion_fk FOREIGN KEY (codigo) REFERENCES asociacion(codigo));

CREATE TABLE telefonos (
nif CHAR(9) NOT NULL,
telefono CHAR(9) NOT NULL,
CONSTRAINT telefonos_pk PRIMARY KEY (nif, telefono),
CONSTRAINT nif_telefono_fk FOREIGN KEY (nif) REFERENCES alpinistas(nif));


CREATE TABLE picos (
nombre VARCHAR(30),
altura INTEGER DEFAULT NULL,
coordenadas VARCHAR(10) DEFAULT NULL,
pais VARCHAR(20) DEFAULT NULL,
CONSTRAINT picos_pk PRIMARY KEY (nombre));


CREATE TABLE escala (
nif CHAR(9) NOT NULL,
nombre VARCHAR(30) NOT NULL,
fecha_inicio DATE DEFAULT NULL,
tiempo VARCHAR(10) DEFAULT NULL,
oxigeno NUMBER(3,2),
cara VARCHAR(20),
PRIMARY KEY (nif, nombre),
FOREIGN KEY (nif) REFERENCES alpinistas(nif),
FOREIGN KEY (nombre) REFERENCES picos (nombre)
);
