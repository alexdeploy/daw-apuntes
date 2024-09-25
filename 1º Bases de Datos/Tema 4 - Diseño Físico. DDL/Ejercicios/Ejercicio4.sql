CREATE TABLE empleado(
    cod_emp INTEGER,
    telf VARCHAR(9),
    CONSTRAINT EMP_COD_PK PRIMARY KEY (cod_emp)
);

CREATE TABLE cliente (
    dni VARCHAR(9),
    mombre VARCHAR(30),
    apellidos VARCHAR(60),
    CONSTRAINT CLI_DNI_PK PRIMARY KEY (dni)
);

CREATE TABLE coche (
    n_bastidor VARCHAR(17),
    marca VARCHAR(20),
    modelo VARCHAR(15),
    color VARCHAR(10) CHECK ( color IN ('rojo','blanco','azul','negro','plata','gris')),
    matricula VARCHAR(7) UNIQUE,
    CONSTRAINT COC_NBA_PK PRIMARY KEY (n_bastidor)
);

CREATE TABLE venta (
    cod_emp INTEGER NOT NULL,
    dni VARCHAR(9),
    n_bastidor VARCHAR(17),
    fecha DATE NOT NULL,
    precio INTEGER CHECK (precio > 0) NOT NULL,
    CONSTRAINT VEN_COD_PK PRIMARY KEY (dni, n_bastidor),
    CONSTRAINT VEN_COD_FK FOREIGN KEY (cod_emp) REFERENCES empleado (cod_emp),
    CONSTRAINT VEN_DNI_FK FOREIGN KEY (dni)  REFERENCES cliente (dni),
    CONSTRAINT VEN_NBA_FK FOREIGN KEY (n_bastidor) REFERENCES coche (n_bastidor),
);