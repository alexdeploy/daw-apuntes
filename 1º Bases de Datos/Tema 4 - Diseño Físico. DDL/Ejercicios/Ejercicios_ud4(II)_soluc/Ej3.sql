-- Se ha considerado el DNI (sólo número) no el NIF
-- Es compatible con MySQL, para la solución con oracle no permite ON DELETE NO ACTION
-- Sólo SET NULL/CASCADE, así que habria que eliminar esas 2 ordenes

CREATE TABLE usuario (
dni INT NOT NULL,
nombre VARCHAR(30) DEFAULT NULL,
fecha_nac DATE DEFAULT NULL,
CONSTRAINT usuario_pk PRIMARY KEY (dni));

CREATE TABLE cliente (
dni INT NOT NULL,
descuento INT NULL,
CONSTRAINT cliente_pk PRIMARY KEY (dni),
CONSTRAINT dni_cliente_fk FOREIGN KEY (dni) REFERENCES usuario(dni));

CREATE TABLE producto (
codigo_producto INT NOT NULL,
nombre VARCHAR(30) NULL,
precioactual INT NULL,
CONSTRAINT producto_pk PRIMARY KEY (codigo_producto));

CREATE TABLE pedido(
codigo INT NOT NULL,
fecha DATE NULL,
dni_cliente INT NOT NULL,
CONSTRAINT pedido_pk PRIMARY KEY (codigo),
CONSTRAINT dni_pedido_fk FOREIGN KEY (dni_cliente)
REFERENCES cliente (dni) ON DELETE NO ACTION);

CREATE TABLE linea(
numero_linea INT NOT NULL,
precioventa INT  NULL,
Cantidad INT NULL,
codigo_pedido INT NOT NULL,
codigo_producto INT NOT NULL,
CONSTRAINT linea_pk   PRIMARY KEY (numero_linea, codigo_pedido),
CONSTRAINT cod_pedido_linea_fk FOREIGN KEY (codigo_pedido)
REFERENCES pedido (codigo)ON DELETE CASCADE,
CONSTRAINT cod_producto_linea_fk FOREIGN KEY (codigo_producto)
REFERENCES producto (codigo_producto) ON DELETE NO ACTION);
    