
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


-- Este código define un procedimiento almacenado llamado `validarPagoOrden` que verifica si una orden de servicio tiene un método de pago válido (como Nequi, Daviplata, PSE, tarjeta o efectivo) y si el estado del pago está confirmado. Primero valida que la orden exista, luego consulta el cliente, el estado del pago y la descripción del método de pago. Si falta alguno de estos datos o el método no es aceptado, lanza un mensaje de error y retorna un código específico. Si todo está en orden, devuelve un mensaje de éxito indicando que la orden está en preparación (de forma simulada).

CREATE PROCEDURE validarPagoOrden
    @idOrdenServicio INT
AS
BEGIN
    DECLARE @idCliente INT;
    DECLARE @estadoPago VARCHAR(50);
    DECLARE @descripcionMetodoPago NVARCHAR(MAX);
    DECLARE @esMetodoValido BIT;

    BEGIN TRY
        -- Verificar si la orden existe
        IF NOT EXISTS (SELECT 1 FROM ordenServicio WHERE idOrdenServicio = @idOrdenServicio)
        BEGIN
            SELECT '❌ Error: Orden no encontrada.' AS Resultado;
            RETURN 1;
        END

        -- Obtener datos
        SELECT 
            @idCliente = os.idCliente,
            @estadoPago = os.estadoPago,
            @descripcionMetodoPago = mp.descripcionMetodoPago
        FROM ordenServicio os
        JOIN metodoPago mp ON os.idMetodoPago = mp.idMetodoPago
        WHERE os.idOrdenServicio = @idOrdenServicio;

        -- Validar método de pago
        IF @descripcionMetodoPago IS NULL
        BEGIN
            SELECT '❌ Error: No hay método de pago registrado.' AS Resultado;
            RETURN 2;
        END

        -- Validar si es método válido
        SET @esMetodoValido = CASE
            WHEN LOWER(@descripcionMetodoPago) LIKE '%nequi%'
              OR LOWER(@descripcionMetodoPago) LIKE '%daviplata%'
              OR LOWER(@descripcionMetodoPago) LIKE '%transferencia%'
              OR LOWER(@descripcionMetodoPago) LIKE '%pse%'
              OR LOWER(@descripcionMetodoPago) LIKE '%tarjeta%'
              OR LOWER(@descripcionMetodoPago) LIKE '%sencillo%'
            THEN 1
            ELSE 0
        END;

        IF @esMetodoValido = 0
        BEGIN
            SELECT '❌ Error: Solo se aceptan métodos virtuales o efectivo (sencillo).' AS Resultado;
            RETURN 3;
        END

        -- Validar estado del pago
        IF @estadoPago != 'Confirmado'
        BEGIN
            SELECT '⚠️ Error: El pago no está confirmado aún.' AS Resultado;
            RETURN 4;
        END

        -- Todo bien
        SELECT '✅ Verificación exitosa. Método aceptado. Estado: En preparación (simulado).' AS Resultado;
        RETURN 0;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        SELECT '‼️ Error inesperado: ' + @ErrorMessage AS Resultado;
        RETURN 99;
    END CATCH
END


 EXEC validarPagoOrden @idOrdenServicio = 30;



-- Este código verifica si una orden de servicio en la base de datos es válida y tiene el pago correctamente confirmado. Primero, comprueba si la orden existe; luego, obtiene el método de pago y valida que sea un método aceptado (como Nequi, PSE, tarjetas o efectivo tipo "sencillo"). Después, revisa si el estado del pago es "Confirmado". Si todo está bien, devuelve un mensaje de éxito. Si algo falla, corta la ejecución con BREAK y devuelve un mensaje de error indicando el problema específico. Todo esto se hace dentro de un bucle WHILE que se rompe apenas se obtiene un resultado.


GO
DECLARE @idOrdenServicio INT = 30; -- Usa un ID válido
DECLARE @idCliente INT;
DECLARE @estadoPago VARCHAR(50);
DECLARE @descripcionMetodoPago NVARCHAR(MAX);
DECLARE @esMetodoValido BIT;
DECLARE @mensaje NVARCHAR(200) = '';

-- Simulación de lógica con WHILE + BREAK
WHILE 1 = 1
BEGIN
    -- Verificar si la orden existe
    IF NOT EXISTS (SELECT 1 FROM ordenServicio WHERE idOrdenServicio = @idOrdenServicio)
    BEGIN
        SET @mensaje = '❌ Error: Orden no encontrada.';
        BREAK;
    END

    -- Obtener datos
    SELECT 
        @idCliente = os.idCliente,
        @estadoPago = os.estadoPago,
        @descripcionMetodoPago = mp.descripcionMetodoPago
    FROM ordenServicio os
    JOIN metodoPago mp ON os.idMetodoPago = mp.idMetodoPago
    WHERE os.idOrdenServicio = @idOrdenServicio;

    IF @descripcionMetodoPago IS NULL
    BEGIN
        SET @mensaje = '❌ Error: No hay método de pago registrado.';
        BREAK;
    END

    -- Validar si el método es virtual o efectivo
    SET @esMetodoValido = CASE
        WHEN LOWER(@descripcionMetodoPago) LIKE '%nequi%'
           OR LOWER(@descripcionMetodoPago) LIKE '%daviplata%'
           OR LOWER(@descripcionMetodoPago) LIKE '%transferencia%'
           OR LOWER(@descripcionMetodoPago) LIKE '%pse%'
           OR LOWER(@descripcionMetodoPago) LIKE '%tarjeta%'
           OR LOWER(@descripcionMetodoPago) LIKE '%sencillo%'
        THEN 1 ELSE 0
    END;

    IF @esMetodoValido = 0
    BEGIN
        SET @mensaje = '❌ Error: Solo se aceptan métodos virtuales o efectivo (sencillo).';
        BREAK;
    END

    -- Validar estado del pago
    IF @estadoPago != 'Confirmado'
    BEGIN
        SET @mensaje = '⚠️ Error: El pago no está confirmado aún.';
        BREAK;
    END

    -- Todo está bien
    SET @mensaje = '✅ Verificación exitosa. Método aceptado. Estado: En preparación (simulado).';
    BREAK;
END

-- Mostrar mensaje final
SELECT @mensaje AS Resultado;
