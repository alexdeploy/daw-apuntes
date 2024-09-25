CREATE TABLE pleito (
    cod_pleito INTEGER,
    resultado VARCHAR(10) CHECK ( resultado IN ('culpable','inocente','sobreseido')),
    CONSTRAINT PLE_COD_PK PRIMARY KEY (cod_pleito)
);

CREATE TABLE recurso (
    cod_rec INTEGER NOT NULL UNIQUE,
    fecha DATE,
    cod_pleito INTEGER,
    CONSTRAINT REC_COD_PK PRIMARY KEY (cod_rec, cod_pleito),
    CONSTRAINT REC_COD_FK FOREIGN KEY (cod_pleito) REFERENCES pleito (cod_pleito)
);