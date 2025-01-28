/* 
1.- Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. 
El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. 
El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
*/

SELECT d.nombre AS nombre_departamento, p.apellido1, p.apellido2, p.nombre AS nombre_profesor
FROM PERSONA p
LEFT JOIN PROFESOR prof ON p.id = prof.id_profesor
LEFT JOIN DEPARTAMENTO d ON prof.id_departamento = d.id
ORDER BY nombre_departamento ASC, p.apellido1 ASC, p.apellido2 ASC, nombre_profesor ASC;
	
/*
2.-Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
*/

SELECT nombre, apellido1, apellido2
FROM PERSONA
WHERE tipo = 'alumno' AND telefono IS NULL
ORDER BY apellido1, apellido2, nombre;

/* Para Comprobar que en verdad el teléfono no se ha dado de alta, se puede comprobar ejecutando el siguiente Script:*/
SELECT nombre, apellido1, apellido2,telefono
FROM PERSONA
WHERE tipo = 'alumno' AND telefono IS NULL
ORDER BY apellido1, apellido2, nombre;

/* 
3.-Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. 
Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados.
Estos departamentos también tienen que aparecer en el listado
*/

SELECT d.nombre AS nombre_departamento, COUNT(prof.id_profesor) AS numero_profesores
FROM DEPARTAMENTO d
LEFT JOIN PROFESOR prof ON d.id = prof.id_departamento
GROUP BY d.id, d.nombre
ORDER BY nombre_departamento ASC;

/*
4.-Devuelve un listado con los departamentos que no tienen profesores asociados
*/

SELECT d.nombre AS nombre_departamento
FROM DEPARTAMENTO d
LEFT JOIN PROFESOR prof ON d.id = prof.id_departamento
WHERE prof.id_profesor IS NULL;

/*
5.-Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el 
Grado en Ingeniería Informática (Plan 2015)
*/

SELECT d.nombre AS nombre_departamento
FROM DEPARTAMENTO d
JOIN PROFESOR prof ON d.id = prof.id_departamento
JOIN ASIGNATURA a ON prof.id_profesor = a.id_profesor
JOIN GRADO g ON a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

/*Se puede Observar que el departamento de Informática, se repite, por lo tanto para que el valor no se repita, agrego la clausula DISTINCT en el SELECT*/
SELECT DISTINCT d.nombre AS nombre_departamento
FROM DEPARTAMENTO d
JOIN PROFESOR prof ON d.id = prof.id_departamento
JOIN ASIGNATURA a ON prof.id_profesor = a.id_profesor
JOIN GRADO g ON a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

SELECT * 
FROM PROFESOR

SELECT *
FROM PERSONA

SELECT *
FROM DEPARTAMENTO
