--Este código calcula el precio final de un menú para un cliente, teniendo en cuenta su rol, la cantidad de compras completadas y las promociones disponibles. Primero, verifica si el cliente tiene un rol especial y si cumple con los criterios para obtener descuentos o un plato gratis. Si el cliente tiene el rol especial y ha completado al menos 15 compras, el precio final es gratis. Si tiene al menos 10 compras, recibe un 20% de descuento. Si tiene el rol especial pero menos de 10 compras, recibe un descuento del 5%. De lo contrario, paga el precio completo del menú. Es un enfoque lógico para premiar la fidelidad de ciertos clientes mediante descuentos dinámicos.

GO
-- CASE para ajustar precio del almuerzo según clientes frecuentes
DECLARE @precioAlmuerzo DECIMAL(10,2) = 10000;
DECLARE @nuevoPrecio DECIMAL(10,2);
DECLARE @idMenuComida INT = 3;
DECLARE @mensaje VARCHAR(200);
DECLARE @hayClientesFrecuentes BIT;

-- Verificamos si hay clientes frecuentes
SELECT @hayClientesFrecuentes = 
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM cliente
            WHERE nombresCliente IN ('Valentina', 'Mateo')
        )
        THEN 1 ELSE 0
    END;

-- Definimos precio y mensaje con CASE
SET @nuevoPrecio = 
    CASE @hayClientesFrecuentes
        WHEN 1 THEN 3000
        ELSE @precioAlmuerzo
    END;

SET @mensaje = 
    CASE @hayClientesFrecuentes
        WHEN 1 THEN '🎉 Estos clientes tienen un cupón. El almuerzo cuesta: $' + CAST(@nuevoPrecio AS VARCHAR)
        ELSE '💸 Sin cupón. El almuerzo cuesta: $' + CAST(@nuevoPrecio AS VARCHAR)
    END;

-- Actualizamos precio
UPDATE precioComida
SET precioPrecioComida = @nuevoPrecio
WHERE idMenuComida = @idMenuComida;

-- Mostramos mensaje
SELECT @mensaje AS Mensaje;
GO


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
DECLARE @estadoPedido VARCHAR(20);
DECLARE @idOrden INT = 100;  -- Supongamos que ya tenemos un ID de orden creado previamente

-- Obtenemos el rol del cliente
SELECT @rolCliente = ru.nombreRolUniversitario
FROM cliente c
JOIN rolUniversitario ru ON c.idRolUniversitario = ru.idRolUniversitario
WHERE c.idCliente = @idCliente;

-- Usamos CASE para decidir el mensaje y el estado
SET @mensaje = 
    CASE 
        WHEN @idRestaurante = 3 AND @rolCliente = 'Administrativo' THEN
            '✅ Pedido permitido: cliente administrativo autorizado en restaurante 3.'
        WHEN @idRestaurante = 3 AND @rolCliente <> 'Administrativo' THEN
            '❌ Pedido denegado: solo administrativos pueden comprar en este restaurante.'
        ELSE
            '✅ Pedido permitido en restaurante sin restricción de rol.'
    END;

SET @estadoPedido =
    CASE 
        WHEN @idRestaurante = 3 AND @rolCliente = 'Administrativo' THEN 'Permitido'
        WHEN @idRestaurante = 3 AND @rolCliente <> 'Administrativo' THEN 'Denegado'
        ELSE 'Permitido'
    END;

-- Actualizamos el estado del pedido
UPDATE ordenServicio
SET estadoOrden = @estadoPedido
WHERE idOrdenServicio = @idOrden;

-- Mostramos el mensaje
PRINT @mensaje;







 

