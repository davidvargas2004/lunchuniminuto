USE [lunchUniminuto]
GO

INSERT INTO [dbo].[rolUniversitario]
           ([nombreRolUniversitario])
     VALUES
           ('Estudiantes.'),
           ('Docentes.'),
           ('Investigadores.'),
           ('Asistentes de investigadores.'),
           ('Asistentes de docentes.'),
           ('Tutor académico.'),
           ('Administración.'),
           ('Soporte y servicio técnico.'),
           ('Bienestar y comunidad.'),
           ('Apoyo y gestión estudiantil.'),
           ('Egresados.'),
           ('Visitantes.');
GO

INSERT INTO [dbo].[tipoDocumento]
           ([abreviaturaTipoDocumento]
           ,[nombreTipoDocumento])
     VALUES
           ('CC','Cédula de Ciudadanía.'),
           ('CE','Cédula de Extranjería.'),
           ('PAS','Pasaporte.'),
           ('TI','Tarjeta de Identidad.'),
           ('PEP','Permiso Especial de Permanencia.'),
           ('PPT','Permiso por Protección Temporal.');
GO

INSERT INTO [dbo].[cliente]
           ([idTipoDocumento],[nIdentificacionCliente],[nombresCliente],[apellidosCliente],[nCelularCliente],[correoECliente],[direccionCliente],[idRolUniversitario])
     VALUES
           ('1',1001,'Valentina','Ríos','3135829471','valentina.rios@email.com','Calle 72 #14-35',1),
           ('2',1002,'Mateo','González','3137408263','mateo.gonzalez@email.com','Carrera 19 #128-10',8),
           ('4',1003,'Isabella','Torres','3131983054','isabella.torres@email.com','Avenida Carrera 68 #24B-80',2),
           ('3',1004,'Santiago','Mendoza','3134690175','santiago.mendoza@email.com','Transversal 27 #45-90',1),
           ('6',1005,'Camila','Herrera','3136574390','camila.herrera@email.com','Diagonal 54A #20-17',2),
           ('5',1006,'Emiliano','Vargas','3138402751','emiliano.vargas@email.com','Carrera 7 #156-45 Torre 2 Apto 503',8),
           ('1',1007,'Luciana','Castro','3139031842','luciana.castro@email.com','Calle 134 #55-32 Conjunto Altavista',1),
           ('5',1008,'Sebastián','Ramírez','3137265083','sebastian.ramirez@email.com','Avenida Calle 100 #15-60 Piso 6',7),
           ('4',1009,'Antonia','Pérez','3135196408','antonia.perez@email.com','Carrera 50 #26-85 Edificio Nova',7),
           ('2',1010,'Julián','Morales','3136741932','julian.morales@email.com','Diagonal 115B #70C-15 Apto 202',12);          
GO

USE [lunchUniminuto]
GO

