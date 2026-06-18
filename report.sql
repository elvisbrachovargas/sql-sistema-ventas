-- =====================================
-- REPORTE SQL - CHALLENGER SISTEMA VENTAS
-- =====================================

-- 1. Mostrar todos los clientes registrados
select * from clientes;

-- 2. Mostrar todos los productos disponibles
select * from productos;


-- 3. Mostrar todas las ventas realizadas
select * from ventas;


-- 4. Mostrar solo nombre y email de clientes
select nombre, email from clientes;


-- 5. Mostrar solo nombre y precio de productos
select nombre, precio from productos;

-- 6. Productos con precio mayor a 50000
select nombre, precio from productos
where precio > 50000;


-- 7. Ventas realizadas el 2026-04-02
select * from ventas
where fecha = '2026-04-02';


-- 8. Productos ordenados de mayor a menor precio
select nombre, precio from productos 
order by precio desc;

-- 9. Clientes ordenados por nombre
select nombre from clientes 
order by nombre;


-- 10. Detalles de venta con cantidad >= 2
select * from detalle_venta
where cantidad >= 2;

-- 11. Total de clientes
SELECT COUNT(*) AS total_clientes 
FROM clientes;


-- 12. Total de productos
select count(*) as total_productos
from productos;


-- 13. Total de ventas
select count(*) as total_ventas
from ventas;


-- 14. Precio promedio de productos
SELECT AVG(precio) AS precio_promedio 
FROM productos;


-- 15. Suma total de precios de productos
select sum(precio) as precio_total
from productos;


-- 16. Mostrar venta + nombre del cliente + fecha
SELECT v.id_venta, c.nombre, v.fecha 
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente;


-- 17. Mostrar detalle de ventas con id_venta + nombre producto + cantidad
select dv.id_venta, p.nombre, dv.cantidad
from detalle_venta dv
JOIN productos p ON dv.id_producto = p.id_producto;


-- 18. Mostrar nombre del cliente + id de venta + fecha
select c.nombre, v.id_venta, v.fecha
from clientes c 
join ventas v ON c.id_cliente = v.id_cliente;


-- 19. Mostrar nombre del producto + cantidad vendida + id de venta
select p.nombre, dv.cantidad, dv.id_venta
from productos p 
join detalle_venta dv ON p.id_producto = dv.id_producto;


-- 20. Mostrar cuántas ventas ha realizado cada cliente
SELECT c.nombre, COUNT(v.id_venta) AS total_ventas
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.nombre;


-- 21. Mostrar solo los clientes con más de una venta
SELECT c.nombre, COUNT(v.id_venta) AS total_ventas
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente 
GROUP BY c.nombre
HAVING COUNT(v.id_venta) > 1;


-- 22. Mostrar cuántas veces aparece cada producto en detalle_venta
SELECT p.nombre AS producto, COUNT(dv.id_producto) AS veces_aparece
FROM productos p
JOIN detalle_venta dv ON p.id_producto = dv.id_producto
GROUP BY p.nombre;

-- 23. Mostrar solo los productos que aparecen más de una vez
SELECT p.nombre AS producto, COUNT(dv.id_producto) AS veces_aparece
FROM productos p
JOIN detalle_venta dv ON p.id_producto = dv.id_producto
GROUP BY p.nombre
HAVING COUNT(dv.id_producto) > 1;

-- 24. Mostrar las ventas que tienen más de un producto asociado
SELECT id_venta, COUNT(id_producto) AS total_productos
FROM detalle_venta
GROUP BY id_venta
HAVING COUNT(id_producto) > 1;


-- 25. Mostrar clientes cuya suma total de unidades compradas sea mayor a 2
SELECT c.nombre AS cliente, SUM(dv.cantidad) AS total_unidades
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
GROUP BY c.nombre
HAVING SUM(dv.cantidad) > 2;

-- 26. Consulta trampa que no devuelva resultados
-- Explicar por qué el resultado vacío es correcto

SELECT * FROM productos 
WHERE precio > 100 AND precio < 50;

-- El resultado vacío es correcto ya que le estoy diciendo a SQL que me dé un precio que sea mayor a 100 y a la vez que sea menor a 50.
-- Entonces el programa no arroja filas ya que ambas condiciones deben cumplirse simultáneamente en cada registro, lo cual es matemáticamente imposible.
