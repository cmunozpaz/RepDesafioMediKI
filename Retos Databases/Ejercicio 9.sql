--select name from TPersonaje

--select * from TPersonaje





-- Función para contar letras repetidas y generar el detalle
CREATE FUNCTION dbo.ContarLetrasRepetidas(@Nombre NVARCHAR(50))
RETURNS @Resultado TABLE (CountLetrasRepetidas INT, Detalle NVARCHAR(200))
AS
BEGIN
    DECLARE @CountLetrasRepetidas INT = 0;
    DECLARE @Detalle NVARCHAR(200) = '';
    DECLARE @CharCounts TABLE (Char NVARCHAR(1), Count INT);

    -- Contar la frecuencia de cada carácter en el nombre
    INSERT INTO @CharCounts (Char, Count)
    SELECT C.Char, COUNT(*) AS Count
    FROM (SELECT SUBSTRING(@Nombre, Number, 1) AS Char
          FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS Number
                FROM master.dbo.spt_values) AS Numbers
          WHERE Number <= LEN(@Nombre)) AS C
    GROUP BY C.Char;

    -- Generar el detalle y contar las letras repetidas
    SELECT @CountLetrasRepetidas = @CountLetrasRepetidas + 1,
           @Detalle = @Detalle + CASE WHEN @Detalle = '' THEN '' ELSE ', ' END + C.Char + ':' + CAST(C.Count AS NVARCHAR)
    FROM @CharCounts AS C
    WHERE C.Count > 1;

    -- Insertar el resultado en la tabla de resultados
    INSERT INTO @Resultado (CountLetrasRepetidas, Detalle)
    VALUES (@CountLetrasRepetidas, @Detalle);

    RETURN;
END;





-- Crear una tabla temporal para almacenar los resultados
CREATE TABLE #NombreRepetidos (
    Nombre NVARCHAR(50),
    CountLetrasRepetidas INT,
    Detalle NVARCHAR(200)
);

-- Lista de nombres
DECLARE @Nombres TABLE (Nombre NVARCHAR(50));
insert into @Nombres
select name from TPersonaje





-- Procesar cada nombre y almacenar los resultados en la tabla temporal
DECLARE @Nombre NVARCHAR(50);
DECLARE @CountLetrasRepetidas INT;
DECLARE @Detalle NVARCHAR(200);

DECLARE NombresCursor CURSOR FOR SELECT Nombre FROM @Nombres;
OPEN NombresCursor;
FETCH NEXT FROM NombresCursor INTO @Nombre;

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @CountLetrasRepetidas = CountLetrasRepetidas, @Detalle = Detalle
    FROM dbo.ContarLetrasRepetidas(@Nombre);

    INSERT INTO #NombreRepetidos (Nombre, CountLetrasRepetidas, Detalle)
    VALUES (@Nombre, @CountLetrasRepetidas, @Detalle);

    FETCH NEXT FROM NombresCursor INTO @Nombre;
END;

CLOSE NombresCursor;
DEALLOCATE NombresCursor;

-- Seleccionar los resultados finales
SELECT * FROM #NombreRepetidos;

-- Limpiar la tabla temporal
DROP TABLE #NombreRepetidos;