INSERT INTO [dbo].[combinacionesDias]
           ([descripcionCombinacionDias])
     VALUES
            ('Lunes'),
            ('Martes'),
            ('Miércoles'),
            ('Jueves'),
            ('Viernes'),
            ('Sábado'),
            ('Domingo'),
            ('Lunes, Martes'),
            ('Lunes, Miércoles'),
            ('Lunes, Jueves'),
            ('Lunes, Viernes'),
            ('Lunes, Sábado'),
            ('Lunes, Domingo'),
            ('Martes, Miércoles'),
            ('Martes, Jueves'),
            ('Martes, Viernes'),
            ('Martes, Sábado'),
            ('Martes, Domingo'),
            ('Miércoles, Jueves'),
            ('Miércoles, Viernes'),
            ('Miércoles, Sábado'),
            ('Miércoles, Domingo'),
            ('Jueves, Viernes'),
            ('Jueves, Sábado'),
            ('Jueves, Domingo'),
            ('Viernes, Sábado'),
            ('Viernes, Domingo'),
            ('Sábado, Domingo'),
            ('Lunes, Martes, Miércoles'),
            ('Lunes, Martes, Jueves'),
            ('Lunes, Martes, Viernes'),
            ('Lunes, Martes, Sábado'),
            ('Lunes, Martes, Domingo'),
            ('Lunes, Miércoles, Jueves'),
            ('Lunes, Miércoles, Viernes'),
            ('Lunes, Miércoles, Sábado'),
            ('Lunes, Miércoles, Domingo'),
            ('Lunes, Jueves, Viernes'),
            ('Lunes, Jueves, Sábado'),
            ('Lunes, Jueves, Domingo'),
            ('Lunes, Viernes, Sábado'),
            ('Lunes, Viernes, Domingo'),
            ('Lunes, Sábado, Domingo'),
            ('Martes, Miércoles, Jueves'),
            ('Martes, Miércoles, Viernes'),
            ('Martes, Miércoles, Sábado'),
            ('Martes, Miércoles, Domingo'),
            ('Martes, Jueves, Viernes'),
            ('Martes, Jueves, Sábado'),
            ('Martes, Jueves, Domingo'),
            ('Martes, Viernes, Sábado'),
            ('Martes, Viernes, Domingo'),
            ('Martes, Sábado, Domingo'),
            ('Miércoles, Jueves, Viernes'),
            ('Miércoles, Jueves, Sábado'),
            ('Miércoles, Jueves, Domingo'),
            ('Miércoles, Viernes, Sábado'),
            ('Miércoles, Viernes, Domingo'),
            ('Miércoles, Sábado, Domingo'),
            ('Jueves, Viernes, Sábado'),
            ('Jueves, Viernes, Domingo'),
            ('Jueves, Sábado, Domingo'),
            ('Viernes, Sábado, Domingo'),
            ('Lunes, Martes, Miércoles, Jueves'),
            ('Lunes, Martes, Miércoles, Viernes'),
            ('Lunes, Martes, Miércoles, Sábado'),
            ('Lunes, Martes, Miércoles, Domingo'),
            ('Lunes, Martes, Jueves, Viernes'),
            ('Lunes, Martes, Jueves, Sábado'),
            ('Lunes, Martes, Jueves, Domingo'),
            ('Lunes, Martes, Viernes, Sábado'),
            ('Lunes, Martes, Viernes, Domingo'),
            ('Lunes, Martes, Sábado, Domingo'),
            ('Lunes, Miércoles, Jueves, Viernes'),
            ('Lunes, Miércoles, Jueves, Sábado'),
            ('Lunes, Miércoles, Jueves, Domingo'),
            ('Lunes, Miércoles, Viernes, Sábado'),
            ('Lunes, Miércoles, Viernes, Domingo'),
            ('Lunes, Miércoles, Sábado, Domingo'),
            ('Lunes, Jueves, Viernes, Sábado'),
            ('Lunes, Jueves, Viernes, Domingo'),
            ('Lunes, Jueves, Sábado, Domingo'),
            ('Lunes, Viernes, Sábado, Domingo'),
            ('Martes, Miércoles, Jueves, Viernes'),
            ('Martes, Miércoles, Jueves, Sábado'),
            ('Martes, Miércoles, Jueves, Domingo'),
            ('Martes, Miércoles, Viernes, Sábado'),
            ('Martes, Miércoles, Viernes, Domingo'),
            ('Martes, Miércoles, Sábado, Domingo'),
            ('Martes, Jueves, Viernes, Sábado'),
            ('Martes, Jueves, Viernes, Domingo'),
            ('Martes, Jueves, Sábado, Domingo'),
            ('Martes, Viernes, Sábado, Domingo'),
            ('Miércoles, Jueves, Viernes, Sábado'),
            ('Miércoles, Jueves, Viernes, Domingo'),
            ('Miércoles, Jueves, Sábado, Domingo'),
            ('Miércoles, Viernes, Sábado, Domingo'),
            ('Jueves, Viernes, Sábado, Domingo'),
            ('Lunes, Martes, Miércoles, Jueves, Viernes'),
            ('Lunes, Martes, Miércoles, Jueves, Sábado'),
            ('Lunes, Martes, Miércoles, Jueves, Domingo'),
            ('Lunes, Martes, Miércoles, Viernes, Sábado'),
            ('Lunes, Martes, Miércoles, Viernes, Domingo'),
            ('Lunes, Martes, Miércoles, Sábado, Domingo'),
            ('Lunes, Martes, Jueves, Viernes, Sábado'),
            ('Lunes, Martes, Jueves, Viernes, Domingo'),
            ('Lunes, Martes, Jueves, Sábado, Domingo'),
            ('Lunes, Martes, Viernes, Sábado, Domingo'),
            ('Lunes, Miércoles, Jueves, Viernes, Sábado'),
            ('Lunes, Miércoles, Jueves, Viernes, Domingo'),
            ('Lunes, Miércoles, Jueves, Sábado, Domingo'),
            ('Lunes, Miércoles, Viernes, Sábado, Domingo'),
            ('Lunes, Jueves, Viernes, Sábado, Domingo'),
            ('Martes, Miércoles, Jueves, Viernes, Sábado'),
            ('Martes, Miércoles, Jueves, Viernes, Domingo'),
            ('Martes, Miércoles, Jueves, Sábado, Domingo'),
            ('Martes, Miércoles, Viernes, Sábado, Domingo'),
            ('Martes, Jueves, Viernes, Sábado, Domingo'),
            ('Miércoles, Jueves, Viernes, Sábado, Domingo'),
            ('Lunes, Martes, Miércoles, Jueves, Viernes, Sábado'),
            ('Lunes, Martes, Miércoles, Jueves, Viernes, Domingo'),
            ('Lunes, Martes, Miércoles, Jueves, Sábado, Domingo'),
            ('Lunes, Martes, Miércoles, Viernes, Sábado, Domingo'),
            ('Lunes, Martes, Jueves, Viernes, Sábado, Domingo'),
            ('Lunes, Miércoles, Jueves, Viernes, Sábado, Domingo'),
            ('Martes, Miércoles, Jueves, Viernes, Sábado, Domingo'),
            ('Lunes, Martes, Miércoles, Jueves, Viernes, Sábado, Domingo');    
