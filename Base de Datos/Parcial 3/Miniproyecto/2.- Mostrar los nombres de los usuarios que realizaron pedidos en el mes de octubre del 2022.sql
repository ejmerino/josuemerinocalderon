/* 2.- Mostrar los nombres de los usuarios que realizaron pedidos en el mes de octubre del 2022 */

SELECT u.nombre_usuario, u.apellido_usuario
FROM Usuario u
JOIN Pedido p ON u.id_usuario = p.id_usuario
WHERE EXTRACT(YEAR FROM p.fecha_pedido) = 2022
  AND EXTRACT(MONTH FROM p.fecha_pedido) = 10;
