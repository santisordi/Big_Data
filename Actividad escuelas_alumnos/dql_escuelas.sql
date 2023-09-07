-- SINTAXIS BÁSICA: SELECT…FROM + USO DE WHERE, AND, OR, BETWEEN

# 1) Seleccionar todos los datos de la tabla alumnos

SELECT * 
FROM c23668_escuelas.alumnos;

# 2) Seleccionar solamente el legajo y el nombre de los alumnos:

SELECT legajo, nombre 
FROM c23668_escuelas.alumnos;

# 3) Mostrar todos los datos de aquellos alumnos aprobados 
#(con notas mayores o iguales a 7)

SELECT * 
FROM c23668_escuelas.alumnos 
WHERE nota >= 7;

# 4) Mostrar el id y el nombre de aquellas escuelas cuya 
# capacidad sea inferior a 200 (no mostrar la columna capacidad).

SELECT id, nombre
FROM c23668_escuelas.escuelas
WHERE capacidad < 200;

# 5) Mostrar el nombre y la nota de aquellos alumnos cuya nota 
# se encuentre entre 7 y 10 (inclusive)

SELECT nombre,nota
FROM c23668_escuelas.alumnos 
WHERE nota >=7 AND nota<=10;

# 6) Repetir el ejercicio anterior, utilizando BETWEEN

SELECT nombre,nota
FROM c23668_escuelas.alumnos 
WHERE nota BETWEEN 7 AND 10;

# 7) Mostrar el nombre, la localidad y la provincia de aquellas 
# escuelas situadas en Buenos Aires o Jujuy

SELECT nombre, localidad, provincia
FROM c23668_escuelas.escuelas
WHERE provincia = 'Buenos Aires' OR provincia = 'Jujuy';

# 7b) Mostrar el nombre, la localidad y la provincia de aquellas 
# escuelas situadas en Buenos Aires o Jujuy USANDO IN

SELECT nombre, localidad, provincia
FROM c23668_escuelas.escuelas
WHERE provincia IN ('Buenos Aires','Jujuy');

# SINTAXIS BÁSICA: SELECT…FROM + USO DE LIKE, NOT LIKE Y %

# 8) Mostrar todos los datos de los alumnos llamados Minna Klauber

SELECT * 
FROM c23668_escuelas.alumnos
WHERE nombre LIKE "Minna Klauber";

# 9) Repetir el ejercicio anterior, pero con aquellos que no se 
# llamen Minna Klauber

SELECT * 
FROM c23668_escuelas.alumnos
WHERE nombre NOT LIKE "Minna Klauber";

# 10) Mostrar todos los datos de los alumnos cuyo nombre 
# comience con Ma (no es case sensitive)

SELECT * 
FROM c23668_escuelas.alumnos
WHERE nombre LIKE "Ma%";

# 11) Mostrar todos los datos de los alumnos cuyo nombre termine con er

SELECT * 
FROM c23668_escuelas.alumnos
WHERE nombre LIKE "%er";

# 12) Mostrar todos los datos de los alumnos cuyo nombre contenga tt

SELECT * 
FROM c23668_escuelas.alumnos
WHERE nombre LIKE "%tt%";


-- USOS DE JOIN Y ALIAS PARA TABLAS Y CAMPOS
-- 13) Mostrar el legajo, el nombre del alumno y el nombre de la 
-- escuela de todos los alumnos

SELECT alumnos.legajo,
       alumnos.nombre,
       escuelas.nombre
  FROM c23668_escuelas.alumnos
 INNER JOIN c23668_escuelas.escuelas
    ON alumnos.id_escuela = escuelas.id


-- 14a) Modificar el ejercicio anterior utilizando alias de tablas 
--ALIAS

SELECT a.legajo,
       a.nombre,
       e.nombre
  FROM c23668_escuelas.alumnos AS a
 INNER JOIN c23668_escuelas.escuelas AS e
    ON a.id_escuela = e.id

-- 14b) Modificar el ejercicio anterior utilizando alias de tablas y columnas de modo tal que los datos se muestren

SELECT a.legajo AS "Legajo",
       a.nombre AS "Estudiante",
       e.nombre AS "Escuela"
  FROM c23668_escuelas.alumnos AS a
 INNER JOIN c23668_escuelas.escuelas AS e
    ON a.id_escuela = e.id

-- 15) Mostrar todos los alumnos, tengan o no escuela asignada.