GO

USE [lunchUniminuto]
GO

INSERT INTO [dbo].[restaurante]
           ([nIdentificacionRestaurante],[nombreRestaurante],[nCelularRestaurante],[correoERestaurante],[direccionRestaurante],[disponibilidadRestaurante],[horaAperturaRestaurante],[horaCierreRestaurante])
     VALUES
           ('900384729','Sazón de la Abuela','3158409273','sazon.abuela@restaurante.com','Calle 80 #72-14 Local 101',99,'07:00:00','16:59:59'),
           ('901627384','La Cosecha Criolla','3156732048','cosecha.criolla@restaurante.com','Avenida Calle 80 #96-32 Piso 2',84,'07:00:00','16:59:59'),
           ('900915246','Mr. Crunch Burgers','3152901865','fogon.altillo@restaurante.com','Calle 80 #45-88 Edificio Portal Oeste Apto 204',84,'12:00:00','20:59:59'),
           ('901038175','El Fogón del Altillo','3157594301','mrcrunch.burgers@fastfood.com','Calle 80 #28C-17 Local 5 Centro Comercial El Portal',127,'13:00:00','23:59:59');
GO

INSERT INTO [dbo].[opcionPago]
           ([nombreOpcionPago])
     VALUES
           ('Nequi'),
           ('Daviplata'),
           ('Bancolombia'),
           ('Tarjeta debido/Credito'),
           ('PSE'),
           ('Efectivo');
GO

INSERT INTO [dbo].[metodoPago]
           ([idRestaurante],[idOpcionPago],[descripcionMetodoPago])
     VALUES
           (1,6,'Disponer del dinero sencillo en la medida de lo posible'),
           (2,6,'Disponer del dinero sencillo en la medida de lo posible'),
           (3,6,'Disponer del dinero sencillo en la medida de lo posible'),
           (4,6,'Disponer del dinero sencillo en la medida de lo posible'),
           (1,1,'Realizar la consignación a la siguiente cuenta NEQUI: 3158409273'),
           (2,1,'Realizar la consignación a la siguiente cuenta NEQUI: 3156732048'),
           (3,2,'Realizar la consignación a la siguiente cuenta Daviplata: 3152901865'),
           (4,2,'Realizar la consignación a la siguiente cuenta Daviplata: 3157594301'),
           (1,3,'Realizar la consignación a la siguiente cuenta Bancolombia: 1010 1010 1010'),
           (2,3,'Realizar la consignación a la siguiente cuenta Bancolombia: 1010 1010 1011'),
           (3,4,'Tener a la mano la tarjeta de crédito lista, en el momento de la entrega se deberá realizar el pago'),
           (4,5,'Realizar el pago mediante el siguiente enlace: WWW.PSE.COM/PagoAlFogon');
GO

