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

SELECT nombre, 
         nota 
FROM c23668_escuelas.alumnos
WHERE nota >=7 and nota <=10;

# 6) Repetir el ejercicio anterior, utilizando BETWEEN



# 7) Mostrar el nombre, la localidad y la provincia de aquellas 
# escuelas situadas en Buenos Aires o Jujuy



# 7b) Mostrar el nombre, la localidad y la provincia de aquellas 
# escuelas situadas en Buenos Aires o Jujuy USANDO IN


# SINTAXIS BÁSICA: SELECT…FROM + USO DE LIKE, NOT LIKE Y %

# 8) Mostrar todos los datos de los alumnos llamados Minna Klauber



# 9) Repetir el ejercicio anterior, pero con aquellos que no se 
# llamen Minna Klauber

# 10) Mostrar todos los datos de los alumnos cuyo nombre 
# comience con Ma (no es case sensitive)


# 11) Mostrar todos los datos de los alumnos cuyo nombre termine con er

# 12) Mostrar todos los datos de los alumnos cuyo nombre contenga tt

-- USOS DE JOIN Y ALIAS PARA TABLAS Y CAMPOS
-- 13) Mostrar el legajo, el nombre del alumno y el nombre de la 
-- escuela de todos los alumnos



-- 14a) Modificar el ejercicio anterior utilizando alias de tablas 
--ALIAS


-- 14b) Modificar el ejercicio anterior utilizando alias de tablas y columnas de modo tal que los datos se muestren


-- 15) Mostrar todos los alumnos, tengan o no escuela asignada.


-- 16) Mostrar todas las escuelas con el nombre de cada alumno
-- (aunque no tengan escuela asignada).



-- 16b) ¿Hay escuelas que no tengan alumnos asignados?


--Como todas las escuelas tienen alumnos, el query de arriba no me devuelve data

-- Ejercicios extras:

-- A) Mostrar los nombres y notas de los alumnos de la escuela "Normal 1"
   -- ordenado alfabéticamente

-- B) Mostrar el nombre y nota de los alumnos de Buenos Aires que reprobaron (nota por debajo de 6)
-- Ordenarlos desde la nota más alta a la más baja.



# USO DE IS NULL / IS NOT NULL

# 17) Mostrar todos los datos de los alumnos que tengan notas.



# 18) Mostrar todos los datos de los alumnos que no tengan notas.



# 18b) Mostrar legajo, nombre y nota de los alumnos que no tengan escuela

--Aprovechamos a ver uso de ALIS Y ORDER BY



-- ALTER TABLE
-- 19) Realizar lo siguiente:
--  a) Agregar a través de Alter Table una columna en la tabla escuelas 
-- llamada “Partido”, a la derecha de Localidad con una cadena vacía 
-- como valor por defecto (armar la sentencia a través de Alter Table 
-- y ejecutar desde la consulta).


-- ALTER TABLE
-- 19) Realizar lo siguiente:
-- c) Eliminar esa columna utilizando Alter Table, no es necesario 
-- ejecutarlo desde la consulta.


-- INSERT STATEMENT (operación a nivel de registro)
-- 20) Agregar una nueva escuela utilizando Insert Statement 
-- (no agregar el ID). Ejecutar desde la consulta:

-- 21) Utilizando Create Statement duplicar la tabla Alumnos. 


-- USO DE DISTINCT



--VS


-- LIMIT Y ORDER BY
# 22) Obtener un ranking de las primeras 3 escuelas de mayor capacidad.



# 22b) Obtener las escuelas que en su nombre tienen la palabra "Nro" y ordenarlas por capacidad de forma ascendente



# 22c) Modificar el query anterior para:
   --i) Mostrar la escuela que tiene menor capacidad
   --ii)Mostrar la escuela que tiene mayor capacidad
   --iii) Mostrar la escuela que está en el medio de capacidad

--i)



--ii)


--iii) Mostrar la escuela que está en el medio de capacidad

 --LIMIT DESDE TAL REGISTRO, TANTOS REGISTROS

-- FUNCIONES DE AGREGACIÓN Y AGRUPAMIENTO / USO DE IN
-- 23) Contar la cantidad de alumnos de la tabla homónima. 
-- Llamar a la columna “Cantidad de alumnos”.



-- Cuando hago COUNT(columna) no cuenta los NULLS, en cambio COUNT(*) sí

-- 24) Repetir la consulta anterior 
-- consultando solamente los alumnos cuya nota sea menor a 7.


-- 25) Obtener la capacidad total de las escuelas 
-- de la provincia de Buenos Aires


# 26) Repetir el ejercicio anterior pero solamente 
# con las escuelas de Córdoba y Jujuy

# 27) Obtener el promedio de notas de los alumnos aprobados con más de 7



# 28) Obtener la capacidad máxima y la capacidad mínima de alumnos


# 29) Obtener la total de capacidad de las escuelas por provincia

 # 30) Obtener la cantidad de alumnos por grado


# 30b) Pregunta extra. ¿Cuántos grados tienen las escuelas?


--VS



# 31) Obtener para cada escuela: cantidad de alumnos,
-- promedio de notas, nota maxima y nota minima. Mostrar escuela con mayor promedio primero


# 31b) Mostrar lo mismo que el ejercicio anterior pero sólo para las escuelas que tengan más de 5 alumnos



# 31c) Mostrar lo mismo que el ejercicio anterior (31b) pero sin contar las escuelas de Buenos Aires



# DIFERENCIAS ENTRE HAVING Y WHERE
# 32) Mostrar las escuelas y la nota
# promedio para cada una siempre y cuando sean mayores o iguales a 7.


--Este query no muestra esto, ya que saca promedios solo para notas
--mayores a 7.


--Este sí lo muestra porque promedia todo y luego filtra (having)


# SUBCONSULTAS
# 33) Mostrar la información de las escuelas cuyos alumnos 
# tengan una nota igual a 10, utilizando una subconsulta.



--Utilizando subconsultas



#34) Encontrar las escuelas de la provincia de BS AS que tiene una capacidad superior al promedio de escuelas de la provincia.


# 35) Mostrar la nota que aparece más veces en cada escuela.


-- For más amigable


#36) Mostrar la cantidad de alumnos por provincia y el porcentaje que representan del total de alumnos



--Otras funciones

#37) Mostrar cuántas veces aparece cada sufijo en los correos electrónicos de los alumnos, desde el que más aparece al que menos