SELECT a.legajo AS "Legajo",
       a.nombre AS "Estudiante",
       e.nombre AS "Escuela"
  FROM c23668_escuelas.alumnos AS a
 LEFT JOIN c23668_escuelas.escuelas AS e
    ON a.id_escuela = e.id


-- 16) Mostrar todas las escuelas con el nombre de cada alumno
-- (aunque no tengan escuela asignada).

SELECT e.*,
       a.nombre AS "Estudiante"
FROM c23668_escuelas.escuelas AS e 
RIGHT JOIN c23668_escuelas.alumnos AS a       
ON a.id_escuela = e.id

-- 16b) ¿Hay escuelas que no tengan alumnos asignados?

SELECT e.nombre
FROM c23668_escuelas.escuelas AS e 
LEFT JOIN c23668_escuelas.alumnos AS a
ON a.id_escuela = e.id  
WHERE e.id IS NULL  

--Como todas las escuelas tienen alumnos, el query de arriba no me devuelve data

SELECT a.nombre
FROM c23668_escuelas.escuelas AS e 
RIGHT JOIN c23668_escuelas.alumnos AS a
ON a.id_escuela = e.id 
WHERE e.id IS NULL


select * from c23668_escuelas.escuelas
-- Ejercicios extras:

-- A) Mostrar los nombres y notas de los alumnos de la escuela "Normal 1"
   -- ordenado alfabéticamente

SELECT a.nombre AS Estudiante,
       a.nota AS Calificacion
FROM c23668_escuelas.alumnos AS a
INNER JOIN c23668_escuelas.escuelas AS e
ON a.id_escuela = e.id 
WHERE e.nombre LIKE "Normal 1"
ORDER BY Estudiante

-- B) Mostrar el nombre y nota de los alumnos de Buenos Aires que reprobaron (nota por debajo de 6)
-- Ordenarlos desde la nota más alta a la más baja.

SELECT a.nombre AS Estudiante,
       a.nota AS Calificacion
FROM c23668_escuelas.alumnos AS a
INNER JOIN c23668_escuelas.escuelas AS e
ON a.id_escuela = e.id 
WHERE e.provincia = "Buenos Aires" AND a.nota < 6
ORDER BY Calificacion DESC


# USO DE IS NULL / IS NOT NULL

# 17) Mostrar todos los datos de los alumnos que tengan notas.

SELECT * 
FROM c23668_escuelas.alumnos
WHERE nota IS NOT NULL

# 18) Mostrar todos los datos de los alumnos que no tengan notas.

SELECT * 
FROM c23668_escuelas.alumnos
WHERE nota IS NULL

# 18b) Mostrar legajo, nombre y nota de los alumnos que no tengan escuela

--Aprovechamos a ver uso de ALIS Y ORDER BY

SELECT 
     legajo AS "Legajo", 
     nombre AS "Nombre", 
     nota AS "Calificacion"
FROM c23668_escuelas.alumnos
WHERE id_escuela IS NULL
ORDER BY Calificacion DESC

-- ALTER TABLE
-- 19) Realizar lo siguiente:
--  a) Agregar a través de Alter Table una columna en la tabla escuelas 
-- llamada “Partido”, a la derecha de Localidad con una cadena vacía 
-- como valor por defecto (armar la sentencia a través de Alter Table 
-- y ejecutar desde la consulta).

ALTER TABLE c23668_escuelas.escuelas 
ADD COLUMN partido VARCHAR(20) NULL DEFAULT '' AFTER localidad;

-- ALTER TABLE
-- 19) Realizar lo siguiente:
-- c) Eliminar esa columna utilizando Alter Table, no es necesario 
-- ejecutarlo desde la consulta.

ALTER TABLE c23668_escuelas.escuelas 
DROP COLUMN partido;

-- INSERT STATEMENT (operación a nivel de registro)
-- 20) Agregar una nueva escuela utilizando Insert Statement 
-- (no agregar el ID). Ejecutar desde la consulta:

-- 21) Utilizando Create Statement duplicar la tabla Alumnos. 

USE c23668_escuelas;
CREATE TABLE `alumnos_sin_mail` AS
SELECT id, id_escuela,legajo,nombre, nota, grado
FROM c23668_escuelas.alumnos;

-- USO DE DISTINCT

SELECT provincia
FROM c23668_escuelas.escuelas

--VS

