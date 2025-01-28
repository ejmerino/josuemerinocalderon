/* Todos los productos de la categoría Cosméticos */

SELECT DESCRIPCION 
FROM PRODUCTOS AS PROD JOIN CATEGORIAS AS CAT
ON PROD.categoriaid = CAT.categoriaid
WHERE nombrecat = 'COSMETICOS';

/* Mismo Resultado, de otra manera*/

SELECT PROD.DESCRIPCION
FROM CATEGORIAS CAT, PRODUCTOS PROD
WHERE CAT.CATEGORIAID = PROD.CATEGORIAID AND nombrecat = 'COSMETICOS';

/* Usando Subconsultas */

SELECT DESCRIPCION
FROM PRODUCTOS
WHERE categoriaid IN (SELECT CATEGORIAID FROM CATEGORIAS WHERE nombrecat = 'COSMETICOS');

/*Nombre de los empleados que han realizado las órdenes del cliente María Cordero*/

SELECT emp.nombre,emp.apellido
FROM empleados emp
JOIN ordenes ord ON ord.empleadoid = emp.empleadoid
JOIN clientes cli on cli.clienteid = ord.clienteid
WHERE cli.nombrecontacto = 'MARIA CORDERO';

/* Otra Manera */

SELECT nombre,apellido
FROM EMPLEADOS
WHERE empleadoid IN (SELECT empleadoid 
					 FROM ordenes 
					 WHERE clienteid IN (SELECT clienteid 
										 FROM clientes 
										 WHERE nombrecontacto = 'MARIA CORDERO'))