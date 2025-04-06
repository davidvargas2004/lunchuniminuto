USE master;
GO

CREATE DATABASE lunchUniminuto;
GO

USE lunchUniminuto;
GO

CREATE TABLE rolUniversitario (
    idRolUniversitario INT IDENTITY(1,1) PRIMARY KEY,
    nombreRolUniversitario VARCHAR(100) NOT NULL
);

CREATE TABLE tipoDocumento (
    idTipoDocumento INT IDENTITY(1,1) PRIMARY KEY,
    abreviaturaTipoDocumento CHAR(3) NOT NULL,
    nombreTipoDocumento VARCHAR(150) NOT NULL
);

CREATE TABLE cliente (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    idTipoDocumento INT NOT NULL,
    nIdentificacionCliente VARCHAR(15) NOT NULL,
    nombresCliente VARCHAR(100) NOT NULL,
    apellidosCliente VARCHAR(100) NOT NULL,
    nCelularCliente VARCHAR(10) NOT NULL,
    correoECliente VARCHAR(150) NOT NULL,
    direccionCliente VARCHAR(150) NOT NULL,
    idRolUniversitario INT NOT NULL,
    CONSTRAINT FK_C_tipoDocumento FOREIGN KEY (idTipoDocumento) REFERENCES tipoDocumento(idTipoDocumento),    
    CONSTRAINT FK_C_rolUniversitario FOREIGN KEY (idRolUniversitario) REFERENCES rolUniversitario(idRolUniversitario)
);

CREATE TABLE combinacionesDias (
    idCombinacionesDias INT IDENTITY(1,1) PRIMARY KEY,
    descripcionCombinacionDias VARCHAR(250)
);

CREATE TABLE restaurante (
    idRestaurante INT IDENTITY(1,1) PRIMARY KEY,
    nIdentificacionRestaurante VARCHAR(15) NOT NULL,
    nombreRestaurante VARCHAR(100) NOT NULL,
    nCelularRestaurante VARCHAR(10) NOT NULL,
    correoERestaurante VARCHAR(150) NOT NULL,
    direccionRestaurante VARCHAR(150) NOT NULL,
    disponibilidadRestaurante INT NOT NULL,
    horaAperturaRestaurante TIME(0) NOT NULL,
    horaCierreRestaurante TIME(0) NOT NULL,
    CONSTRAINT FK_R_combinacionesDias FOREIGN KEY (disponibilidadRestaurante) REFERENCES combinacionesDias(idCombinacionesDias)
);

CREATE TABLE opcionPago (
    idOpcionPago INT IDENTITY(1,1) PRIMARY KEY,
    nombreOpcionPago VARCHAR(100) NOT NULL
);

CREATE TABLE metodoPago (
    idMetodoPago INT IDENTITY(1,1) PRIMARY KEY,
    idRestaurante INT NOT NULL,
    idOpcionPago INT NOT NULL,
    descripcionMetodoPago VARCHAR(250) NOT NULL,
    CONSTRAINT FK_mP_restaurante FOREIGN KEY (idRestaurante) REFERENCES restaurante(idRestaurante),
    CONSTRAINT FK_mP_opcionPago FOREIGN KEY (idOpcionPago) REFERENCES opcionPago(idOpcionPago)
);

CREATE TABLE categoriaComida (
    idCategoriaComida INT IDENTITY(1,1) PRIMARY KEY,
    nombreCategoriaComida VARCHAR(100) NOT NULL,
    descripcionCategoriaComida VARCHAR(250) NOT NULL
);

CREATE TABLE menuComida (
    idMenuComida INT IDENTITY(1,1) PRIMARY KEY,
    idRestaurante INT NOT NULL,
    nombreMenuComida VARCHAR(100) NOT NULL,
    descripcionMenuComida VARCHAR(250) NOT NULL,
    disponibilidadMenuComida INT NOT NULL,
    idCategoriaComida INT NOT NULL,
    CONSTRAINT FK_mC_idRestaurante FOREIGN KEY (idRestaurante) REFERENCES restaurante(idRestaurante),
    CONSTRAINT FK_mC_combinacionesDias FOREIGN KEY (disponibilidadMenuComida) REFERENCES combinacionesDias(idCombinacionesDias),
    CONSTRAINT FK_mC_idCategoriaComida FOREIGN KEY (idCategoriaComida) REFERENCES categoriaComida(idCategoriaComida)
);

CREATE TABLE precioComida (
    idPrecioComida INT IDENTITY(1,1) PRIMARY KEY,
    idMenuComida INT NOT NULL,
    fechaActualizacionPrecioComida DATE NOT NULL,
    precioPrecioComida DECIMAL(18,2),
    CONSTRAINT FK_pC_idMenuComida FOREIGN KEY (idMenuComida) REFERENCES menuComida(idMenuComida)
);

