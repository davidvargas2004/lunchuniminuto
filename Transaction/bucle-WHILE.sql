-- 1. El restaurante ha realizado una petición, es el incrementar un 10% de los precios de las comidas y bebidas.

BEGIN TRANSACTION
DECLARE @categoria INT, @total INT;
DECLARE @contador INT = 1;
DECLARE @idMenuComida INT, @precioActualizar INT;

SELECT @categoria = idCategoriaComida FROM categoriaComida WHERE nombreCategoriaComida = 'Almuerzo';

SELECT @total = count(*) FROM menuComida a Inner Join precioComida b ON b.idMenuComida = a.idMenuComida WHERE a.idCategoriaComida = @categoria;

WHILE @contador <= @total
BEGIN
	
	WITH Numerados AS (
			SELECT b.idMenuComida, b.precioPrecioComida, fechaActualizacionPrecioComida, ROW_NUMBER() OVER (ORDER BY b.idMenuComida) AS fila
			FROM menuComida a Inner Join precioComida b ON b.idMenuComida = a.idMenuComida 
			WHERE a.idCategoriaComida = @categoria)

	SELECT @idMenuComida = idMenuComida, @precioActualizar = precioPrecioComida FROM Numerados WHERE @contador = fila;

	UPDATE precioComida SET precioPrecioComida = @precioActualizar *1.10 WHERE idPrecioComida = @idMenuComida;

	SET @contador = @contador + 1;
END

SET @contador = @contador - 1;

IF @contador = @total
	begin
	PRINT 'Si ha guardado la información de manera correcta';
	COMMIT;
	end
ELSE
	begin
	PRINT 'No se puede guardar cambios'
	ROLLBACK;
	RETURN;
	end

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. los restaurantes han registrado Bebidas, pero no han asignado sus respectivos precios, se debe de corregir el estado a NO DISPONIBLE

BEGIN TRANSACTION

DECLARE @idDisponibilidadNODISPONIBLE INT;
DECLARE @contador1 INT = 1;
DECLARE @cantidad1 INT = 0;
DECLARE @idMenuBebida INT;

SELECT @idDisponibilidadNODISPONIBLE = idCombinacionesDias FROM combinacionesDias WHERE descripcionCombinacionDias = 'NO DISPONIBLE';

SELECT @cantidad1 = count (*) 
FROM menuBebida a LEFT JOIN precioBebida b ON b.idMenuBebida = a.idMenuBebida
WHERE b.precioPrecioBebida IS NULL;

WHILE @contador1 <= @cantidad1
BEGIN

	WITH Numerados AS(
	SELECT a.idMenuBebida, a.disponibilidadMenuBebida, ROW_NUMBER() OVER (ORDER BY a.idMenuBebida) AS fila
	FROM menuBebida a LEFT JOIN precioBebida b ON b.idMenuBebida = a.idMenuBebida
	WHERE b.precioPrecioBebida IS NULL)

	SELECT @idMenuBebida = idMenuBebida FROM Numerados WHERE @contador1 = fila;

	UPDATE menuBebida SET disponibilidadMenuBebida = @idDisponibilidadNODISPONIBLE WHERE @idMenuBebida = idMenuBebida;

	SET @contador1 = @contador1+1
END

SET @contador1 = @contador1-1;

IF @contador1 = @cantidad1
	begin
	PRINT 'Si ha guardado la información de manera correcta';
	COMMIT;
	end
ELSE
	begin
	PRINT 'No se puede guardar cambios'
	ROLLBACK;
	RETURN;
	end


-----------------------------------------------------------------------------------------------------------------------------------------------------
-- 3. Existen vairos restaurantes que se han registrado, pero no han indicado ninguno de sus medios de pago, el sistema debera crear un metodo a cada 
--    restaurante este sera por defecto EFECTIVO

BEGIN TRANSACTION

DECLARE @idOpcionPago INT, @idRestaurante INT;
DECLARE @contador1 INT = 1;
DECLARE @cantidad1 INT = 0;

SELECT @idOpcionPago = idOpcionPago FROM opcionPago WHERE nombreOpcionPago = 'Efectivo';

SELECT @cantidad1 = count(*) FROM metodoPago a RIGHT JOIN restaurante b ON b.idRestaurante = a.idRestaurante WHERE a.idOpcionPago IS NULL;

WHILE @contador1 <= @cantidad1
BEGIN
	WITH Numerados AS (
	SELECT b.idRestaurante, ROW_NUMBER() OVER (ORDER BY a.idRestaurante) AS fila 
	FROM metodoPago a RIGHT JOIN restaurante b ON b.idRestaurante = a.idRestaurante 
	WHERE a.idOpcionPago IS NULL)

	SELECT @idRestaurante = idRestaurante FROM Numerados WHERE @contador1 = fila;

	INSERT INTO [dbo].[metodoPago]
           ([idRestaurante]
           ,[idOpcionPago]
           ,[descripcionMetodoPago])
     VALUES
           (@idRestaurante
           ,@idOpcionPago
           ,'TENER SENCILLO')

	SET @contador1 = @contador1 +1
END

SET @contador1 = @contador1-1;

IF @contador1 = @cantidad1
	begin
	PRINT 'Si ha guardado la información de manera correcta';
	COMMIT
	RETURN;
	end
ELSE
	begin
	PRINT 'No se puede guardar cambios'
	ROLLBACK;
	RETURN;
	end


-- NOTA: Insertar restaurante sin metodo de pago.