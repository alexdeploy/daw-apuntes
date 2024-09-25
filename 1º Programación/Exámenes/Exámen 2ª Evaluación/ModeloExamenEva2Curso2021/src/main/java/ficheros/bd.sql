
CREATE TABLE alumnos (  
id int(11) NOT NULL,
nombre varchar(20)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO alumnos (id, nombre) VALUES(1, 'Paco'),(2, 'Juan');

ALTER TABLE alumnos  ADD PRIMARY KEY (id);
