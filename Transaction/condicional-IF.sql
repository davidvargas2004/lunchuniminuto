-- 1. El cliente solicita ser dado de baja del sistema ya que indica a pesar de registrarse en el, no lo ha usado en ningun momento 

BEGIN TRANSACTION;

DECLARE @idCliente INT = ; -- ID del cliente a eliminar
DECLARE @existenciaCliente INT;
DECLARE @nombres VARCHAR(200);
DECLARE @tieneOrdenes INT;

-- Consulta para validar la existencia del cliente
SELECT @existenciaCliente = count(*)
FROM cliente
WHERE @idCliente=idCliente;

-- Toma de decision
if @existenciaCliente > 0
BEGIN
	-- Capturo los nombres del cliente
	SELECT @nombres = CONCAT(nombresCliente,' ',apellidosCliente)
	FROM cliente
	WHERE @idCliente = idCliente;

	-- Si existe el cliente, notificara de su existencia
	PRINT 'El cliente con id '+CONVERT(VARCHAR(5),@idCliente)+' , se encuentra registrado bajo el nombre de: '+CONVERT(VARCHAR,@nombres);
END
ELSE
BEGIN
	PRINT 'El cliente con id '+CONVERT(VARCHAR(5),@idCliente)+' , no se encuentra registrado en el sistema';
	ROLLBACK;
	RETURN; -- salgo de la transaccion, pues el cliente no existe en la base de datos
END

-- Verificar si el cliente tiene órdenes de servicio
SELECT @tieneOrdenes = COUNT(*)
FROM ordenServicio
WHERE idCliente = @idCliente;

-- Condición IF Anidada
IF @tieneOrdenes > 0
BEGIN
    -- Si tiene órdenes, no se elimina el cliente
    PRINT 'No se puede eliminar el cliente '+CONVERT(VARCHAR,@nombres)+' porque tiene órdenes de servicio asociadas';
    ROLLBACK;
    RETURN;
END
ELSE
BEGIN
    -- Si no tiene órdenes, elimina el cliente
    DELETE FROM cliente WHERE idCliente = @idCliente;
    PRINT 'Cliente eliminado correctamente '+CONVERT(VARCHAR,@nombres);
END

-- Si todo es correcto, se realiza COMMIT de la transacción
COMMIT;

-- Nota: Se debe insertar datos de un cliente, que no halla realizado alguna orden de servicio

----------------------------------------------------------------------------------------------------------------------------

-- 2. El cliente desea actualizar datos personales, proporciona la direccion residencial y correo electronico.

BEGIN TRANSACTION;  -- Inicia la transacción

-- Verificamos si el cliente existe en la tabla cliente
DECLARE @idCliente INT = 3;  -- ID del cliente a actualizar
DECLARE @clienteExiste INT;

-- Comprobamos si el cliente existe
SELECT @clienteExiste = COUNT(*)
FROM cliente
WHERE idCliente = @idCliente;

IF @clienteExiste = 0
BEGIN
    -- Si el cliente no existe, deshacemos la transacción
    PRINT 'El cliente no existe. Cancelando la transacción.';
    ROLLBACK;
	RETURN;
END
ELSE
BEGIN
    -- Si el cliente existe, actualizamos la información
    UPDATE cliente
    SET 
        direccionCliente = 'Nueva dirección 123', 
        correoECliente = 'nuevoemail@dominio.com'
    WHERE idCliente = @idCliente;
    -- Si todo va bien, confirmamos la transacción
    COMMIT TRANSACTION;
    PRINT 'La transacción se completó con éxito.';
END

----------------------------------------------------------------------------------------------------------------------------

-- 3. Un restaurante se ha registrado en el sistema, indicando su disponibilidad de lunes a viernes, ingreso todas las comidas y bebidas pero casualmente los registro como NO DISPONIBLE,
--    Se debe de crear una consulta general, validando que si el restaurante indica que no esta disponible sus comidas y bebidas, entonces el restaurante deberìa decir NO DISPONIBLE tambien.

DECLARE @idRestaurante INT = 1;  -- Restaurante a verificar
DECLARE @idDisponibilidadNoDisponible INT;
DECLARE @disponibilidadComida INT;
DECLARE @disponibilidadBebida INT;

-- Paso 1: Obtener el ID de la fila correspondiente a "NO DISPONIBLE" en la tabla combinacionesDias
SELECT @idDisponibilidadNoDisponible = idCombinacionesDias
FROM combinacionesDias
WHERE descripcionCombinacionDias = 'NO DISPONIBLE';

-- Paso 2: Verificar si el restaurante tiene algún menú disponible (comida o bebida)
SELECT @disponibilidadComida = COUNT(*)
FROM menuComida
WHERE idRestaurante = @idRestaurante
  AND NOT(disponibilidadMenuComida IS NULL OR disponibilidadMenuComida = 0 OR disponibilidadMenuComida = @idDisponibilidadNoDisponible);

SELECT @disponibilidadBebida = COUNT(*)
FROM menuBebida
WHERE idRestaurante = @idRestaurante
  AND NOT(disponibilidadMenuBebida IS NULL OR disponibilidadMenuBebida = 0 OR disponibilidadMenuBebida = @idDisponibilidadNoDisponible);

-- Paso 3: Si no tiene menús disponibles, actualizar la disponibilidad del restaurante
IF @disponibilidadComida = 0 AND @disponibilidadBebida = 0
BEGIN
    PRINT 'El restaurante no tiene menús disponibles. Actualizando su estado a NO DISPONIBLE.';
    -- Actualizamos la disponibilidad del restaurante a NO DISPONIBLE
    UPDATE restaurante
    SET disponibilidadRestaurante = @idDisponibilidadNoDisponible  -- Asignamos el ID de "NO DISPONIBLE"
    WHERE idRestaurante = @idRestaurante;
END
ELSE
BEGIN
    PRINT 'El restaurante tiene menús disponibles. No se necesita actualizar su estado.';
END

-- nota: Debo de insertar datos de un restaurante, y sus menus de comida y bebidas pero que estos NO DISPONIBLES - INSERTAR NO DISPONIBLE en combinacionesDias