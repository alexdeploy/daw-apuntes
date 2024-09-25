-- Crear la BD seg�n SGBD

-- CREATE DATABASE evaluable CHARACTER SET utf8 COLLATE utf8_unicode_ci;
-- USE evaluable;

-- CREATE USER evaluable IDENTIFIED BY evaluable;
-- GRANT CONNECT, RESOURCE TO evaluable;
-- CONNECT evaluable/evaluable;

-- Crear Tablas

CREATE TABLE usuarios (
	dni VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(25),
	apellido1 VARCHAR(20),
	apellido2 VARCHAR(20) NULL,
	password VARCHAR(8)	
);
	
CREATE TABLE alumnos (
	dni VARCHAR(9) PRIMARY KEY,	
	fecha_nacimiento DATE,
	FOREIGN KEY(dni) REFERENCES usuarios(dni)
);

CREATE TABLE departamentos (
	departamento VARCHAR(20) PRIMARY KEY,	
	jefe_dep VARCHAR(9)
	-- No se puede declarar la FK puesto que a�n no existe la tabla profesores
	-- FOREIGN KEY(jefe_dep) REFERENCES profesores(dni)
);

CREATE TABLE profesores (
	dni VARCHAR(9) PRIMARY KEY,	
	departamento VARCHAR(20),
	FOREIGN KEY(dni) REFERENCES usuarios(dni),
	FOREIGN KEY(departamento) REFERENCES departamentos(departamento)
);

-- Ahora ya podr�amos activar la Caj en departamentos, pero con los profesores y
-- departamentos vac�os y ambas relacionadas entre ellas con Caj nos obliga a declarar
-- las Caj como null al insertar profesores y modificar las tuplas cuando est�n los
-- departamentos o viceversa, as� que ya la activaremos cuando est�n insertados los
-- datos con la siguiente orden:
-- ALTER TABLE departamentos ADD(FOREIGN KEY(jefe_dep) REFERENCES profesores(dni));

CREATE TABLE modulos (
	cod_mod VARCHAR(4) PRIMARY KEY,	
	modulo VARCHAR(35)
);

CREATE TABLE imparten (
	dni_profesor VARCHAR(9),	
	cod_mod VARCHAR(4),
	PRIMARY KEY(dni_profesor,cod_mod),
	FOREIGN KEY(dni_profesor) REFERENCES profesores(dni),
	FOREIGN KEY(cod_mod) REFERENCES modulos(cod_mod)
);

CREATE TABLE matriculados (
	dni_alumno VARCHAR(9),	
	cod_mod VARCHAR(4),
	PRIMARY KEY(dni_alumno,cod_mod),
	FOREIGN KEY(dni_alumno) REFERENCES alumnos(dni),
	FOREIGN KEY(cod_mod) REFERENCES modulos(cod_mod)
);
	
CREATE TABLE ti (
	id_ti VARCHAR(4),
	dia INTEGER CHECK(dia>-1 AND dia<5),
	-- Elegir en funci�n del SGBD
	-- hora TIME,
	-- hora DATE,
	dni_profesor VARCHAR(9),
	PRIMARY KEY(id_ti),
	unique (dia,hora,dni_profesor),
	FOREIGN KEY(dni_profesor) REFERENCES profesores(dni)
);

CREATE TABLE reserva_ti(
	fecha_ti DATE,
	id_ti VARCHAR(4),
	dni_alumno VARCHAR(9),
	PRIMARY KEY(fecha_ti,id_ti),
	FOREIGN KEY(dni_alumno) REFERENCES alumnos(dni),
	FOREIGN KEY(id_ti) REFERENCES ti(id_ti)
);

CREATE TABLE aulas (
	cod_aula VARCHAR(3) PRIMARY KEY,
	tipo VARCHAR(11) CHECK(tipo IN ('informatica','estudio','taller','laboratorio')),
	capacidad_max INTEGER
);

CREATE TABLE reserva_aula (
	cod_aula VARCHAR(3),
	dni_profesor VARCHAR(9),
	-- Elegir en funci�n del SGBD
	-- fecha DATETIME,
	-- fecha DATE,
	PRIMARY KEY (cod_aula,fecha),
	FOREIGN KEY (cod_aula) REFERENCES aulas(cod_aula),
	FOREIGN KEY (dni_profesor) REFERENCES profesores(dni)
);

-- Rellenar las tablas en MySQL tras crear los csv. Substituir ruta_archivo por la ruta adecuada
-- y a�adir finalmente la FK de departamentos en oracle importar los csv desde SQLDeveloper y
-- a�adir la restricci�n despu�s

-- load data infile 'ruta_archivo/usuarios.csv' into table usuarios fields terminated by ',' lines terminated by '\r\n';
-- load data infile 'ruta_archivo/alumnos.csv' into table alumnos fields terminated by ',' lines terminated by '\r\n';
-- load data infile 'ruta_archivo/departamentos.csv' into table departamentos fields terminated by ',' lines terminated by '\r\n';
-- load data infile 'ruta_archivo/profesores.csv' into table profesores fields terminated by ',' lines terminated by '\r\n';
-- load data infile 'ruta_archivo/modulos.csv' into table modulos fields terminated by ',' lines terminated by '\r\n';
-- load data infile 'ruta_archivo/imparten.csv' into table imparten fields terminated by ',' lines terminated by '\r\n';
-- load data infile 'ruta_archivo/matriculados.csv' into table matriculados fields terminated by ',' lines terminated by '\r\n';
-- load data infile 'ruta_archivo/ti.csv' into table ti fields terminated by ',' lines terminated by '\r\n';
-- load data infile 'ruta_archivo/reserva_ti.csv' into table reserva_ti fields terminated by ',' lines terminated by '\r\n';
-- load data infile 'ruta_archivo/aulas.csv' into table aulas fields terminated by ',' lines terminated by '\r\n';
-- load data infile 'ruta_archivo/reserva_aula.csv' into table reserva_aula fields terminated by ',' lines terminated by '\r\n';
-- ALTER TABLE departamentos ADD(FOREIGN KEY(jefe_dep) REFERENCES profesores(dni));