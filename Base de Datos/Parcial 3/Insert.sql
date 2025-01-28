SELECT *
FROM PROVEEDORES
INSERT INTO PROVEEDORES (proveedorid,nombreprov,contacto,celuprov,fijoprov) VALUES (125,'COCA COLA','WILMER BUESTAN','0987654321','2320623')

SELECT *
FROM CATEGORIAS
INSERT INTO CATEGORIAS (categoriaid,nombrecat) VALUES (1000,'')

SELECT *
FROM PRODUCTOS
INSERT INTO PRODUCTOS (productoid,proveedorid,categoriaid,descripcion,preciounit,existencia) VALUES (15, 125 ,800,'COCA COLA LIGHT',1.25,200)

