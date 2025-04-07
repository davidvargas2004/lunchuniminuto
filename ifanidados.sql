-- Variables de entrada:
-- @idCliente: ID del cliente que realiza el pedido.
-- @idMenuComida: ID del menú que desea ordenar.
-- @horaActual: Hora actual del sistema (formato TIME).
-- Pasos principales:
-- Verifica si el cliente existe en la tabla cliente.
-- Verifica si el menú existe y obtiene su categoría desde menuComida y categoriaComida.
-- Compara la hora actual con los rangos horarios definidos para cada categoría:
-- Desayuno: 6:00 - 10:00
-- Media mañana: 10:00 - 11:30
-- Almuerzo: 12:00 - 15:00
-- Media tarde: 15:00 - 17:30
-- Cena: 18:00 - 21:00
-- Refrigerio nocturno: 21:00 - 23:59
-- Genera un mensaje indicando si el menú está disponible o no según el horario.
-- Salida:
-- Muestra un resumen con:
-- ID del cliente.
-- ID del menú.
-- Categoría del menú.
-- Hora actual.
-- Mensaje de resultado (ej: "El cliente puede ordenar este Almuerzo (hora adecuada)").
-- Casos de Uso:
-- Restaurantes universitarios: Para garantizar que los clientes solo ordenen menús en sus horarios designados.
-- Sistemas de pedidos en línea: Validar la disponibilidad de platillos según la hora del día.



-- Ejercicio de IF anidado corregido: Verificar disponibilidad de menú según hora del día y categoría
DECLARE @idCliente INT = 1;
DECLARE @idMenuComida INT = 2;
DECLARE @horaActual TIME = CAST(GETDATE() AS TIME);
DECLARE @categoriaComida INT;
DECLARE @nombreCategoria VARCHAR(100);
DECLARE @mensaje VARCHAR(200);

-- Imprimir la hora actual para depuración
PRINT 'Hora actual del sistema: ' + CAST(@horaActual AS VARCHAR);

-- Verificar si el cliente existe
IF EXISTS (SELECT 1 FROM cliente WHERE idCliente = @idCliente)
BEGIN
    -- Verificar si el menú existe y obtener su categoría
    IF EXISTS (SELECT 1 FROM menuComida WHERE idMenuComida = @idMenuComida)
    BEGIN
        SELECT @categoriaComida = idCategoriaComida FROM menuComida WHERE idMenuComida = @idMenuComida;
        SELECT @nombreCategoria = nombreCategoriaComida FROM categoriaComida WHERE idCategoriaComida = @categoriaComida;
        
        -- Para depuración
        PRINT 'Categoría detectada: ' + @nombreCategoria;
        
        -- Verificar si la hora actual es adecuada para la categoría de comida
        IF @nombreCategoria = 'Desayuno' 
        BEGIN
            -- Usar formato de 24 horas para evitar confusiones AM/PM
            IF @horaActual >= '06:00' AND @horaActual <= '10:00'
            BEGIN
                SET @mensaje = 'El cliente puede ordenar este Desayuno (hora adecuada)';
            END
            ELSE
            BEGIN
                SET @mensaje = 'No es hora adecuada para Desayuno. Horario: 6:00 - 10:00';
            END
        END
        ELSE IF @nombreCategoria = 'Media mañana'
        BEGIN
            IF @horaActual > '10:00' AND @horaActual <= '11:30'
            BEGIN
                SET @mensaje = 'El cliente puede ordenar esta Media mañana (hora adecuada)';
            END
            ELSE
            BEGIN
                SET @mensaje = 'No es hora adecuada para Media mañana. Horario: 10:00 - 11:30';
            END
        END
        ELSE IF @nombreCategoria = 'Almuerzo'
        BEGIN
            IF @horaActual >= '12:00' AND @horaActual <= '15:00'
            BEGIN
                SET @mensaje = 'El cliente puede ordenar este Almuerzo (hora adecuada)';
            END
            ELSE
            BEGIN
                SET @mensaje = 'No es hora adecuada para Almuerzo. Horario: 12:00 - 15:00';
            END
        END
        ELSE IF @nombreCategoria = 'Media tarde'
        BEGIN
            IF @horaActual > '15:00' AND @horaActual <= '17:30'
            BEGIN
                SET @mensaje = 'El cliente puede ordenar esta Media tarde (hora adecuada)';
            END
            ELSE
            BEGIN
                SET @mensaje = 'No es hora adecuada para Media tarde. Horario: 15:00 - 17:30';
            END
        END
        ELSE IF @nombreCategoria = 'Cena'
        BEGIN
            IF @horaActual >= '18:00' AND @horaActual <= '21:00'
            BEGIN
                SET @mensaje = 'El cliente puede ordenar esta Cena (hora adecuada)';
            END
            ELSE
            BEGIN
                SET @mensaje = 'No es hora adecuada para Cena. Horario: 18:00 - 21:00';
            END
        END
        ELSE IF @nombreCategoria = 'Refrigerio nocturno'
        BEGIN
            IF @horaActual > '21:00' AND @horaActual <= '23:59'
            BEGIN
                SET @mensaje = 'El cliente puede ordenar este Refrigerio nocturno (hora adecuada)';
            END
            ELSE
            BEGIN
                SET @mensaje = 'No es hora adecuada para Refrigerio nocturno. Horario: 21:00 - 23:59';
            END
        END
        ELSE
        BEGIN
            SET @mensaje = 'Categoría de comida no reconocida: ' + @nombreCategoria;
        END
    END
    ELSE
    BEGIN
        SET @mensaje = 'El menú seleccionado no existe';
    END
