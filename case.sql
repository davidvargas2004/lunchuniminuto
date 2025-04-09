-- Condicional CASE para aplicar plato gratis a clientes frecuentes con rol específico
DECLARE @idCliente INT = 3;           -- Cliente a evaluar
DECLARE @idMenuComida INT = 5;        -- Menú seleccionado
DECLARE @idRolEspecial INT = 2;       -- Rol que califica para promoción (ejemplo: Estudiante)
DECLARE @comprasMinimas INT = 15;     -- Compras necesarias para plato gratis
DECLARE @rolActual INT;
DECLARE @cantidadCompras INT;
DECLARE @precioOriginal DECIMAL(10,2);
DECLARE @precioFinal DECIMAL(10,2);
DECLARE @mensaje VARCHAR(300);

-- Obtener rol del cliente
SELECT @rolActual = idRolUniversitario 
FROM cliente 
WHERE idCliente = @idCliente;

-- Obtener cantidad de compras del cliente (sólo las completadas)
SELECT @cantidadCompras = COUNT(*) 
FROM ordenServicio os
JOIN estadoServicio es ON os.idEstadoServicio = es.idEstadoServicio
WHERE os.idCliente = @idCliente AND es.nombreEstadoServicio = 'Completada';

-- Obtener precio original del menú (último precio)
SELECT TOP 1 @precioOriginal = pc.precioPrecioComida
FROM precioComida pc
WHERE pc.idMenuComida = @idMenuComida
ORDER BY pc.fechaActualizacionPrecioComida DESC;

-- Calcular precio final según condiciones
SET @precioFinal = CASE
    WHEN @rolActual = @idRolEspecial AND @cantidadCompras >= @comprasMinimas THEN 0
    WHEN @rolActual = @idRolEspecial AND @cantidadCompras >= 10 THEN @precioOriginal * 0.8
    WHEN @rolActual = @idRolEspecial THEN @precioOriginal * 0.95
    ELSE @precioOriginal
END;

-- Generar mensaje explicativo
SET @mensaje = CASE
    WHEN @rolActual = @idRolEspecial AND @cantidadCompras >= @comprasMinimas 
        THEN '¡Felicidades! Has realizado ' + CAST(@cantidadCompras AS VARCHAR) + 
             ' compras. Este plato es GRATIS por tu lealtad.'
    WHEN @rolActual = @idRolEspecial AND @cantidadCompras >= 10 
        THEN 'Cliente frecuente: Descuento del 20% aplicado. Te faltan ' + 
             CAST(@comprasMinimas - @cantidadCompras AS VARCHAR) + 
             ' compras para obtener un plato gratis.'
    WHEN @rolActual = @idRolEspecial 
        THEN 'Descuento del 5% aplicado por tu rol universitario.'
    ELSE 'Precio regular sin descuentos aplicables.'
END;

-- Mostrar resultados
SELECT 
    c.nombresCliente + ' ' + c.apellidosCliente AS Cliente,
    ru.nombreRolUniversitario AS Rol,
    @cantidadCompras AS ComprasRealizadas,
    mc.nombreMenuComida AS MenuSeleccionado,
    @precioOriginal AS PrecioOriginal,
    @precioFinal AS PrecioFinal,
    @mensaje AS Mensaje
FROM cliente c
JOIN rolUniversitario ru ON c.idRolUniversitario = ru.idRolUniversitario
JOIN menuComida mc ON mc.idMenuComida = @idMenuComida
WHERE c.idCliente = @idCliente;





-- con RETURN para terminar la ejecución en cada caso según el flujo lógico. Esto mejora el control del proceso y evita seguir ejecutando innecesariamente si algo falla:



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
 


-- El BREAK sirve para salir del ciclo WHILE antes de que se cumplan todas las condiciones, cuando ocurre un caso que ya no tiene sentido seguir evaluando (por ejemplo, si no hay orden pendiente o el cliente no existe).



GO
-- Script con flujo paso a paso y simulación si no hay orden pendiente
DECLARE @idCliente INT = 3;
DECLARE @idMenuComida INT = 5;
DECLARE @idRolEspecial INT = 2;
DECLARE @comprasMinimas INT = 15;

DECLARE @paso INT = 1;
DECLARE @finalizado BIT = 0;

DECLARE @rolActual INT;
DECLARE @cantidadCompras INT;
DECLARE @precioOriginal DECIMAL(10,2);
DECLARE @precioFinal DECIMAL(10,2);
DECLARE @comentario NVARCHAR(255);
DECLARE @idOrdenServicio INT = NULL;

WHILE @finalizado = 0
BEGIN
    IF @paso = 1
    BEGIN
        SELECT @rolActual = idRolUniversitario 
        FROM cliente 
        WHERE idCliente = @idCliente;

        IF @rolActual IS NULL
        BEGIN
            SELECT 'El cliente no existe o no tiene rol asignado' AS Resultado;
            BREAK;
        END
        SET @paso = 2;
    END

    ELSE IF @paso = 2
    BEGIN
        SELECT @cantidadCompras = COUNT(*) 
        FROM ordenServicio os
        JOIN estadoServicio es ON os.idEstadoServicio = es.idEstadoServicio
        WHERE os.idCliente = @idCliente AND es.nombreEstadoServicio = 'Completada';
        SET @paso = 3;
    END

    ELSE IF @paso = 3
    BEGIN
        SELECT TOP 1 @precioOriginal = precioPrecioComida 
        FROM precioComida 
        WHERE idMenuComida = @idMenuComida
        ORDER BY fechaActualizacionPrecioComida DESC;

        IF @precioOriginal IS NULL
        BEGIN
            SELECT 'No se encontró precio para el menú seleccionado' AS Resultado;
            BREAK;
        END
        SET @paso = 4;
    END

    ELSE IF @paso = 4
    BEGIN
        SELECT TOP 1 @idOrdenServicio = os.idOrdenServicio 
        FROM ordenServicio os
        JOIN estadoServicio es ON os.idEstadoServicio = es.idEstadoServicio
        WHERE os.idCliente = @idCliente AND es.nombreEstadoServicio = 'Pendiente'
        ORDER BY os.fechaOrdenServicio DESC;

        -- Si no hay orden, solo se simula
        SET @paso = 5;
    END

    ELSE IF @paso = 5
    BEGIN
        -- Cálculo del precio
        SET @precioFinal = CASE
            WHEN @rolActual = @idRolEspecial AND @cantidadCompras >= @comprasMinimas THEN 0
            WHEN @rolActual = @idRolEspecial AND @cantidadCompras >= 10 THEN @precioOriginal * 0.8
            WHEN @rolActual = @idRolEspecial THEN @precioOriginal * 0.95
            ELSE @precioOriginal
        END;

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
            CASE 
                WHEN @idOrdenServicio IS NULL THEN 'No hay orden pendiente: se realizó simulación'
                ELSE 'Orden encontrada: simulación aplicada'
            END AS Resultado,
            @precioOriginal AS PrecioOriginal,
            @precioFinal AS PrecioFinal,
            @comentario AS ComentarioSugerido;

        SET @finalizado = 1;
    END
END
GO
