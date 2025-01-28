SELECT NOMBRECIA,CELULAR,FIJO
FROM CLIENTES
WHERE DIRECCIONCLI = 'AV.AMAZONAS';

/* 3.- ID cliente, Ruc, Nombre, contacto, ordenados por direcciÃ³n y nombre */

SELECT DIRECCIONCLI,NOMBRECIA, CLIENTEID, CEDULA_RUC,  NOMBRECONTACTO
FROM CLIENTES
ORDER BY DIRECCIONCLI ASC, NOMBRECIA DESC;

/* Valores unicos (no repetidos) */

SELECT DISTINCT DIRECCIONCLI
FROM CLIENTES;

/* Otro Metodo */
SELECT DISTINCT DIRECCIONCLI
FROM CLIENTES
GROUP BY DIRECCIONCLI;

/*CUANTOS CLIENTES TENGO POR DIRECCION*/
SELECT DIRECCIONCLI, COUNT(*) AS TOTAL_CLIENTES
FROM CLIENTES
GROUP BY DIRECCIONCLI;

/*Inserto Datos*/

SELECT *
FROM CLIENTES
INSERT INTO CLIENTES (clienteid,cedula_ruc,nombrecia,nombrecontacto,direccioncli,fax,email,celular,fijo) VALUES (16,'1718974584','UDLA','MATEO VINUEZA','AV.6 DICIEMBRE','' ,'' ,'' ,'')

/* Leo los datos*/

SELECT NOMBRECIA,DIRECCIONCLI
FROM clientes
ORDER BY DIRECCIONCLI asc, nombrecia asc;

/* 4.- Las Direcciones en donde tengo registrado clientes deben repetirse una sola vez*/

SELECT DISTINCT DIRECCIONCLI
FROM CLIENTES
GROUP BY DIRECCIONCLI;


/* 5.- Contar Cuantos Clientes tengo por dirección*/

SELECT DIRECCIONCLI, COUNT(*) AS TOTAL_CLIENTES
FROM clientes
GROUP BY DIRECCIONCLI;


/* 6.- Nombre del proveedor con los productos que provee */
SELECT Prov.nombreprov, Prod.descripcion
FROM proveedores Prov, productos Prod
WHERE Prov.proveedorid=Prod.proveedorid;

