-- Este procedimiento almacenado llamado BuscarPlatoFavorito recibe como parámetro el ID de un cliente y obtener su plato favorito (en este caso, "Bandeja Paisa"). Primero verifica si el cliente existe en la base de datos; si no existe, devuelve un mensaje de error. Luego comprueba si ese plato existe en el menú de comidas; si no está, informa que no se encuentra en ningún restaurante. Después verifica si hay restaurantes disponibles actualmente que ofrezcan ese plato; si no los hay, muestra un mensaje indicando que el plato no está disponible hoy. Finalmente, si todas las condiciones se cumplen, retorna un mensaje positivo y una lista de los restaurantes disponibles que ofrecen el plato favorito, junto con su nombre, dirección y precio.

go
CREATE PROCEDURE BuscarPlatoFavorito
    @idCliente INT
AS
BEGIN
    DECLARE @nombrePlatoFavorito VARCHAR(100);
    DECLARE @mensaje VARCHAR(300);

    -- Simulación de plato favorito (puedes reemplazar por una consulta a otra tabla)
    SELECT @nombrePlatoFavorito = 'Bandeja Paisa';

    -- Verificar si el cliente existe
    IF NOT EXISTS (SELECT 1 FROM cliente WHERE idCliente = @idCliente)
    BEGIN
        SET @mensaje = 'El cliente con ID ' + CAST(@idCliente AS VARCHAR) + ' no existe en la base de datos.';
        SELECT @mensaje AS Mensaje;
        RETURN;
    END

    -- Buscar el plato favorito en los menús
    IF NOT EXISTS (SELECT 1 FROM menuComida WHERE nombreMenuComida LIKE '%' + @nombrePlatoFavorito + '%')
    BEGIN
        SET @mensaje = 'Lo sentimos, su plato favorito "' + @nombrePlatoFavorito + 
                       '" no está disponible en ningún restaurante del sistema.';
        SELECT @mensaje AS Mensaje;
        RETURN;
    END

    -- Verificar si hay restaurantes abiertos que lo ofrezcan
    IF NOT EXISTS (
        SELECT 1 FROM menuComida mc
        JOIN restaurante r ON mc.idRestaurante = r.idRestaurante
        WHERE mc.nombreMenuComida LIKE '%' + @nombrePlatoFavorito + '%'
        AND r.disponibilidadRestaurante > 0
    )
    BEGIN
        SET @mensaje = 'Su plato favorito "' + @nombrePlatoFavorito + 
                       '" existe pero no está disponible hoy en ningún restaurante abierto.';
        SELECT @mensaje AS Mensaje;
        RETURN;
    END

    -- Si todo pasa, mostrar resultados
    SET @mensaje = '¡Buenas noticias! Su plato favorito "' + @nombrePlatoFavorito + 
                   '" está disponible en los siguientes restaurantes:';

    SELECT @mensaje AS Mensaje;

    SELECT r.nombreRestaurante, r.direccionRestaurante, mc.nombreMenuComida, pc.precioPrecioComida AS Precio
    FROM menuComida mc
    INNER JOIN restaurante r ON mc.idRestaurante = r.idRestaurante
    INNER JOIN precioComida pc ON mc.idMenuComida = pc.idMenuComida
    WHERE mc.nombreMenuComida LIKE '%' + @nombrePlatoFavorito + '%'
    AND r.disponibilidadRestaurante > 0
    ORDER BY pc.precioPrecioComida ASC;
END
go



-------------------------------------------------------------------



-- Este código determina el precio final de un menú para un cliente específico considerando varios factores: primero verifica si el cliente existe y tiene un rol asignado; luego obtiene la cantidad de compras completadas y el precio original del menú. Dependiendo de condiciones como el rol del cliente, el número de compras realizadas y si hay órdenes pendientes, se ajusta el precio final usando una lógica con `CASE`. Además, se generan mensajes personalizados si el cliente no tiene órdenes pendientes o si hay problemas con el precio o el rol. Es una implementación lógica para calcular precios dinámicos en función de roles y antecedentes del cliente.



