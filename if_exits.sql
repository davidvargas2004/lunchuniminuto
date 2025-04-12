GO
-- lo que se elabora aca es consultar un plato favorito de un cliente pero validamos si existe ese plato favorito del cliente en nuestros restaurantes registrados en la base de datos ya que lo que permite es que los usuarios puedan buscar exactamente lo que quieren comer y asi optimizar la busqueda por ellos al restaurante que ofrece el plato 


go
-- Ejercicio IF anidado: Buscar plato favorito del cliente en restaurantes disponibles
DECLARE @idCliente INT = 2;          -- ID del cliente
DECLARE @nombrePlatoFavorito VARCHAR(100); -- Variable para almacenar nombre del plato favorito
DECLARE @encontrado BIT = 0;         -- Señal para indicar si se encontró el plato o no en nuestra base de datos
DECLARE @mensaje VARCHAR(300);

-- Obtener el plato favorito del cliente (simulado - en una implementación real podría ser una tabla adicional)
SELECT @nombrePlatoFavorito = 'Bandeja Paisa'; -- Aca damos el indicativo de que plato queremos consultar

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




---------------------------------------------------

--IF EXISTS que verifica si un cliente ya ha realizado una orden en una fecha específica. Si ya existe una orden, imprime un mensaje informando que ya realizó un pedido; si no, indica que puede realizar el pedido de la fomra que guste comprar su comida.

DECLARE @idCliente INT = 5;

DECLARE @fecha DATE = CAST(GETDATE() AS DATE);  --esta funcion da el funcionamiento para poder selecionare un horario en tiempo real si se llegara hacer la peticion de un cliente en tiempo real y la convierte en formato date.
IF EXISTS (
    SELECT 1
    FROM ordenServicio
    WHERE idCliente = @idCliente AND fechaOrdenServicio = @fecha
)
BEGIN
    PRINT '❌ Ya realizaste un pedido el día de hoy.';
END
ELSE
BEGIN
    PRINT '✅ Puedes realizar un pedido.';
END




---------------------------------------------------------
--Este código en SQL Server verifica si existe un cliente con el nombre Valentina o Mateo en la base de datos. Si alguno de ellos está registrado, se les aplica un cupón especial que reduce el precio del almuerzo a $3.000; de lo contrario, el almuerzo mantiene su precio original de $10.000. La lógica se implementa con la estructura IF EXISTS, que consulta la tabla cliente para buscar esos nombres y, dependiendo del resultado, ajusta el valor de la variable @nuevoPrecio y muestra un mensaje adecuado usando PRINT.


GO
DECLARE @precioAlmuerzo DECIMAL(10,2) = 10000; -- Precio regular
DECLARE @nuevoPrecio DECIMAL(10,2);
DECLARE @idMenuComida INT = 3; --  este es el ID del almuerzo
DECLARE @mensaje VARCHAR(200);

IF EXISTS (
    SELECT 1
    FROM cliente
    WHERE nombresCliente IN ('Valentina', 'Mateo')
)
BEGIN
    SET @nuevoPrecio = 3000;
    SET @mensaje = '🎉 Estos clientes tienen un cupón. El almuerzo cuesta: $' + CAST(@nuevoPrecio AS VARCHAR);

    -- Actualizamos el precio del almuerzo
    UPDATE precioComida
    SET precioPrecioComida = @nuevoPrecio
    WHERE idMenuComida = @idMenuComida;

    SELECT @mensaje AS Mensaje;
END
ELSE
BEGIN
    SET @nuevoPrecio = @precioAlmuerzo;
    SET @mensaje = '💸 Sin cupón. El almuerzo cuesta: $' + CAST(@nuevoPrecio AS VARCHAR);

    -- Restauramos el precio normal
    UPDATE precioComida
    SET precioPrecioComida = @nuevoPrecio
    WHERE idMenuComida = @idMenuComida;

    SELECT @mensaje AS Mensaje;
END
GO





