-- lo que se elabora aca es consultar un plato favorito de un cliente pero validamos si existe ese plato favorito del cliente en nuestros restaurantes registrados en la base de datos ya que lo que permite es que los usuarios puedan buscar exactamente lo que quieren comer 


go
-- Ejercicio IF anidado: Buscar plato favorito del cliente en restaurantes disponibles
DECLARE @idCliente INT = 2;          -- ID del cliente
DECLARE @nombrePlatoFavorito VARCHAR(100); -- Variable para almacenar nombre del plato favorito
DECLARE @encontrado BIT = 0;         -- Flag para indicar si se encontró el plato
DECLARE @mensaje VARCHAR(300);

-- Obtener el plato favorito del cliente (simulado - en una implementación real podría ser una tabla adicional)
SELECT @nombrePlatoFavorito = 'Bandeja Paisa'; -- Asumimos este es el plato favorito

-- Verificar si el cliente existe
IF EXISTS (SELECT 1 FROM cliente WHERE idCliente = @idCliente)
BEGIN
    -- Buscar el plato favorito en menús de comida disponibles
    IF EXISTS (SELECT * FROM menuComida 
              WHERE nombreMenuComida LIKE '%' + @nombrePlatoFavorito + '%')
    BEGIN
        -- Verificar si hay restaurantes que ofrecen este plato y están abiertos hoy
        IF EXISTS (SELECT 1 FROM menuComida mc 
                  INNER JOIN restaurante r ON mc.idRestaurante = r.idRestaurante
                  WHERE mc.nombreMenuComida LIKE '%' + @nombrePlatoFavorito + '%'
                  AND r.disponibilidadRestaurante > 0)
        BEGIN
            SET @encontrado = 1;
            SET @mensaje = '¡Buenas noticias! Su plato favorito "' + @nombrePlatoFavorito + 
                          '" está disponible en los siguientes restaurantes:';
                          
            SELECT @mensaje AS Mensaje, r.nombreRestaurante, r.direccionRestaurante, mc.nombreMenuComida, pc.precioPrecioComida AS Precio
            FROM menuComida mc
            INNER JOIN restaurante r ON mc.idRestaurante = r.idRestaurante
            INNER JOIN precioComida pc ON mc.idMenuComida = pc.idMenuComida
            WHERE mc.nombreMenuComida LIKE '%' + @nombrePlatoFavorito + '%'
            AND r.disponibilidadRestaurante > 0
            ORDER BY pc.precioPrecioComida ASC;
        END
        ELSE
        BEGIN
            SET @mensaje = 'Su plato favorito "' + @nombrePlatoFavorito + 
                          '" existe en el sistema pero no está disponible hoy en ningún restaurante abierto.';
            SELECT @mensaje AS Mensaje;
        END
    END
    ELSE
    BEGIN
        SET @mensaje = 'Lo sentimos, su plato favorito "' + @nombrePlatoFavorito + 
                      '" no está disponible en ningún restaurante del sistema.';
        SELECT @mensaje AS Mensaje;
    END
END
ELSE
BEGIN
    SET @mensaje = 'El cliente con ID ' + CAST(@idCliente AS VARCHAR) + ' no existe en la base de datos.';
    SELECT @mensaje AS Mensaje;
END


go