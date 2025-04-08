
CREATE TABLE tipo_producto (
    idtipo_producto TINYINT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo VARCHAR(15) NOT NULL,
    registronitipo VARCHAR(25)
);

CREATE TABLE proveedor (
    idproveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(45) NOT NULL,
    correo_proveedor VARCHAR(70),
    telefono BIGINT NOT NULL,
    direccion VARCHAR(60) NOT NULL
);

CREATE TABLE mensajeria (
    idmensajeria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_mensajeria VARCHAR(45),
    tel_mensajeria BIGINT,
    direccion_mensajeria VARCHAR(60),
    cobertura VARCHAR(45)
);

CREATE TABLE usuarios (
    id_usuario BIGINT PRIMARY KEY AUTO_INCREMENT,
    num_identificacion BIGINT NOT NULL,
    p_nombre VARCHAR(15) NOT NULL,
    s_nombre VARCHAR(15),
    p_apellido VARCHAR(15) NOT NULL,
    s_apellido VARCHAR(15),
    correo VARCHAR(70) UNIQUE NOT NULL,
    telefono BIGINT,
    salario BIGINT,
    fecha_nacimiento DATE,
    direccion VARCHAR(60)
);

CREATE TABLE tipousuario (
    id_tipousuario TINYINT PRIMARY KEY,
    nombre_tipo VARCHAR(15) NOT NULL,
    usuarios_id_usuario BIGINT,
    FOREIGN KEY (usuarios_id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE producto (
    idproducto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(60) NOT NULL,
    precio_producto INT NOT NULL,
    descripcion_producto VARCHAR(95),
    tipo_producto_idtipo_producto TINYINT NOT NULL,
    proveedor_idproveedor INT NOT NULL,
    FOREIGN KEY (tipo_producto_idtipo_producto) REFERENCES tipo_producto(idtipo_producto),
    FOREIGN KEY (proveedor_idproveedor) REFERENCES proveedor(idproveedor)
);

CREATE TABLE inventario (
    idinventario INT PRIMARY KEY AUTO_INCREMENT,
    cantidad_existente SMALLINT,
    stock_max SMALLINT,
    stock_min TINYINT,
    num_lote BIGINT,
    fecha_vencimiento DATE,
    observaciones TEXT,
    fecha_entrada DATE,
    fecha_salida DATE,
    productos_idproducto INT,
    FOREIGN KEY (productos_idproducto) REFERENCES producto(idproducto)
);

CREATE TABLE venta (
    idfactura INT PRIMARY KEY AUTO_INCREMENT,
    fecha_factura DATE,
    subtotal INT NOT NULL,
    descuento TINYINT,
    abono INT,
    valor_total INT NOT NULL,
    observaciones TEXT,
    usuarios_id_usuario BIGINT,
    FOREIGN KEY (usuarios_id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE venta_has_producto (
    venta_idfactura INT,
    productos_idproducto INT,
    PRIMARY KEY (venta_idfactura, productos_idproducto),
    FOREIGN KEY (venta_idfactura) REFERENCES venta(idfactura),
    FOREIGN KEY (productos_idproducto) REFERENCES producto(idproducto)
);

CREATE TABLE envio (
    idenvio INT PRIMARY KEY AUTO_INCREMENT,
    estado_envio VARCHAR(15),
    fecha_envio DATE,
    fecha_entrega DATE,
    direccion_envio VARCHAR(60),
    direccion_salida VARCHAR(60),
    observaciones TEXT,
    novedades TEXT,
    fk_mensajeria INT,
    usuarios_id_usuario BIGINT,
    FOREIGN KEY (fk_mensajeria) REFERENCES mensajeria(idmensajeria),
    FOREIGN KEY (usuarios_id_usuario) REFERENCES usuarios(id_usuario)
);