INSERT INTO [dbo].[categoriaComida]
           ([nombreCategoriaComida],[descripcionCategoriaComida])
     VALUES
           ('Desayuno','Primera comida del día, se toma en la mañana.'),
           ('Almuerzo','Comida principal del día, normalmente entre 12:00 p.m. y 2:00 p.m.'),
           ('Cena','Última comida del día, usualmente ligera y tomada en la noche, entre 6:00 p.m. y 9:00 p.m.'),
           ('Media mañana','Refrigerio entre el desayuno y el almuerzo.'),
           ('Media tarde','Refrigerio entre el almuerzo y la cena, tomado a media tarde.'),
           ('Refrigerio nocturno','Refrigerio antes de dormir. Algo muy ligero, como una bebida caliente o panecillos.');
GO

------------------------------------------------------------------------------------------------------------------------------------------------
----------                       MENU COMIDAS                                                                                         ----------
------------------------------------------------------------------------------------------------------------------------------------------------


---------------------- 
--Sazón de la Abuela--
----------------------
-- Desayuno
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (1, 'Huevos al gusto', 'Huevos revueltos, fritos o pericos con arepa', 99, 1),
        (1, 'Caldo con pan', 'Caldo de costilla con pan y bebida caliente', 99, 1),
        (1, 'Tamal con chocolate', 'Tamal tolimense acompañado de chocolate', 99, 1),
        (1, 'Desayuno criollo', 'Huevos, carne en bistec, arepa y jugo natural', 99, 1);

-- Media Mañana
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (1, 'Empanada con ají', 'Empanada de carne con ají casero', 99, 4),
        (1, 'Pan con queso y chocolate', 'Pan de queso caliente con bebida', 99, 4),
        (1, 'Arepa rellena', 'Arepa con queso y jamón fundido', 99, 4),
        (1, 'Mini sándwich', 'Sándwich de jamón y queso con jugo', 99, 4);

-- Almuerzo
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (1, 'Bandeja paisa', 'Plato típico con frijoles, arroz, carne, huevo y más', 99, 2),
        (1, 'Sopa y seco', 'Sopa del día con carne, arroz, ensalada y jugo', 99, 2),
        (1, 'Arroz con pollo', 'Acompañado de ensalada y papa', 99, 2),
        (1, 'Chuleta valluna', 'Carne apanada con arroz y patacón', 99, 2);

-- Media Tarde
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (1, 'Café con almojábana', 'Café caliente y almojábana', 99, 5),
        (1, 'Chocolate con pan', 'Bebida caliente con pan artesanal', 99, 5),
        (1, 'Mazorca desgranada', 'Con queso, salsas y tocineta', 99, 5),
        (1, 'Arepa de chócolo', 'Con queso y mantequilla', 99, 5);

-- Precio de comida (última fecha de actualización: 2025-04-06)
INSERT INTO precioComida (idMenuComida, fechaActualizacionPrecioComida, precioPrecioComida)
    VALUES
        (1, '2025-04-06', 9500),
        (2, '2025-04-06', 8500),
        (3, '2025-04-06', 10000),
        (4, '2025-04-06', 11000),
        (5, '2025-04-06', 5000),
        (6, '2025-04-06', 4800),
        (7, '2025-04-06', 6000),
        (8, '2025-04-06', 5500),
        (9, '2025-04-06', 13500),
        (10, '2025-04-06', 12000),
        (11, '2025-04-06', 11000),
        (12, '2025-04-06', 12500),
        (13, '2025-04-06', 4000),
        (14, '2025-04-06', 4200),
        (15, '2025-04-06', 8000),
        (16, '2025-04-06', 7500);
GO

-- Desayuno
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (1, 'Chocolate caliente', 'Chocolate espeso preparado con leche', 99, 1),
        (1, 'Café con leche', 'Café suave con leche caliente', 99, 1),
        (1, 'Avena caliente', 'Bebida de avena con canela', 99, 1),
        (1, 'Agua de panela con queso', 'Típica bebida colombiana con queso campesino', 99, 1);

-- Media Mañana
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (1, 'Jugo de naranja natural', 'Jugo fresco exprimido al momento', 99, 4),
        (1, 'Té frío de limón', 'Refrescante bebida con hielo', 99, 4),
        (1, 'Jugo de mango', 'Natural y sin azúcar añadida', 99, 4),
        (1, 'Malteada de fresa', 'Bebida cremosa con fruta natural', 99, 4);

-- Almuerzo
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (1, 'Jugo de guayaba', 'Natural, servido con el almuerzo del día', 99, 2),
        (1, 'Jugo de mora', 'Hecho en agua o leche según preferencia', 99, 2),
        (1, 'Limonada natural', 'Limonada casera con toque de menta', 99, 2),
        (1, 'Refresco de maracuyá', 'Bebida tropical con hielo', 99, 2);

