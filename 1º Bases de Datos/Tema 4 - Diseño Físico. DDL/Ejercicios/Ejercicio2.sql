CREATE TABLE pais (
    nombre_p VARCHAR(30),
    bandera VARCHAR(70),
    renta FLOAT,
    CONSTRAINT PAI_NOM_PK PRIMARY KEY (nombre_p)
);

CREATE TABLE cuidad (
    nombre_c VARCHAR(40),
    habitantes INTEGER,
    nombre_p VARCHAR(30),
    CONSTRAINT CIU_NOM_PK PRIMARY KEY (nombre_c, nombre_p),
    CONSTRAINT CUI_NOM_FK FOREIGN KEY (nombre_p) REFERENCES pais (nombre_p)
);