GO
-- Condicional CASE sin UPDATE y sin detener si no hay orden pendiente
DECLARE @idCliente INT = 3;
DECLARE @idMenuComida INT = 5;
DECLARE @idRolEspecial INT = 2;
DECLARE @comprasMinimas INT = 15;
DECLARE @idOrdenServicio INT = NULL;
DECLARE @rolActual INT;
DECLARE @cantidadCompras INT;
DECLARE @precioOriginal DECIMAL(10,2);
DECLARE @precioFinal DECIMAL(10,2);
DECLARE @comentario NVARCHAR(255);
DECLARE @mensaje NVARCHAR(255);

-- Obtener rol del cliente
SELECT @rolActual = idRolUniversitario 
FROM cliente 
WHERE idCliente = @idCliente;

IF @rolActual IS NULL
BEGIN
    SELECT 'El cliente no existe o no tiene rol asignado' AS Resultado;
    RETURN;
END;

-- Obtener cantidad de compras previas (completadas)
SELECT @cantidadCompras = COUNT(*) 
FROM ordenServicio os
JOIN estadoServicio es ON os.idEstadoServicio = es.idEstadoServicio
WHERE os.idCliente = @idCliente AND es.nombreEstadoServicio = 'Completada';

-- Obtener precio original del menú
SELECT TOP 1 @precioOriginal = precioPrecioComida
FROM precioComida
WHERE idMenuComida = @idMenuComida
ORDER BY fechaActualizacionPrecioComida DESC;

IF @precioOriginal IS NULL
BEGIN
    SELECT 'No se encontró precio para el menú seleccionado' AS Resultado;
    RETURN;
END;

-- Intentar obtener orden pendiente
SELECT TOP 1 @idOrdenServicio = os.idOrdenServicio
FROM ordenServicio os
JOIN estadoServicio es ON os.idEstadoServicio = es.idEstadoServicio
WHERE os.idCliente = @idCliente AND es.nombreEstadoServicio = 'Pendiente'
ORDER BY os.fechaOrdenServicio DESC;

-- Mensaje personalizado si no hay orden
SET @mensaje = ISNULL(
    CAST(@idOrdenServicio AS VARCHAR),
    'Sin orden pendiente: se calcula de forma independiente.'
);

-- Calcular precio final con CASE
SET @precioFinal = CASE
    WHEN @rolActual = @idRolEspecial AND @cantidadCompras >= @comprasMinimas THEN 0
    WHEN @rolActual = @idRolEspecial AND @cantidadCompras >= 10 THEN @precioOriginal * 0.8
    WHEN @rolActual = @idRolEspecial THEN @precioOriginal * 0.95
    ELSE @precioOriginal
END;

-- Generar comentario simulado
SET @comentario = CASE
    WHEN @rolActual = @idRolEspecial AND @cantidadCompras >= @comprasMinimas 
        THEN 'PLATO GRATIS - Cliente Premium con ' + CAST(@cantidadCompras AS VARCHAR) + ' compras'
    WHEN @rolActual = @idRolEspecial AND @cantidadCompras >= 10 
        THEN 'Descuento 20% - Cliente frecuente'
    WHEN @rolActual = @idRolEspecial 
        THEN 'Descuento 5% - Por rol universitario'
    ELSE 'Precio regular'
END;

-- Mostrar resultados
SELECT 
    'Simulación completada exitosamente' AS Resultado,
    @mensaje AS OrdenDetectada,
    @precioOriginal AS PrecioOriginal,
    @precioFinal AS PrecioFinal,
    @comentario AS ComentarioSugerido;
RETURN;
GO


-----------------------------------------------------------------------------
-- Este código verifica si un cliente puede ordenar un menú dependiendo de la hora del día y la categoría del menú. Primero, comprueba si el cliente y el menú existen en la base de datos. Si el menú es válido, obtiene su categoría y compara la hora actual del sistema con el rango de horarios permitido para esa categoría (como Desayuno, Almuerzo, Cena, etc.). Luego, genera un mensaje indicando si el cliente puede ordenar el menú o si está fuera del horario adecuado. Es útil para gestionar restricciones de horario en un sistema de pedidos


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