-- Media Tarde
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (1, 'Tinto', 'Café negro tradicional', 99, 5),
        (1, 'Chocolate con canela', 'Espeso y aromático', 99, 5),
        (1, 'Aguapanela con limón', 'Ideal para la tarde', 99, 5),
        (1, 'Jugo de lulo', 'Cítrico y refrescante', 99, 5);

-- Precio de bebidas (última fecha de actualización: 2025-04-06)
INSERT INTO precioBebida (idMenuBebida, fechaActualizacionPrecioBebida, precioPrecioBebida)
    VALUES
        (1, '2025-04-06', 3000),
        (2, '2025-04-06', 2800),
        (3, '2025-04-06', 3200),
        (4, '2025-04-06', 3500),
        (5, '2025-04-06', 4500),
        (6, '2025-04-06', 4000),
        (7, '2025-04-06', 5000),
        (8, '2025-04-06', 5500),
        (9, '2025-04-06', 3200),
        (10, '2025-04-06', 3000),
        (11, '2025-04-06', 3400),
        (12, '2025-04-06', 3500),
        (13, '2025-04-06', 2000),
        (14, '2025-04-06', 2500),
        (15, '2025-04-06', 2700),
        (16, '2025-04-06', 3200);
GO

---------------------- 
--La Cosecha Criolla--
----------------------
-- Desayuno
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (2, 'Calentado paisa', 'Arroz con fríjoles, huevo frito y arepa', 84, 1),
        (2, 'Arepa con queso', 'Arepa asada rellena de queso campesino', 84, 1),
        (2, 'Tamal santandereano', 'Tamal envuelto con carne de cerdo y pollo', 84, 1),
        (2, 'Huevos pericos con pan', 'Huevos revueltos con cebolla y tomate, acompañado de pan', 84, 1);

-- Media Mañana
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (2, 'Empanadas de carne', 'Fritas y acompañadas de ají casero', 84, 4),
        (2, 'Arepa boyacense', 'Dulce y de maíz amarillo', 84, 4),
        (2, 'Tostadas con mantequilla', 'Pan campesino con mantequilla derretida', 84, 4),
        (2, 'Torta de banano', 'Porción individual casera', 84, 4);

-- Almuerzo
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (2, 'Bandeja criolla', 'Arroz, papa criolla, carne a la plancha, ensalada', 84, 2),
        (2, 'Sudado de pollo', 'Con yuca, arroz y aguacate', 84, 2),
        (2, 'Chuleta valluna', 'Acompañada de arroz, tajadas y ensalada', 84, 2),
        (2, 'Sopa del día con seco', 'Opción vegetariana o tradicional', 84, 2);

-- Media Tarde
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (2, 'Almojábana con bocadillo', 'Repostería horneada con dulce típico', 84, 5),
        (2, 'Croissant de jamón y queso', 'Horneado, ideal para merienda', 84, 5),
        (2, 'Pastel de pollo', 'Relleno jugoso y masa crocante', 84, 5),
        (2, 'Pan de yuca', 'Ligero y esponjoso', 84, 5);

-- Precio de comida (última fecha de actualización: 2025-04-06)
INSERT INTO precioComida (idMenuComida, fechaActualizacionPrecioComida, precioPrecioComida)
    VALUES
        (17, '2025-04-06', 7500),
        (18, '2025-04-06', 6000),
        (19, '2025-04-06', 8000),
        (20, '2025-04-06', 6500),
        (21, '2025-04-06', 5500),
        (22, '2025-04-06', 5200),
        (23, '2025-04-06', 5000),
        (24, '2025-04-06', 5700),
        (25, '2025-04-06', 12000),
        (26, '2025-04-06', 11000),
        (27, '2025-04-06', 11500),
        (28, '2025-04-06', 10500),
        (29, '2025-04-06', 5000),
        (30, '2025-04-06', 5200),
        (31, '2025-04-06', 5300),
        (32, '2025-04-06', 5000);
GO

-- Desayuno
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (2, 'Aromática de frutas', 'Infusión caliente con mezcla de frutas naturales', 84, 1),
        (2, 'Café campesino', 'Café fuerte con panela', 84, 1),
        (2, 'Chocolate espumoso', 'Tradicional, preparado con molinillo', 84, 1),
        (2, 'Leche caliente con miel', 'Ideal para empezar el día', 84, 1);

