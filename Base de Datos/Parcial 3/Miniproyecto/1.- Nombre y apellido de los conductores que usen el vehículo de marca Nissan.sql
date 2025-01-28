/* 1.- Nombre y apellido de los conductores que usen el vehículo de marca Nissan */

SELECT c.nombre_conductor, c.apellido_conductor
FROM Conductor c
JOIN Vehiculo v ON c.id_conductor = v.id_conductor
WHERE v.marca_vehiculo = 'Nissan';