CREATE TABLE menuBebida (
    idMenuBebida INT IDENTITY(1,1) PRIMARY KEY,
    idRestaurante INT NOT NULL,
    nombreMenuBebida VARCHAR(100) NOT NULL,
    descripcionMenuBebida VARCHAR(250) NOT NULL,
    disponibilidadMenuBebida INT NOT NULL,
    idCategoriaComida INT NOT NULL,
    CONSTRAINT FK_mB_idRestaurante FOREIGN KEY (idRestaurante) REFERENCES restaurante(idRestaurante),
    CONSTRAINT FK_mB_combinacionesDias FOREIGN KEY (disponibilidadMenuBebida) REFERENCES combinacionesDias(idCombinacionesDias),
    CONSTRAINT FK_mB_idCategoriaComida FOREIGN KEY (idCategoriaComida) REFERENCES categoriaComida(idCategoriaComida)
);

CREATE TABLE precioBebida (
    idPrecioBebida INT IDENTITY(1,1) PRIMARY KEY,
    idMenuBebida INT NOT NULL,
    fechaActualizacionPrecioBebida DATE NOT NULL,
    precioPrecioBebida DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_pB_idMenuBebida FOREIGN KEY (idMenuBebida) REFERENCES menuBebida(idMenuBebida)
);

CREATE TABLE estadoServicio (
    idEstadoServicio INT IDENTITY(1,1) PRIMARY KEY,
    nombreEstadoServicio VARCHAR(100) NOT NULL,
    descripcionEstadoServicio VARCHAR(250) NOT NULL
);

CREATE TABLE descuentoRol (
    idDescuentoRol INT IDENTITY(1,1) PRIMARY KEY,
    idRolUniversitario INT NOT NULL,
    porcentajeDescuentoRol DECIMAL(5,2) NOT NULL,
    fechaInicioDescuentoRol DATE NOT NULL,
    fechaFinDescuentoRol DATE NOT NULL,
    CONSTRAINT FK_dR_idRolUniversitario FOREIGN KEY (idRolUniversitario) REFERENCES rolUniversitario(idRolUniversitario)
);

CREATE TABLE ordenServicio (
    idOrdenServicio INT IDENTITY(1,1) PRIMARY KEY,
    idCliente INT NOT NULL,
    idRestaurante INT NOT NULL,
    idEstadoServicio INT NOT NULL,
    fechaOrdenServicio DATE NOT NULL,
    horaOrdenServicio TIME(7) NOT NULL,
    horaEntregaOrdenServicio TIME(0) NOT NULL,
    direccionOrdenServicio VARCHAR(250) NOT NULL,
    descricionOrdenServicio VARCHAR(500) NOT NULL,
    estadoPago BIT NOT NULL,
    idMetodoPago INT NOT NULL,
    sumaSubtotal DECIMAL(18,2) NOT NULL,
    idDescuentoRol INT NOT NULL,
    totalCobrado DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_oS_Cliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    CONSTRAINT FK_oS_Restaurante FOREIGN KEY (idRestaurante) REFERENCES restaurante(idRestaurante),
    CONSTRAINT FK_oS_EstadoServicio FOREIGN KEY (idEstadoServicio) REFERENCES estadoServicio(idEstadoServicio),
    CONSTRAINT FK_oS_MetodoPago FOREIGN KEY (idMetodoPago) REFERENCES metodoPago(idMetodoPago),
    CONSTRAINT FK_rD_idDescuentoRol FOREIGN KEY (idDescuentoRol) REFERENCES descuentoRol(idDescuentoRol)
);

CREATE TABLE registroMenu (
    idOrdenServicio INT,
    idMenuBebida INT,
    idPrecioBebida INT,
    idMenuComida INT,
    idPrecioComida INT,
    cantidadRegistroMenu INT NOT NULL,
    subTotalRegistroMenu DECIMAL(18,2),
    CONSTRAINT FK_rM_idOrdenServicio FOREIGN KEY (idOrdenServicio) REFERENCES ordenServicio(idOrdenServicio),
    CONSTRAINT FK_rM_idMenuBebida FOREIGN KEY (idMenuBebida) REFERENCES menuBebida(idMenuBebida),
    CONSTRAINT FK_rM_idPrecioBebida FOREIGN KEY (idPrecioBebida) REFERENCES precioBebida(idPrecioBebida),
    CONSTRAINT FK_rM_idMenuComida FOREIGN KEY (idMenuComida) REFERENCES menuComida(idMenuComida),
    CONSTRAINT FK_rM_idPrecioComida FOREIGN KEY (idPrecioComida) REFERENCES precioComida(idPrecioComida)
);
GO