-- 1. Ha surgido una nuava opción de pago BITCOINS, y todos los restaurantes deben de estar obligados a implementar este metodo de pago

BEGIN TRANSACTION
DECLARE @cantidad INT = 0, @contador INT = 1;
DECLARE @idOpcionPago INT, @idRestaurante INT;
DECLARE @nombreOpcionPago VARCHAR(100) = 'Pago con Bitcoins';

--Inserta nueva opcion de pago
INSERT opcionPago VALUES (@nombreOpcionPago);
-- Capturo el ID del mismo
SELECT @idOpcionPago = idOpcionPago FROM opcionPago WHERE nombreOpcionPago = @nombreOpcionPago;

SELECT @cantidad = COUNT(*) FROM restaurante;

WHILE 1=1
BEGIN
	WITH Numerados AS (SELECT idRestaurante, ROW_NUMBER() OVER (ORDER BY idRestaurante) AS fila FROM restaurante)
	SELECT @idRestaurante = idRestaurante from Numerados WHERE @contador = fila;

	insert metodoPago values (@idRestaurante,@idOpcionPago,'INGRESADO AUTOMATICAMENTE');

	SET @contador = @contador + 1
	
	IF @contador > @cantidad
		BEGIN			
			COMMIT;
			BREAK;
		END
END


---------------------------------------------------------------------------------------------------------------------

-- 2. Se van a aumentar los precios de comidas un 10% hasta encontrarse un un valor superior al límite, se detendrá
BEGIN TRANSACTION
DECLARE @contador int = 1;
DECLARE @idComida INT, @preciComida INT;
DECLARE @precioLimite DECIMAL (18,2) = 12000;

WHILE 1=1
BEGIN
	WITH Numerados AS (SELECT idPrecioComida,precioPrecioComida, ROW_NUMBER() OVER (ORDER BY idPrecioComida) AS fila FROM precioComida)

	SELECT @idComida = idPrecioComida, @preciComida = precioPrecioComida FROM Numerados WHERE fila=@contador;

	IF @preciComida >= @precioLimite
		BEGIN
			PRINT 'Solo actualizo correctamente los precios';
			BREAK;
		END

	UPDATE precioComida SET precioPrecioComida = @preciComida * 1.10 WHERE @idComida = idMenuComida;

	SET @contador = @contador+1
END

COMMIT

---------------------------------------------------------------------------------------------------------------------

-- 3. Existen en registroMenu, se han registrado compras, pero a 0 cantidad, estos datos se desean eliminar

BEGIN TRANSACTION
DECLARE @cantidad INT = 0, @contador INT= 1;
DECLARE @idComida INT, @idPrecioC INT, @idBebida INT, @idPrecioB INT, @idServicio INT;

SELECT @cantidad = count(*) from registroMenu WHERE cantidadRegistroMenu = 0;

WHILE 1=1
BEGIN
	WITH Numerados AS (SELECT  idOrdenServicio, idMenuBebida, idMenuComida, idPrecioComida, idPrecioBebida, ROW_NUMBER() OVER (ORDER BY idOrdenServicio) AS fila FROM registroMenu WHERE cantidadRegistroMenu = 0)
	
	SELECT  @idServicio=idOrdenServicio, @idBebida=idMenuBebida, @idComida=idMenuComida, @idPrecioC=idPrecioComida, @idPrecioB=idPrecioBebida FROM Numerados WHERE @contador = fila

	IF @contador >= @cantidad
		BEGIN
			print 'descanso';
			BREAK;
		END

	DELETE FROM registroMenu WHERE @idServicio=idOrdenServicio AND @idBebida=idMenuBebida AND @idComida=idMenuComida AND @idPrecioC=idPrecioComida AND @idPrecioB=idPrecioBebida;

END
COMMIT

-- NOTA: Ingresar registro menuComida comidas SIN CANTIDAD