-- Media Mañana
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (2, 'Jugo de piña', 'Refrescante y natural', 84, 4),
        (2, 'Limonada de panela', 'Energética y típica colombiana', 84, 4),
        (2, 'Jugo de papaya', 'Digestivo y suave', 84, 4),
        (2, 'Refresco de hierbabuena', 'Ligero toque herbal', 84, 4);

-- Almuerzo
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (2, 'Jugo de tomate de árbol', 'Servido con almuerzos típicos', 84, 2),
        (2, 'Refajo', 'Mezcla de gaseosa y cerveza, sin alcohol', 84, 2),
        (2, 'Jugo de guanábana', 'Natural, en agua o leche', 84, 2),
        (2, 'Limonada cerezada', 'Con toque dulce', 84, 2);

-- Media Tarde
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (2, 'Té verde', 'Suave y saludable', 84, 5),
        (2, 'Chocolate con queso', 'Tradicional merienda campesina', 84, 5),
        (2, 'Café con especias', 'Café negro con clavos y canela', 84, 5),
        (2, 'Batido de banano', 'Dulce y cremoso', 84, 5);

-- Precio de Bebida (última fecha de actualización: 2025-04-06)
INSERT INTO precioBebida (idMenuBebida, fechaActualizacionPrecioBebida, precioPrecioBebida)
    VALUES
        (17, '2025-04-06', 3500),
        (18, '2025-04-06', 3000),
        (19, '2025-04-06', 3300),
        (20, '2025-04-06', 3200),
        (21, '2025-04-06', 4000),
        (22, '2025-04-06', 3700),
        (23, '2025-04-06', 3900),
        (24, '2025-04-06', 3600),
        (25, '2025-04-06', 4100),
        (26, '2025-04-06', 4200),
        (27, '2025-04-06', 4500),
        (28, '2025-04-06', 4300),
        (29, '2025-04-06', 2800),
        (30, '2025-04-06', 3500),
        (31, '2025-04-06', 3400),
        (32, '2025-04-06', 3600);
GO


---------------------- 
--Mr. Crunch Burgers--
----------------------
-- Almuerzo
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (3, 'Burger Crunch BBQ', 'Hamburguesa con carne a la parrilla, tocineta y salsa BBQ', 84, 2),
        (3, 'Doble Crunch Burger', 'Doble carne, doble queso y cebolla crocante', 84, 2),
        (3, 'Pollo Crispy Combo', 'Sandwich de pollo crocante con papas y gaseosa', 84, 2),
        (3, 'Cheeseburger Classic', 'Carne de res, queso americano, pan brioche', 84, 2);

-- Media Tarde
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (3, 'Nuggets con salsa miel mostaza', '6 unidades acompañadas de salsas', 84, 5),
        (3, 'Papas gratinadas', 'Con queso fundido y tocineta', 84, 5),
        (3, 'Wrap de pollo', 'Ligero, con vegetales frescos', 84, 5),
        (3, 'Tiras deollo', 'Empanizadas y crujientes', 84, 5);

-- Cena
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (3, 'Hamburguesa vegetariana', 'Con portobello, queso suizo y vegetales', 84, 3),
        (3, 'Perro caliente americano', 'Salchicha, cebolla, queso, salsas', 84, 3),
        (3, 'Ensalada Caesar con pollo', 'Fresca y ligera, con aderezo tradicional', 84, 3),
        (3, 'Combo nocturno', 'Hamburguesa sencilla + papas + bebida pequeña', 84, 3);

-- Precio de Comida (última fecha de actualización: 2025-04-06)
INSERT INTO precioComida (idMenuComida, fechaActualizacionPrecioComida, precioPrecioComida)
    VALUES
        (33, '2025-04-06', 14500),
        (34, '2025-04-06', 16500),
        (35, '2025-04-06', 13500),
        (36, '2025-04-06', 12500),
        (37, '2025-04-06', 7500),
        (38, '2025-04-06', 8900),
        (39, '2025-04-06', 9800),
        (40, '2025-04-06', 8700),
        (41, '2025-04-06', 11000),
        (42, '2025-04-06', 9500),
        (43, '2025-04-06', 10000),
        (44, '2025-04-06', 10500);
GO

