
-- Tabla de Usuarios
CREATE TABLE usuarios (
    id_usuario BIGINT PRIMARY KEY AUTO_INCREMENT,
    p_nombre VARCHAR(15) NOT NULL,
    s_nombre VARCHAR(15),
    p_apellido VARCHAR(15) NOT NULL,
    s_apellido VARCHAR(15),
    correo VARCHAR(70) UNIQUE NOT NULL,
    telefono BIGINT
);

-- Tabla de Administrador
CREATE TABLE administrador (
    usuarios_id_usuario BIGINT PRIMARY KEY,
    FOREIGN KEY (usuarios_id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabla de Operario
CREATE TABLE operario (
    usuarios_id_usuario BIGINT PRIMARY KEY,
    salario INT(15),
    FOREIGN KEY (usuarios_id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabla de Cliente
CREATE TABLE cliente (
    usuarios_id_usuario BIGINT PRIMARY KEY,
    fecha_nacimiento DATE,
    direccion VARCHAR(60),
    FOREIGN KEY (usuarios_id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabla de Producto
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


-- Tabla de Tipo de Producto
CREATE TABLE tipo_producto (
    idtipo_producto TINYINT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo VARCHAR(15) NOT NULL,
    registronitipo VARCHAR(25)
);

-- Tabla de Proveedor
CREATE TABLE proveedor (
    idproveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(45) NOT NULL,
    segundo_nombre VARCHAR(45),
    apellido_proveedor VARCHAR(45) NOT NULL,
    segundo_apellido VARCHAR(70),
    correo_proveedor VARCHAR(70),
    telefono BIGINT
);

-- Tabla de Inventario
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
    productos_tipo_productos_idtipo_producto TINYINT,
    FOREIGN KEY (productos_idproducto) REFERENCES producto(idproducto),
    FOREIGN KEY (productos_tipo_productos_idtipo_producto) REFERENCES tipo_producto(idtipo_producto)
);

-- Tabla de Venta
CREATE TABLE venta (
    idfactura INT PRIMARY KEY AUTO_INCREMENT,
    fecha_factura DATE,
    subtotal INT NOT NULL,
    descuento TINYINT,
    abono INT,
    valor_total INT NOT NULL,
    observaciones TEXT,
    fk_operario BIGINT,
    fk_cliente BIGINT,
    fk_administrador BIGINT,
    FOREIGN KEY (fk_operario) REFERENCES operario(usuarios_id_usuario),
    FOREIGN KEY (fk_cliente) REFERENCES cliente(usuarios_id_usuario),
    FOREIGN KEY (fk_administrador) REFERENCES administrador(usuarios_id_usuario)
);

-- Tabla Intermedia Venta-Producto
CREATE TABLE venta_has_producto (
    venta_idfactura INT,
    venta_cliente_id_usuario BIGINT,
    venta_operario_id_usuario BIGINT,
    venta_administrador_id_usuario BIGINT,
    productos_idproducto INT,
    PRIMARY KEY (venta_idfactura, productos_idproducto),
    FOREIGN KEY (venta_idfactura) REFERENCES venta(idfactura),
    FOREIGN KEY (productos_idproducto) REFERENCES producto(idproducto)
);

-- Tabla de Envío
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
    operario_usuarios_id_usuario BIGINT,
    cliente_usuarios_id_usuario BIGINT,
    administrador_usuarios_id_usuario BIGINT,
    FOREIGN KEY (fk_mensajeria) REFERENCES mensajeria(idmensajeria),
    FOREIGN KEY (operario_usuarios_id_usuario) REFERENCES operario(usuarios_id_usuario),
    FOREIGN KEY (cliente_usuarios_id_usuario) REFERENCES cliente(usuarios_id_usuario),
    FOREIGN KEY (administrador_usuarios_id_usuario) REFERENCES administrador(usuarios_id_usuario)
);

-- Tabla de Mensajería
CREATE TABLE mensajeria (
    idmensajeria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_mensajeria VARCHAR(45),
    tel_mensajeria BIGINT,
    direccion_mensajeria VARCHAR(60),
    cobertura VARCHAR(45)
);