END
ELSE
BEGIN
    SET @mensaje = 'El cliente no existe en la base de datos';
END

-- Para depuración, mostramos información completa
SELECT 
    @idCliente AS IDCliente,
    @idMenuComida AS IDMenu,
    @categoriaComida AS IDCategoria,
    @nombreCategoria AS Categoria,
    @horaActual AS HoraActual,
    @mensaje AS Resultado;





-- RETURN en esta estructura, elaboramos una lógica clara. Lo usaremos para salir inmediatamente si el cliente no existe, ya que no tiene sentido seguir evaluando lo demás. También agregué SELECT @mensaje AS Resultado antes del RETURN, así no te pierdes el mensaje.


-- Ejercicio de IF anidado corregido: Verificar disponibilidad de menú según hora del día y categoría
DECLARE @idCliente INT = 1;
DECLARE @idMenuComida INT = 2;
DECLARE @horaActual TIME = CAST(GETDATE() AS TIME);
DECLARE @categoriaComida INT;
DECLARE @nombreCategoria VARCHAR(100);
DECLARE @mensaje VARCHAR(200);

-- Imprimir la hora actual para depuración
PRINT 'Hora actual del sistema: ' + CAST(@horaActual AS VARCHAR);

-- Verificar si el cliente existe
IF NOT EXISTS (SELECT 1 FROM cliente WHERE idCliente = @idCliente)
BEGIN
    SET @mensaje = 'El cliente no existe en la base de datos';
    SELECT @mensaje AS Resultado;
    RETURN; -- Salimos de inmediato si el cliente no existe
END

-- Verificar si el menú existe y obtener su categoría
IF EXISTS (SELECT 1 FROM menuComida WHERE idMenuComida = @idMenuComida)
BEGIN
    SELECT @categoriaComida = idCategoriaComida FROM menuComida WHERE idMenuComida = @idMenuComida;
    SELECT @nombreCategoria = nombreCategoriaComida FROM categoriaComida WHERE idCategoriaComida = @categoriaComida;
    
    -- Para depuración
    PRINT 'Categoría detectada: ' + @nombreCategoria;
    
    -- Verificar si la hora actual es adecuada para la categoría de comida
    IF @nombreCategoria = 'Desayuno' 
    BEGIN
        IF @horaActual >= '06:00' AND @horaActual <= '10:00'
            SET @mensaje = 'El cliente puede ordenar este Desayuno (hora adecuada)';
        ELSE
            SET @mensaje = 'No es hora adecuada para Desayuno. Horario: 6:00 - 10:00';
    END
    ELSE IF @nombreCategoria = 'Media mañana'
    BEGIN
        IF @horaActual > '10:00' AND @horaActual <= '11:30'
            SET @mensaje = 'El cliente puede ordenar esta Media mañana (hora adecuada)';
        ELSE
            SET @mensaje = 'No es hora adecuada para Media mañana. Horario: 10:00 - 11:30';
    END
    ELSE IF @nombreCategoria = 'Almuerzo'
    BEGIN
        IF @horaActual >= '12:00' AND @horaActual <= '15:00'
            SET @mensaje = 'El cliente puede ordenar este Almuerzo (hora adecuada)';
        ELSE
            SET @mensaje = 'No es hora adecuada para Almuerzo. Horario: 12:00 - 15:00';
    END
    ELSE IF @nombreCategoria = 'Media tarde'
    BEGIN
        IF @horaActual > '15:00' AND @horaActual <= '17:30'
            SET @mensaje = 'El cliente puede ordenar esta Media tarde (hora adecuada)';
        ELSE
            SET @mensaje = 'No es hora adecuada para Media tarde. Horario: 15:00 - 17:30';
    END
    ELSE IF @nombreCategoria = 'Cena'
    BEGIN
        IF @horaActual >= '18:00' AND @horaActual <= '21:00'
            SET @mensaje = 'El cliente puede ordenar esta Cena (hora adecuada)';
        ELSE
            SET @mensaje = 'No es hora adecuada para Cena. Horario: 18:00 - 21:00';
    END
    ELSE IF @nombreCategoria = 'Refrigerio nocturno'
    BEGIN
        IF @horaActual > '21:00' AND @horaActual <= '23:59'
            SET @mensaje = 'El cliente puede ordenar este Refrigerio nocturno (hora adecuada)';
        ELSE
            SET @mensaje = 'No es hora adecuada para Refrigerio nocturno. Horario: 21:00 - 23:59';
    END
    ELSE
    BEGIN
        SET @mensaje = 'Categoría de comida no reconocida: ' + @nombreCategoria;
    END
