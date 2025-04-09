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


-- Este procedimiento almacenado llamado BuscarPlatoFavorito recibe como parámetro el ID de un cliente y simula obtener su plato favorito (en este caso, "Bandeja Paisa"). Primero verifica si el cliente existe en la base de datos; si no existe, devuelve un mensaje de error. Luego comprueba si ese plato existe en el menú de comidas; si no está, informa que no se encuentra en ningún restaurante. Después verifica si hay restaurantes disponibles actualmente que ofrezcan ese plato; si no los hay, muestra un mensaje indicando que el plato no está disponible hoy. Finalmente, si todas las condiciones se cumplen, retorna un mensaje positivo y una lista de los restaurantes disponibles que ofrecen el plato favorito, junto con su nombre, dirección y precio.

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



-- Este procedimiento almacenado llamado `BuscarPlatoFavorito` busca el plato favorito de un cliente (simulado como "Bandeja Paisa") y verifica si está disponible en restaurantes abiertos. Utiliza un ciclo `WHILE` con `BREAK` para ejecutar la lógica de validación de forma secuencial: primero comprueba si el cliente existe; si no, muestra un mensaje de error y sale del ciclo con `BREAK`. Luego valida si el plato está registrado en el menú y si hay restaurantes abiertos que lo ofrezcan, saliendo del ciclo si alguna condición no se cumple. Si todo es correcto, muestra un mensaje positivo junto con la lista de restaurantes que ofrecen el plato, y usa `BREAK` para finalizar el proceso exitosamente. Esta estructura permite detener la ejecución inmediatamente al encontrar una falla, haciendo el flujo más controlado.

go
CREATE PROCEDURE BuscarPlatoFavorito
    @idCliente INT
AS
BEGIN
    DECLARE @nombrePlatoFavorito VARCHAR(100);
    DECLARE @mensaje VARCHAR(300);

    -- Simulación del plato favorito
    SELECT @nombrePlatoFavorito = 'Bandeja Paisa';

    WHILE 1 = 1
    BEGIN
        -- Validar si el cliente existe
        IF NOT EXISTS (SELECT 1 FROM cliente WHERE idCliente = @idCliente)
        BEGIN
            SET @mensaje = 'El cliente con ID ' + CAST(@idCliente AS VARCHAR) + ' no existe en la base de datos.';
            SELECT @mensaje AS Mensaje;
            BREAK;
        END

        -- Validar si el plato favorito existe en el menú
        IF NOT EXISTS (SELECT 1 FROM menuComida WHERE nombreMenuComida LIKE '%' + @nombrePlatoFavorito + '%')
        BEGIN
            SET @mensaje = 'Lo sentimos, su plato favorito "' + @nombrePlatoFavorito + 
                           '" no está disponible en ningún restaurante del sistema.';
            SELECT @mensaje AS Mensaje;
            BREAK;
        END

        -- Validar si hay restaurantes abiertos que lo ofrezcan
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
            BREAK;
        END

        -- Si pasó todas las validaciones, mostrar resultados
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

        BREAK; -- Terminamos el ciclo exitosamente
    END
END
go