-- Almuerzo
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (3, 'Gaseosa Cola 400ml', 'Bebida gaseosa sabor cola, presentación personal', 84, 2),
        (3, 'Gaseosa Limón 400ml', 'Refresco sabor limón, ideal para acompañar comidas', 84, 2),
        (3, 'Jugo de mango', 'Natural, endulzado, servido frío', 84, 2),
        (3, 'Agua con gas', 'Agua mineral con gas, presentación personal', 84, 2);

-- Media Tarde
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (3, 'Malteada de vainilla', 'Batido espeso con helado de vainilla', 84, 5),
        (3, 'Café americano', 'Taza caliente, sin azúcar añadida', 84, 5),
        (3, 'Limonada natural', 'Refrescante, servida con hielo', 84, 5),
        (3, 'Té frío de durazno', 'Infusión helada, ligeramente dulce', 84, 5);

-- Cena
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (3, 'Cerveza sin alcohol', 'Bebida tipo lager sin contenido alcohólico', 84, 3),
        (3, 'Agua saborizada', 'Con toque de limón y menta', 84, 3),
        (3, 'Jugo de maracuyá', 'Natural, servido frío', 84, 3),
        (3, 'Té caliente', 'Infusión de manzanilla o hierbabuena', 84, 3);

-- Precio de Bebida (última fecha de actualización: 2025-04-06)
INSERT INTO precioBebida (idMenuBebida, fechaActualizacionPrecioBebida, precioPrecioBebida)
    VALUES
        (25, '2025-04-06', 4500),
        (26, '2025-04-06', 4500),
        (27, '2025-04-06', 5200),
        (28, '2025-04-06', 4000),
        (29, '2025-04-06', 7000),
        (30, '2025-04-06', 3000),
        (31, '2025-04-06', 4800),
        (32, '2025-04-06', 5000),
        (33, '2025-04-06', 6500),
        (34, '2025-04-06', 4500),
        (35, '2025-04-06', 5200),
        (36, '2025-04-06', 3000);
GO


------------------------
--El Fogón del Altillo--
------------------------
-- Almuerzo
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (4, 'Pechuga gratinada', 'Pechuga de pollo al horno con queso derretido', 127, 2),
        (4, 'Arroz con camarones', 'Arroz salteado con camarones y vegetales', 127, 2),
        (4, 'Chuleta valluna', 'Filete de cerdo apanado acompañado de arroz y ensalada', 127, 2),
        (4, 'Lentejas con chorizo', 'Sopa espesa de lentejas con chorizo criollo', 127, 2);

-- Cena
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (4, 'Sopa de verduras', 'Sopa ligera con variedad de verduras frescas', 127, 3),
        (4, 'Arepa con hogao', 'Arepa blanca acompañada de hogao criollo', 127, 3),
        (4, 'Wrap de pollo', 'Tortilla rellena de pollo con vegetales y salsas', 127, 3),
        (4, 'Crema de champiñones', 'Crema espesa de champiñones con tostadas', 127, 3);

-- Media Tarde
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (4, 'Muffin de chocolate', 'Ponqué suave con chispas de chocolate', 127, 5),
        (4, 'Pan de yuca', 'Bocados de almidón horneados con queso', 127, 5),
        (4, 'Tostadas francesas', 'Pan frito en mezcla de huevo, leche y canela', 127, 5),
        (4, 'Mini empanadas', 'Empanaditas rellenas de carne o pollo', 127, 5);

-- Refrigerio nocturno
INSERT INTO menuComida (idRestaurante, nombreMenuComida, descripcionMenuComida, disponibilidadMenuComida, idCategoriaComida)
    VALUES
        (4, 'Chocolate caliente', 'Bebida caliente a base de cacao con leche', 127, 6),
        (4, 'Tamal ligero', 'Tamal pequeño con ingredientes suaves', 127, 6),
        (4, 'Sandwich de jamón', 'Pan tajado con jamón y queso', 127, 6),
        (4, 'Arepa rellena de huevo', 'Arepa frita con huevo en su interior', 127, 6);

-- Precios para comidas (última fecha de actualización: 2025-04-06)
INSERT INTO precioComida (idMenuComida, fechaActualizacionPrecioComida, precioPrecioComida)
    VALUES
        (45, '2025-04-06', 13500),
        (46, '2025-04-06', 14500),
        (47, '2025-04-06', 13000),
        (48, '2025-04-06', 12000),
        (49, '2025-04-06', 9500),
        (50, '2025-04-06', 7000),
        (51, '2025-04-06', 11000),
        (52, '2025-04-06', 10500),
        (53, '2025-04-06', 4500),
        (54, '2025-04-06', 4000),
        (55, '2025-04-06', 5000),
        (56, '2025-04-06', 5200),
        (57, '2025-04-06', 3500),
        (58, '2025-04-06', 6000),
        (59, '2025-04-06', 6500),
        (60, '2025-04-06', 7000);