SELECT DISTINCT provincia
FROM c23668_escuelas.escuelas


-- LIMIT Y ORDER BY
# 22) Obtener un ranking de las primeras 3 escuelas de mayor capacidad.

SELECT * FROM c23668_escuelas.escuelas
ORDER BY capacidad DESC
LIMIT 3

# 22b) Obtener las escuelas que en su nombre tienen la palabra "Nro" y ordenarlas por capacidad de forma ascendente

SELECT * FROM c23668_escuelas.escuelas
WHERE nombre LIKE "%Nro%"
ORDER BY capacidad 

# 22c) Modificar el query anterior para:
   --i) Mostrar la escuela que tiene menor capacidad
   --ii)Mostrar la escuela que tiene mayor capacidad
   --iii) Mostrar la escuela que está en el medio de capacidad

--i)

SELECT * FROM c23668_escuelas.escuelas
WHERE nombre LIKE "%Nro%"
ORDER BY capacidad 
LIMIT 1

--ii)

SELECT * FROM c23668_escuelas.escuelas
WHERE nombre LIKE "%Nro%"
ORDER BY capacidad DESC
LIMIT 1

--iii) Mostrar la escuela que está en el medio de capacidad

SELECT * FROM c23668_escuelas.escuelas
WHERE nombre LIKE "%Nro%"
ORDER BY capacidad DESC
LIMIT 1,2 --LIMIT DESDE TAL REGISTRO, TANTOS REGISTROS

-- FUNCIONES DE AGREGACIÓN Y AGRUPAMIENTO / USO DE IN
-- 23) Contar la cantidad de alumnos de la tabla homónima. 
-- Llamar a la columna “Cantidad de alumnos”.

SELECT COUNT(*) AS Cantidad_de_alumnos
FROM c23668_escuelas.alumnos

-- Cuando hago COUNT(columna) no cuenta los NULLS, en cambio COUNT(*) sí

SELECT COUNT(email) AS Cantidad_de_mails
FROM c23668_escuelas.alumnos

-- 24) Repetir la consulta anterior 
-- consultando solamente los alumnos cuya nota sea menor a 7.

SELECT COUNT(*) AS Cantidad_de_alumnos
FROM c23668_escuelas.alumnos
WHERE nota < 7;

SELECT COUNT(*) AS Cantidad_de_alumnos
FROM c23668_escuelas.alumnos
WHERE nota >= 7;

SELECT COUNT(*) AS Cantidad_de_alumnos
FROM c23668_escuelas.alumnos
WHERE nota IS NULL;

-- 25) Obtener la capacidad total de las escuelas 
-- de la provincia de Buenos Aires

SELECT SUM(capacidad) AS Capacidad_total_BSAS
FROM c23668_escuelas.escuelas
WHERE provincia = "Buenos Aires"

SELECT * 
FROM c23668_escuelas.escuelas
WHERE provincia IN ("Córdoba","Jujuy") 

# 26) Repetir el ejercicio anterior pero solamente 
# con las escuelas de Córdoba y Jujuy

SELECT SUM(capacidad) AS Capacidad_total_BSAS
FROM c23668_escuelas.escuelas
WHERE provincia IN ("Córdoba","Jujuy") 

# 27) Obtener el promedio de notas de los alumnos aprobados con más de 7

SELECT AVG(nota) AS Promedio
FROM c23668_escuelas.alumnos
WHERE nota > 7

# 28) Obtener la capacidad máxima y la capacidad mínima de alumnos

SELECT MAX(capacidad) AS "Capacidad_maxima",
       MIN(capacidad) AS "Capacidad_minima"
  FROM c23668_escuelas.escuelas 

# 29) Obtener la total de capacidad de las escuelas por provincia

SELECT provincia,
       SUM(capacidad) AS Suma_de_capacidad
 FROM c23668_escuelas.escuelas
 GROUP BY provincia
 ORDER BY  Suma_de_capacidad DESC  

 # 30) Obtener la cantidad de alumnos por grado

 SELECT grado,
        COUNT(grado) AS cantidad_alumnos
FROM c23668_escuelas.alumnos
GROUP BY grado

#30b) Pregunta extra. ¿Cuántos grados tienen las escuelas?

SELECT COUNT(grado) AS cantidad
FROM c23668_escuelas.alumnos

--VS

SELECT COUNT(DISTINCT grado) AS cantidad
FROM c23668_escuelas.alumnos


