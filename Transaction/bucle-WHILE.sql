-- 1. El restaurante ha realizado una petición, es el incrementar un 15% de los precios de las comidas y bebidas.

BEGIN TRANSACTION
-- Variables que se estarán usando en el WHILE
DECLARE @idMenuComida DECIMAL(18,2), @precioActualizarComida DECIMAL(18,2), @contadorComida INT= 1;

-- Restaurante que solicita dicho ajuste de precio
DECLARE @idRestaurante INT = 1;

-- Variables generales para definir parámetros de condiciones
DECLARE totalComidas INT;

-- Obtengo la cantidad de comidas que tiene dicho restaurante
SELECT @totalComidas = COUNT(*) FROM menuComida WHERE idRestaurante = @idRestaurante;

-- Proceso de actualización de datos
WHILE @contadorComida <= @totalComidas
BEGIN
    -- Capturo del idComida
    SELECT a.idMenuComida = , b.precioPrecioComida
    FROM menuComida a 
    INNER JOIN precioComida b 
        ON b.idMenuComida = a.idMenuComida
        AND b.fechaActualizacionPrecioComida = (SELECT MAX(fechaActualizacionPrecioComida)FROM precioComida WHERE idMenuComida = a.idMenuComida)
    WHERE a.idRestaurante = 1
    ORDER BY a.idMenuComida  -- Agregar un ORDER BY para usar OFFSET
    OFFSET @contadorComida - 1 ROWS FETCH NEXT 1 ROWS ONLY;
    ;
    -- NOTA: PENDIENTE SET A LAS VARIABLES A TRABAJAR

END

--1. WHILE

-- Es para obtener una tabla general, donde pueda capturar datos concretos para luego con while cambiar sus precios
SELECT a.idRestaurante, a.idMenuComida, b.precioPrecioComida
FROM menuComida a INNER JOIN precioComida b ON b.idMenuComida = a.idMenuComida
WHERE idRestaurante = 1
ORDER BY b.fechaActualizacionPrecioComida DESC
;

-- Forma eficiente de obtener la ultima actualización de precio Comida para luego setearla
SELECT a.idRestaurante, a.idMenuComida, b.precioPrecioComida
FROM menuComida a INNER JOIN precioComida b ON b.idMenuComida = a.idMenuComida
  AND b.fechaActualizacionPrecioComida = (SELECT MAX(fechaActualizacionPrecioComida)FROM precioComida WHERE idMenuComida = a.idMenuComida)
WHERE a.idRestaurante = 1;