-- ORDEN 1 - Restaurante 1
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (3, 1, 5, '2025-04-07', '08:15:00', '08:45:00', 'UNIMINUTO SEDE CALLE 80', 'A302', 1, 2, 18000.00, 1, 16200.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(1, 1, 1, 1, 10000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(1, 2, 2, 2, 8000.00);

-- ORDEN 2 - Restaurante 2
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (4, 2, 5, '2025-04-07', '09:00:00', '09:40:00', 'UNIMINUTO SEDE CALLE 80', 'C104', 0, 1, 26000.00, 2, 24700.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(2, 6, 6, 2, 20000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(2, 8, 8, 1, 6000.00);

-- ORDEN 3 - Restaurante 3
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (5, 3, 5, '2025-04-07', '11:10:00', '11:45:00', 'UNIMINUTO SEDE CALLE 80', 'B506', 1, 3, 19000.00, 3, 17100.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(3, 10, 10, 1, 14000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(3, 11, 11, 1, 5000.00);

-- ORDEN 4 - Restaurante 4
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (6, 4, 5, '2025-04-07', '12:20:00', '12:50:00', 'UNIMINUTO SEDE CALLE 80', 'A607', 1, 2, 12000.00, 1, 11400.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(4, 15, 15, 1, 12000.00);

-- ORDEN 5 - Restaurante 1
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (2, 1, 5, '2025-04-07', '13:00:00', '13:30:00', 'UNIMINUTO SEDE CALLE 80', 'C303', 0, 3, 16000.00, 2, 15200.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(5, 3, 3, 2, 16000.00);

-- ORDEN 6 - Restaurante 2
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (8, 2, 5, '2025-04-07', '13:45:00', '14:20:00', 'UNIMINUTO SEDE CALLE 80', 'B112', 1, 1, 22000.00, 1, 20900.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(6, 7, 7, 1, 12000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(6, 5, 5, 2, 10000.00);

-- ORDEN 7 - Restaurante 3
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (1, 3, 5, '2025-04-07', '14:10:00', '14:40:00', 'UNIMINUTO SEDE CALLE 80', 'B204', 1, 2, 18000.00, 2, 17000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(7, 12, 12, 1, 10000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(7, 13, 13, 2, 8000.00);

-- ORDEN 8 - Restaurante 4
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (9, 4, 5, '2025-04-07', '15:00:00', '15:30:00', 'UNIMINUTO SEDE CALLE 80', 'A405', 0, 3, 14000.00, 3, 13300.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(8, 16, 16, 1, 14000.00);

-- ORDEN 9 - Restaurante 1
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (7, 1, 5, '2025-04-07', '15:45:00', '16:15:00', 'UNIMINUTO SEDE CALLE 80', 'C502', 1, 1, 18000.00, 1, 17100.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(9, 2, 2, 1, 10000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(9, 4, 4, 1, 8000.00);

-- ORDEN 10 - Restaurante 2
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (10, 2, 5, '2025-04-07', '16:30:00', '17:00:00', 'UNIMINUTO SEDE CALLE 80', 'B701', 0, 2, 20000.00, 2, 19000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES 
(10, 8, 8, 2, 20000.00);


-------------------------------------------------------------------------------------------------------------------------
-- ORDEN 11 - Restaurante 1
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (1, 1, 5, '2025-04-08', '08:30:00', '09:00:00', 'UNIMINUTO SEDE CALLE 80', 'A204', 1, 1, 18000.00, 1, 17100.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (11, 1, 1, 1, 10000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (11, 2, 2, 1, 8000.00);

-- ORDEN 12 - Restaurante 2
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (2, 2, 5, '2025-04-08', '09:10:00', '09:40:00', 'UNIMINUTO SEDE CALLE 80', 'C307', 0, 2, 14000.00, 2, 13300.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (12, 7, 7, 1, 14000.00);

-- ORDEN 13 - Restaurante 3
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (3, 3, 5, '2025-04-08', '10:15:00', '10:45:00', 'UNIMINUTO SEDE CALLE 80', 'B501', 1, 3, 16000.00, 1, 15200.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (13, 11, 11, 2, 16000.00);

-- ORDEN 14 - Restaurante 4
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (4, 4, 5, '2025-04-08', '11:00:00', '11:30:00', 'UNIMINUTO SEDE CALLE 80', 'A610', 1, 2, 12000.00, 3, 11400.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (14, 16, 16, 1, 12000.00);

-- ORDEN 15 - Restaurante 1
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (5, 1, 5, '2025-04-08', '12:00:00', '12:30:00', 'UNIMINUTO SEDE CALLE 80', 'B207', 0, 1, 10000.00, 2, 9500.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (15, 3, 3, 1, 10000.00);

-- ORDEN 16 - Restaurante 2
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (6, 2, 5, '2025-04-08', '13:00:00', '13:40:00', 'UNIMINUTO SEDE CALLE 80', 'C102', 1, 3, 26000.00, 3, 23400.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (16, 6, 6, 2, 20000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (16, 5, 5, 1, 6000.00);

-- ORDEN 17 - Restaurante 3
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (7, 3, 5, '2025-04-08', '13:50:00', '14:15:00', 'UNIMINUTO SEDE CALLE 80', 'B705', 0, 1, 14000.00, 2, 13300.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (17, 10, 10, 1, 14000.00);

-- ORDEN 18 - Restaurante 4
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (8, 4, 5, '2025-04-08', '14:30:00', '15:00:00', 'UNIMINUTO SEDE CALLE 80', 'A301', 1, 2, 14000.00, 1, 13300.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (18, 15, 15, 1, 14000.00);

-- ORDEN 19 - Restaurante 1
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (9, 1, 5, '2025-04-08', '15:20:00', '15:50:00', 'UNIMINUTO SEDE CALLE 80', 'C405', 1, 1, 16000.00, 2, 15200.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (19, 1, 1, 2, 16000.00);

-- ORDEN 20 - Restaurante 2
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (10, 2, 5, '2025-04-08', '16:00:00', '16:30:00', 'UNIMINUTO SEDE CALLE 80', 'B609', 1, 3, 20000.00, 1, 19000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (20, 8, 8, 2, 20000.00);

-------------------------------------------------------------------------------------------------------------------------
-- ORDEN 21 - Restaurante 1
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (1, 1, 5, '2025-04-09', '08:20:00', '08:45:00', 'UNIMINUTO SEDE CALLE 80', 'B204', 1, 2, 20000.00, 2, 19000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (21, 2, 2, 1, 12000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (21, 3, 3, 1, 8000.00);

-- ORDEN 22 - Restaurante 2
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (2, 2, 5, '2025-04-09', '09:10:00', '09:50:00', 'UNIMINUTO SEDE CALLE 80', 'A311', 0, 3, 14000.00, 1, 13300.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (22, 6, 6, 1, 14000.00);

-- ORDEN 23 - Restaurante 3
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (3, 3, 5, '2025-04-09', '10:00:00', '10:30:00', 'UNIMINUTO SEDE CALLE 80', 'C107', 1, 1, 16000.00, 2, 15200.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (23, 11, 11, 2, 16000.00);

-- ORDEN 24 - Restaurante 4
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (4, 4, 5, '2025-04-09', '10:45:00', '11:15:00', 'UNIMINUTO SEDE CALLE 80', 'A504', 1, 3, 12000.00, 1, 11400.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (24, 13, 13, 1, 12000.00);

-- ORDEN 25 - Restaurante 1
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (5, 1, 5, '2025-04-09', '11:30:00', '12:00:00', 'UNIMINUTO SEDE CALLE 80', 'B702', 0, 2, 10000.00, 3, 9500.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (25, 4, 4, 1, 10000.00);

-- ORDEN 26 - Restaurante 2
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (6, 2, 5, '2025-04-09', '12:30:00', '13:00:00', 'UNIMINUTO SEDE CALLE 80', 'C602', 1, 1, 18000.00, 2, 17100.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (26, 6, 6, 2, 12000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (26, 8, 8, 1, 6000.00);

-- ORDEN 27 - Restaurante 3
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (7, 3, 5, '2025-04-09', '13:30:00', '14:00:00', 'UNIMINUTO SEDE CALLE 80', 'A605', 0, 1, 14000.00, 1, 13300.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (27, 9, 9, 1, 14000.00);

-- ORDEN 28 - Restaurante 4
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (8, 4, 5, '2025-04-09', '14:10:00', '14:45:00', 'UNIMINUTO SEDE CALLE 80', 'C305', 1, 2, 26000.00, 3, 24700.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (28, 14, 14, 2, 24000.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (28, 15, 15, 1, 2000.00);

-- ORDEN 29 - Restaurante 1
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (9, 1, 5, '2025-04-09', '15:00:00', '15:30:00', 'UNIMINUTO SEDE CALLE 80', 'A402', 1, 3, 8000.00, 1, 7600.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuBebida, idPrecioBebida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (29, 4, 4, 1, 8000.00);

-- ORDEN 30 - Restaurante 2
INSERT INTO ordenServicio (idCliente, idRestaurante, idEstadoServicio, fechaOrdenServicio, horaOrdenServicio, horaEntregaOrdenServicio, direccionOrdenServicio, descricionOrdenServicio, estadoPago, idMetodoPago, sumaSubtotal, idDescuentoRol, totalCobrado)
VALUES (10, 2, 5, '2025-04-09', '16:00:00', '16:30:00', 'UNIMINUTO SEDE CALLE 80', 'B111', 0, 2, 12000.00, 2, 11400.00);

INSERT INTO registroMenu (idOrdenServicio, idMenuComida, idPrecioComida, cantidadRegistroMenu, subTotalRegistroMenu)
VALUES (30, 7, 7, 1, 12000.00);

-------------------------------------------------------------------------------------------------------------------------