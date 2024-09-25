CREATE TABLE proveedores (
    codProveedor VARCHAR(10),
    NombreProveedor VARCHAR(30),
    CodPostal VARCHAR(5),
    PRIMARY KEY (codProveedor)
);

CREATE TABLE productosped (
    RefeProducto VARCHAR(10),
    NombreProducto VARCHAR(30),
    Precio FLOAT,
    PRIMARY KEY (RefeProducto)
);

CREATE TABLE pedidos (
    NumPedido INTEGER,
    Fecha DATE,
    Proveedor VARCHAR (10),
    PRIMARY KEY (NumPedido),
    FOREIGN KEY (Proveedor) REFERENCES proveedores (codProveedor)
);

CREATE TABLE productospedido (
    NumPedido INTEGER,
    RefeProducto VARCHAR(10),
    Cantidad INTEGER,
    PRIMARY KEY (NumPedido, RefeProducto),
    FOREIGN KEY (NumPedido) REFERENCES pedidos (NumPedido),
    FOREIGN KEY (RefeProducto) REFERENCES productosped (RefeProducto)
);