END
ELSE
BEGIN
    SET @mensaje = 'El menú seleccionado no existe';
END

-- Mostrar mensaje final
SELECT @mensaje AS Resultado;




-- la lógica dentro de un WHILE 1 = 1 (loop infinito) y usamos BREAK para salir cuando sea necesario, por ejemplo, si el cliente no existe o se encuentra un error.


-- Ejercicio con BREAK: Verificar disponibilidad de menú según hora del día y categoría
DECLARE @idCliente INT = 1;
DECLARE @idMenuComida INT = 2;
DECLARE @horaActual TIME = CAST(GETDATE() AS TIME);
DECLARE @categoriaComida INT;
DECLARE @nombreCategoria VARCHAR(100);
DECLARE @mensaje VARCHAR(200);

-- Imprimir hora actual para depuración
PRINT 'Hora actual del sistema: ' + CAST(@horaActual AS VARCHAR);

-- Lógica principal en un bucle para permitir el uso de BREAK
WHILE 1 = 1
BEGIN
    -- Verificar si el cliente existe
    IF NOT EXISTS (SELECT 1 FROM cliente WHERE idCliente = @idCliente)
    BEGIN
        SET @mensaje = 'El cliente no existe en la base de datos';
        BREAK;
    END

    -- Verificar si el menú existe y obtener categoría
    IF EXISTS (SELECT 1 FROM menuComida WHERE idMenuComida = @idMenuComida)
    BEGIN
        SELECT @categoriaComida = idCategoriaComida FROM menuComida WHERE idMenuComida = @idMenuComida;
        SELECT @nombreCategoria = nombreCategoriaComida FROM categoriaComida WHERE idCategoriaComida = @categoriaComida;

        PRINT 'Categoría detectada: ' + @nombreCategoria;

        -- Verificar hora según categoría
        IF @nombreCategoria = 'Desayuno'
        BEGIN
            IF @horaActual BETWEEN '06:00' AND '10:00'
                SET @mensaje = 'El cliente puede ordenar este Desayuno (hora adecuada)';
            ELSE
                SET @mensaje = 'No es hora adecuada para Desayuno. Horario: 6:00 - 10:00';
        END
        ELSE IF @nombreCategoria = 'Media mañana'
        BEGIN
            IF @horaActual > '10:00' AND @horaActual <= '11:30'
                SET @mensaje = 'El cliente puede ordenar esta Media mañana (hora adecuada)';
            ELSE
                SET @mensaje = 'No es hora adecuada para Media mañana. Horario: 10:00 - 11:30';
        END
        ELSE IF @nombreCategoria = 'Almuerzo'
        BEGIN
            IF @horaActual BETWEEN '12:00' AND '15:00'
                SET @mensaje = 'El cliente puede ordenar este Almuerzo (hora adecuada)';
            ELSE
                SET @mensaje = 'No es hora adecuada para Almuerzo. Horario: 12:00 - 15:00';
        END
        ELSE IF @nombreCategoria = 'Media tarde'
        BEGIN
            IF @horaActual > '15:00' AND @horaActual <= '17:30'
                SET @mensaje = 'El cliente puede ordenar esta Media tarde (hora adecuada)';
            ELSE
                SET @mensaje = 'No es hora adecuada para Media tarde. Horario: 15:00 - 17:30';
        END
        ELSE IF @nombreCategoria = 'Cena'
        BEGIN
            IF @horaActual BETWEEN '18:00' AND '21:00'
                SET @mensaje = 'El cliente puede ordenar esta Cena (hora adecuada)';
            ELSE
                SET @mensaje = 'No es hora adecuada para Cena. Horario: 18:00 - 21:00';
        END
        ELSE IF @nombreCategoria = 'Refrigerio nocturno'
        BEGIN
            IF @horaActual > '21:00' AND @horaActual <= '23:59'
                SET @mensaje = 'El cliente puede ordenar este Refrigerio nocturno (hora adecuada)';
            ELSE
                SET @mensaje = 'No es hora adecuada para Refrigerio nocturno. Horario: 21:00 - 23:59';
        END
        ELSE
        BEGIN
            SET @mensaje = 'Categoría de comida no reconocida: ' + @nombreCategoria;
        END
    END
    ELSE
    BEGIN
        SET @mensaje = 'El menú seleccionado no existe';
    END

    -- Salimos del bucle después de ejecutar la lógica principal
    BREAK;
END

-- Mostrar el resultado final
SELECT @mensaje AS Resultado;

