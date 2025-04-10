--Este código calcula el precio final de un menú para un cliente, teniendo en cuenta su rol, la cantidad de compras completadas y las promociones disponibles. Primero, verifica si el cliente tiene un rol especial y si cumple con los criterios para obtener descuentos o un plato gratis. Si el cliente tiene el rol especial y ha completado al menos 15 compras, el precio final es gratis. Si tiene al menos 10 compras, recibe un 20% de descuento. Si tiene el rol especial pero menos de 10 compras, recibe un descuento del 5%. De lo contrario, paga el precio completo del menú. Es un enfoque lógico para premiar la fidelidad de ciertos clientes mediante descuentos dinámicos.


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

---------------------------------------------------

--Esta consulta evalúa en qué día de la semana se realizó cada orden de servicio utilizando la función `DATENAME(WEEKDAY, o.fechaOrdenServicio)`, que devuelve el nombre del día (como "Lunes", "Martes", etc.). Luego, con una sentencia `CASE`, se determina si ese día corresponde a un día hábil (de lunes a viernes). Si es así, se indica que la promoción está disponible con el mensaje “Promo disponible: Bebida gratis”; de lo contrario, se informa que la promoción no aplica por ser fin de semana. Esta lógica permite identificar visualmente en qué pedidos aplicar la promoción según el día en que se hicieron.


BEGIN TRY
    DECLARE @idOrden INT = 1;
    DECLARE @diaPedido VARCHAR(15);
    DECLARE @mensajePromo VARCHAR(100);

    -- Obtener el día de la semana del pedido
    SELECT @diaPedido = DATENAME(WEEKDAY, fechaOrdenServicio)
    FROM ordenServicio
    WHERE idOrdenServicio = @idOrden;

    -- Verificamos si es de LUNES A MIERCOLES
    SELECT @mensajePromo =
        CASE 
            WHEN @diaPedido IN ('Lunes', 'Martes', 'Miércoles') THEN 
                ':) ¡Promo activa! Pedido entre semana = bebida GRATIS :)'
            ELSE 
                '⛔ Promo no válida: los fines de semana no hay bebida gratis 😢'
        END;

    SELECT @mensajePromo AS PromoBebidaGratis;

END TRY
BEGIN CATCH
    SELECT '❌ Error al evaluar la promoción: ' + ERROR_MESSAGE() AS PromoBebidaGratis;
END CATCH;

SELECT 
    c.nombresCliente + ' ' + c.apellidosCliente AS NombreCliente,
    o.fechaOrdenServicio,
    DATENAME(WEEKDAY, o.fechaOrdenServicio) AS DiaSemana
FROM ordenServicio o
INNER JOIN cliente c ON o.idCliente = c.idCliente
ORDER BY o.fechaOrdenServicio;


----------------------------------------------------------


--Este código en SQL Server valida si un cliente tiene permiso para realizar un pedido en un restaurante específico, dependiendo de su rol universitario. Primero, obtiene el rol del cliente consultando su ID en la tabla `cliente` y relacionándolo con la tabla `rolUniversitario`. Luego, usa una estructura `CASE` para definir un mensaje según las condiciones: si el restaurante es el número 3 y el cliente es "Administrativo", se permite el pedido; si no es administrativo, se deniega; y si es otro restaurante, se permite sin restricciones. Finalmente, el mensaje correspondiente se imprime con `PRINT`.



DECLARE @idCliente INT = 30;  -- Cliente que hace el pedido
DECLARE @idRestaurante INT = 3;  -- Restaurante donde quiere comprar
DECLARE @rolCliente VARCHAR(100);
DECLARE @mensaje VARCHAR(200);

-- Obtenemos el rol del cliente
SELECT @rolCliente = ru.nombreRolUniversitario
FROM cliente c
JOIN rolUniversitario ru ON c.idRolUniversitario = ru.idRolUniversitario
WHERE c.idCliente = @idCliente;

-- Usamos CASE para decidir el mensaje
SET @mensaje = 
    CASE 
        WHEN @idRestaurante = 3 AND @rolCliente = 'Administrativo' THEN
            '✅ Pedido permitido: cliente administrativo autorizado en restaurante 3.'
        WHEN @idRestaurante = 3 AND @rolCliente <> 'Administrativo' THEN
            '❌ Pedido denegado: solo administrativos pueden comprar en este restaurante.'
        ELSE
            '✅ Pedido permitido en restaurante sin restricción de rol.'
    END;

-- Mostramos el mensaje
PRINT @mensaje;






 

