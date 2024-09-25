-- Crea tabla articulos

CREATE TABLE articulos(
  id_art INTEGER,
  nombre VARCHAR(30) default '',
  precio NUMBER default 0.0, 
  codigo VARCHAR(7) default'',
  id_gru INTEGER default 0 NOT NULL,
  CONSTRAINT ART_ID_PK PRIMARY KEY(id_art)
);

--en MySQL: precio NUMERIC default 0.0 

-----------------
-----------------

-- Crea tabla clientes

CREATE TABLE clientes (
  id_cli INTEGER NOT NULL ,
  nombre VARCHAR(60) default'' NOT NULL ,
  direccion VARCHAR(80) default'',
  constraint cli_idc_pk PRIMARY KEY  (id_cli)
);

-----------------
-----------------

-- Crea tabla FACTURAS 

CREATE TABLE facturas (
  id_fac INTEGER NOT NULL ,
  serie VARCHAR(1)default'' NOT NULL,
  numero INTEGER default 0 NOT NULL,
  fecha date,
  id_cli INTEGER default 0  NOT NULL,
  id_ven INTEGER NOT NULL,
  CONSTRAINT FAC_IDF_PK PRIMARY KEY  (id_fac)
  ) ;

-----------------
-----------------

-- Crea tabla GRUPOS

CREATE TABLE grupos (
  id_gru  INTEGER,
  descripcion VARCHAR(15) default '' NOT NULL,
  CONSTRAINT GRU_IDG_PK PRIMARY KEY  (id_gru)
);

-----------------
-----------------

-- Crea tabla lineas_factura

CREATE TABLE lineas_factura (
  id_lin INTEGER NOT NULL,
  id_fac INTEGER default 0 NOT NULL ,
  importe FLOAT default 0 NOT NULL ,
  id_art INTEGER NOT NULL,
  cantidad INTEGER NOT NULL,
  fecha date default '01/01/2000' NOT NULL ,
  id_suc INTEGER default 0 NOT NULL ,
  constraint LIN_PK PRIMARY KEY  (id_lin, id_fac)
   );


----------------- en MySQL: fecha date default '2000-01-01' NOT NULL,
-----------------

-- Crea tabla sucursales 
CREATE TABLE sucursales (
  id_suc INTEGER NOT NULL,
  descripcion VARCHAR(15) default'' NOT NULL  ,
  CONSTRAINT SUC_IDS_PK PRIMARY KEY  (id_suc)
)  ;


-----------------
-----------------

-- Crea tabla vendedores

CREATE TABLE vendedores (
  id_ven INTEGER NOT NULL,
  nombre VARCHAR(50) default '' NOT NULL  ,
  fecha_ingreso date default '01-01-2000' NOT NULL ,
  salario float default 0 NOT NULL ,
  CONSTRAINT VEN_IDV_PK PRIMARY KEY  (id_ven)
) ;

-----------------en MySQL: fecha_ingreso date default '2000-01-01' NOT NULL,
-----------------

-- Crea tabla lineas_factura

CREATE TABLE lineas_factura (
  id_lin INTEGER NOT NULL,
  id_fac INTEGER default 0 NOT NULL ,
  importe FLOAT default 0 NOT NULL ,
  id_art INTEGER NOT NULL,
  cantidad INTEGER NOT NULL,
  fecha date default '01/01/2000' NOT NULL ,
  id_suc INTEGER default 0 NOT NULL ,
  constraint LIN_PK PRIMARY KEY  (id_lin, id_fac)
   );


-----------------
-----------------

-- Crea tabla sucursales 
CREATE TABLE sucursales (
  id_suc INTEGER NOT NULL,
  descripcion VARCHAR(15) default'' NOT NULL  ,
  CONSTRAINT SUC_IDS_PK PRIMARY KEY  (id_suc)
)  ;


-----------------
-----------------

-- Crea tabla vendedores

CREATE TABLE vendedores (
  id_ven INTEGER NOT NULL,
  nombre VARCHAR(50) default '' NOT NULL  ,
  fecha_ingreso date default '01-01-2000' NOT NULL ,
  salario float default 0 NOT NULL ,
  CONSTRAINT VEN_IDV_PK PRIMARY KEY  (id_ven)
) ;

