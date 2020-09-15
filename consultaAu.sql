-- 1. Ver los datos de los alquileres con coches españoles.
SELECT alquileres.* FROM alquileres 
INNER JOIN flota ON alquileres.matricula=flota.matricula 
WHERE flota.marca_español=TRUE;

-- 2. Ver los datos de los alquileres cuyo precio final exceda de 12000pts.
SELECT alquileres.*, (fecha_entrada-fecha_salida)*precio_diario AS precio_final
FROM alquileres
INNER JOIN flota ON alquileres.matricula=flota.matricula 
HAVING precio_final >12000;

-- 3. Ver los datos de los alquileres de los coches matriculados en la provincia de Las Palmas
SELECT alquileres.* 
FROM alquileres 
INNER JOIN flota ON flota.matricula=alquileres.matricula
INNER JOIN distribuidores ON flota.codigo_distribuidor=distribuidores.codigo_distribuidor
WHERE distribuidores.ciudad LIKE 'LAS%';

-- 4. Realizar una consulta donde me indique las veces que ha sido alquilado cada coche
SELECT matricula, COUNT(*) AS veces_alquilado FROM alquileres GROUP BY 1;
