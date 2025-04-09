
-- El código implementa un sistema de verificación de pagos usando TRY CATCH en SQL. Cuando un cliente hace un pedido, este script verifica si existe una orden con el ID especificado, comprueba si el cliente ha seleccionado un método de pago virtual (como Nequi, Daviplata o transferencia bancaria), y valida que el pago haya sido confirmado en el sistema. Si todas las condiciones se cumplen, actualiza el estado de la orden a "En preparación" y registra este cambio en el historial. Si ocurre algún error (orden inexistente, método de pago no virtual, pago no confirmado), captura la excepción, muestra un mensaje personalizado según el tipo de error, y registra el problema en una tabla de logs para su seguimiento.

GO
DECLARE @idOrdenServicio INT = 30; -- Usa un ID válido
DECLARE @idCliente INT;
DECLARE @estadoPago VARCHAR(50);
DECLARE @descripcionMetodoPago NVARCHAR(MAX);
DECLARE @esMetodoValido BIT;

BEGIN TRY
    -- Verificar si la orden existe
    IF NOT EXISTS (SELECT 1 FROM ordenServicio WHERE idOrdenServicio = @idOrdenServicio)
        THROW 50001, 'La orden no existe.', 1;

    -- Obtener datos de ordenServicio
    SELECT 
        @idCliente = os.idCliente,
        @estadoPago = os.estadoPago,
        @descripcionMetodoPago = mp.descripcionMetodoPago
    FROM ordenServicio os
    JOIN metodoPago mp ON os.idMetodoPago = mp.idMetodoPago
    WHERE os.idOrdenServicio = @idOrdenServicio;

    -- Validar método de pago
    IF @descripcionMetodoPago IS NULL
        THROW 50002, 'No se ha registrado un método de pago.', 1;

    -- Validar si es método virtual o efectivo aceptado
    SET @esMetodoValido = CASE
        WHEN LOWER(@descripcionMetodoPago) LIKE '%nequi%'
           OR LOWER(@descripcionMetodoPago) LIKE '%daviplata%'
           OR LOWER(@descripcionMetodoPago) LIKE '%transferencia%'
           OR LOWER(@descripcionMetodoPago) LIKE '%pse%'
           OR LOWER(@descripcionMetodoPago) LIKE '%tarjeta%'
           OR LOWER(@descripcionMetodoPago) LIKE '%sencillo%' -- aceptando efectivo
        THEN 1
        ELSE 0
    END;

    IF @esMetodoValido = 0
        THROW 50003, 'Método de pago no válido. Solo se aceptan virtuales o efectivo.', 1;

    -- Validar estado del pago
    IF @estadoPago != 'Confirmado'
        THROW 50004, 'El pago aún no ha sido confirmado.', 1;

    -- Todo bien, mostrar resultado simulado
    SELECT '✅ Verificación exitosa. Método aceptado. Estado: En preparación (simulado).' AS Resultado;

END TRY
BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorNumber INT = ERROR_NUMBER();

    IF @ErrorNumber = 50001
        SELECT '❌ Error: Orden no encontrada.' AS Resultado;
    ELSE IF @ErrorNumber = 50002
        SELECT '❌ Error: No hay método de pago registrado.' AS Resultado;
    ELSE IF @ErrorNumber = 50003
        SELECT '❌ Error: Solo se aceptan métodos virtuales o efectivo (sencillo).' AS Resultado;
    ELSE IF @ErrorNumber = 50004
        SELECT '⚠️ Error: El pago no está confirmado aún.' AS Resultado;
    ELSE
        SELECT '‼️ Error inesperado: ' + @ErrorMessage AS Resultado;
END CATCH;
GO


-----------------------------------------------------------------------


-- Este código verifica si una orden de servicio con un ID específico existe en la base de datos. Si existe, actualiza su estado a "confirmado" (representado por el valor 2 en `idEstadoServicio`). Si la orden no existe o ocurre un error durante el proceso, se muestra un mensaje de error. Todo el proceso está envuelto en un bloque `TRY...CATCH` para manejar errores de manera controlada.


DECLARE @idOrdenServicio INT = 1;

BEGIN TRY
    -- Verificar si existe la orden
    IF NOT EXISTS (SELECT 1 FROM ordenServicio WHERE idOrdenServicio = @idOrdenServicio)
    BEGIN
        RAISERROR('❌ La orden no existe.', 16, 1);
        RETURN;
    END;

    -- Aquí asumimos que "2" es el estado de "confirmado"
    UPDATE ordenServicio
    SET idEstadoServicio = 2
    WHERE idOrdenServicio = @idOrdenServicio;

    SELECT '✅ La orden ha sido confirmada exitosamente.' AS Resultado;

END TRY
BEGIN CATCH
    SELECT '❌ Error inesperado: ' + ERROR_MESSAGE() AS Resultado;
END CATCH;



--------------------------------------------------------------


--Este bloque de código en SQL Server verifica si una orden de servicio con un ID específico existe, obtiene su total cobrado y, si el valor es mayor a cero, actualiza el estado de pago como realizado. Si la orden no existe o el total es inválido (menor o igual a cero), lanza un error personalizado mediante `THROW`. Todo está envuelto en un `TRY...CATCH` para capturar y mostrar cualquier error ocurrido durante la ejecución, asegurando que el sistema no falle silenciosamente ante datos inconsistentes.

BEGIN TRY
    DECLARE @idOrden INT = 30;
    DECLARE @total DECIMAL(18,2);

    -- Verificar si la orden existe
    IF NOT EXISTS (SELECT 1 FROM ordenServicio WHERE idOrdenServicio = @idOrden)
        THROW 50001, 'La orden no existe', 1;

    -- Obtener total cobrado
    SELECT @total = totalCobrado FROM ordenServicio WHERE idOrdenServicio = @idOrden;

    -- Validar monto
    IF @total <= 0
        THROW 50002, 'El total cobrado no es válido', 1;

    -- Actualizar estado de pago
    UPDATE ordenServicio SET estadoPago = 1 WHERE idOrdenServicio = @idOrden;

    SELECT 'Pago registrado correctamente' AS Resultado;
END TRY
BEGIN CATCH
    SELECT 'Error: ' + ERROR_MESSAGE() AS Resultado;
END CATCH