GO

-- Almuerzo
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (4, 'Jugo de mora', 'Jugo natural de mora con agua o leche', 127, 2),
        (4, 'Jugo de guanábana', 'Bebida espesa a base de guanábana fresca', 127, 2),
        (4, 'Agua de panela con limón', 'Tradicional bebida dulce con limón', 127, 2),
        (4, 'Limonada natural', 'Limonada fría con hielo y azúcar al gusto', 127, 2);

-- Cena
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (4, 'Agua con gas', 'Botella de agua con gas fría', 127, 3),
        (4, 'Vino tinto sin alcohol', 'Copa de vino sin alcohol ideal para cena', 127, 3),
        (4, 'Té de frutos rojos', 'Infusión de frutas servida caliente', 127, 3),
        (4, 'Jugo de mandarina', 'Jugo cítrico y refrescante', 127, 3);

-- Media Tarde
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (4, 'Té verde', 'Infusión caliente de té verde natural', 127, 5),
        (4, 'Jugo de mango', 'Jugo natural de mango con hielo', 127, 5),
        (4, 'Café negro', 'Taza de café colombiano sin azúcar', 127, 5),
        (4, 'Leche achocolatada', 'Leche fría con chocolate en polvo', 127, 5);

-- Refrigerio nocturno
INSERT INTO menuBebida (idRestaurante, nombreMenuBebida, descripcionMenuBebida, disponibilidadMenuBebida, idCategoriaComida)
    VALUES
        (4, 'Chocolate caliente', 'Bebida caliente de cacao y leche', 127, 6),
        (4, 'Té de manzanilla', 'Té calmante ideal antes de dormir', 127, 6),
        (4, 'Avena caliente', 'Avena en leche espesa y dulce', 127, 6),
        (4, 'Leche caliente', 'Vaso de leche tibia sin azúcar', 127, 6);

-- Precios para comidas (última fecha de actualización: 2025-04-06)
INSERT INTO precioBebida (idMenuBebida, fechaActualizacionPrecioBebida, precioPrecioBebida)
    VALUES
        (45, '2025-04-06', 5000),
        (46, '2025-04-06', 5500),
        (47, '2025-04-06', 4000),
        (48, '2025-04-06', 4500),
        (49, '2025-04-06', 3500),
        (50, '2025-04-06', 6000),
        (51, '2025-04-06', 5200),
        (52, '2025-04-06', 5000),
        (53, '2025-04-06', 3500),
        (54, '2025-04-06', 5200),
        (55, '2025-04-06', 2800),
        (56, '2025-04-06', 4800),
        (57, '2025-04-06', 5500),
        (58, '2025-04-06', 4700),
        (59, '2025-04-06', 5000),
        (60, '2025-04-06', 4000);
GO

------------------------------------------------------------------------------------------------------------------------------------------------
----------            FIN MENU   MENU COMIDAS                                                                                         ----------
------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[estadoServicio]
           ([nombreEstadoServicio],[descripcionEstadoServicio])
     VALUES
           ('Pendiente','La orden ha sido registrada pero aún no se ha comenzado a preparar.'),
           ('Preparando','El restaurante está cocinando y alistando los productos solicitados.'),
           ('En camino','El pedido está siendo transportado hacia el cliente.'),
           ('Entregado','El pedido ha llegado al cliente.'),
           ('Finalizado','El proceso fue exitoso y la orden se completó satisfactoriamente.'),
           ('Cancelado','La orden fue anulada por el cliente o por el restaurante.');
GO

INSERT INTO [dbo].[descuentoRol]
           ([idRolUniversitario],[porcentajeDescuentoRol],[fechaInicioDescuentoRol],[fechaFinDescuentoRol])
     VALUES
           (1,0.150,'2025-04-06','2025-04-10'),
           (2,0.100,'2025-04-06','2025-04-10'),
           (7,0.050,'2025-04-06','2025-04-10'),
           (8,0.050,'2025-04-06','2025-04-10'),
           (12,0.001,'2025-04-06','2025-04-10');
GO
