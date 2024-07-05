# examen-sql

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```mysql
   SELECT GROUP_CONCAT(o.codigo_oficina), o.ciudad
   FROM oficina AS o
   GROUP BY o.ciudad;
   ```

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```mysql
   SELECT o.codigo_oficina, o.ciudad, o.telefono
   FROM oficina AS o
   WHERE o.pais = "españa";
   ```

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

   ```mysql
   SELECT e.nombre, CONCAT(apellido1, " ", apellido2) AS apellidos, e.email
   FROM empleado AS e
   WHERE e.codigo_jefe = 7;
   ```

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

  ```SQL
  SELECT e.puesto, e.nombre, CONCAT(apellido1, " ", apellido2) AS apellidos, e.email
  FROM empleado AS e
  WHERE e.puesto = "CEO";
  ```

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

  ```sql
  SELECT e.puesto, e.nombre, CONCAT(apellido1, " ", apellido2) AS apellido
  FROM empleado AS e
  WHERE e.puesto IS NOT "representante de ventas";
  ```

6. Devuelve un listado con el nombre de los todos los clientes españoles.

  ```SQL
  SELECT c.nombre_cliente
  FROM cliente AS c
  WHERE pais = "españa";
  ```

7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

  ```sql
  SELECT DISTINCT p.estado 
  FROM pedido AS p;
  ```

8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

  ```SQL
  SELECT c.codigo_cliente
  FROM cliente AS c
  JOIN pago AS p USING(codigo_cliente)
  WHERE YEAR(p.fecha_pago) = 2008;
  ```

  ```mysql
  SELECT c.codigo_cliente
  FROM cliente AS c
  JOIN pago AS p USING(codigo_cliente)
  WHERE DATE_FORMAT(p.fecha_pago, %Y) = 2008;
  ```

  ```MYsql
  SELECT c.codigo_cliente
  FROM cliente AS c
  JOIN pago AS p USING(codigo_cliente)
  WHERE SUBSTRING(p.fecha_pago, 1, 4) = "2008";
  ```

9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

  ```sql
  SELECT p.codigo_pedido, p.codigo_cliente, p.fecha_esperada, p.fecha_entrega
  FROM pedido AS p
  WHERE p.fecha_entrega > p.fecha_esperada;
  ```

10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

  ```sql
  SELECT p.codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
  FROM pedido AS p
  JOIN cliente AS c USING(codigo_cliente)
  WHERE DATEDIFF(fecha_esperada, fecha_entrega) > 2;
  ```

  Se puede resolver con suma o resta? = Si, se puede resolver con suma o resta

11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

   ```sql
   SELECT p.codigo_pedido, p.fecha_pedido, p.estado
   FROM pedido AS p
   WHERE p.estado = "rechazado"
   	AND YEAR(p.fecha_pedido) = 2009;
   ```

12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

   ```sql
   SELECT p.codigo_pedido, p.fecha_pedido, p.estado
   FROM pedido AS p
   WHERE p.estado = "entredado"
   	AND DATE_FORMAT(p.fecha_pedido, %M) = "January";
   ```

13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

   ```sql
   SELECT p.id_transaccion, p.fecha_pago, p.forma_pago, p.total
   FROM pago AS p
   WHERE YEAR(p.fecha_pago) = 2008
   AND p.forma_pago = "paypal"
   ORDER BY p.total DESC;
   ```

14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

   ```sql
   SELECT DISTINCT p.forma_pago
   FROM pago AS p;
   ```

15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

   ```sql
   SELECT p.codigo_producto, p.nombre, p.cantidad_en_stock, p.precio_venta, gp.gama
   FROM producto AS p
   JOIN gama_producto AS gp USING(gama)
   WHERE gp.gama = "ornamentales"
   	AND p.cantidad_en_stock > 100;
   ```

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

   ```SQL
   SELECT c.nombre_cliente, c.ciudad
   FROM cliente AS c
   WHERE c.ciudad = "madrid"
   	AND c.codigo_empleado_rep_ventas IN (11, 30)
   ```

## Consultas multitabla (compocision interna)

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

   ```sql
   SELECT c.nombre_cliente, e.nombre, e.apellido1 AS apellido
   FROM cliente AS c, empleado AS e
   WHERE e.codigo_empleado = c.codigo_empleado_rep_ventas;
   ```

   ```sql
   SELECT c.nombre_cliente, e.nombre, e.apellido1 AS apellido
   FROM cliente AS c
   JOIN empleado AS e ON e.codigo_empleado = c.codigo_empleado_rep_ventas;
   ```

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

   ```sql
   SELECT c.nombre_cliente, e.nombre, e.apellido1 AS apellido
   FROM cliente AS c, empleado AS e, pago AS p
   WHERE e.codigo_empleado = c.codigo_empleado_rep_ventas
   AND p.codigo_cliente = c.codigo_cliente;
   ```

   ```sql
   SELECT c.nombre_cliente, e.nombre, e.apellido1 AS apellido
   FROM cliente AS c
   JOIN empleado AS e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
   JOIN pago AS p USING(codigo_cliente);
   ```

3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

   ```sql
   SELECT c.nombre_cliente, e.nombre, e.apellido1 AS apellido
   FROM cliente AS c, empleado AS e, pago AS p 
   WHERE e.codigo_empleado = c.codigo_empleado_rep_ventas
   AND c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);
   ```

   ```sql
   SELECT c.nombre_cliente, e.nombre, e.apellido1 AS apellido
   FROM cliente AS c
   JOIN empleado AS e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
   LEFT JOIN pago AS p USING(codigo_cliente)
   WHERE p.codigo_cliente IS NULL;
   ```

4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante

   ```sql
   SELECT c.nombre_cliente, e.nombre, o.ciudad
   FROM cliente AS c, empleado AS e, pago AS p, oficina AS o
   WHERE e.codigo_empleado = c.codigo_empleado_rep_ventas
   AND c.codigo_cliente = p.codigo_cliente
   AND o.codigo_oficina = e.codigo_oficina;
   ```

   ```SQL
   SELECT c.nombre_cliente, e.nombre, o.ciudad
   FROM cliente AS c
   JOIN empleado AS e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
   JOIN pago AS p USING(codigo_cliente)
   JOIN oficina AS o ON o.codigo_oficina = e.codigo_oficina;
   ```

5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombrede sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

   ```sql
   SELECT c.nombre_cliente, e.nombre, e.apellido1 AS apellido
   FROM cliente AS c, empleado AS e, pago AS p, oficina AS o
   WHERE e.codigo_empleado = c.codigo_empleado_rep_ventas
   AND o.codigo_oficina = e.codigo_oficina
   AND c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);
   ```

   ```SQL
   SELECT c.nombre_cliente, e.nombre, o.ciudad
   FROM cliente AS c
   JOIN empleado AS e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
   LEFT JOIN pago AS p USING(codigo_cliente)
   JOIN oficina AS o ON o.codigo_oficina = e.codigo_oficina
   WHERE p.codigo_cliente IS NULL;
   ```

6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

   ```sql
   SELECT o.linea_direccion1, o.linea_direccion2
   FROM oficina As o, empleado AS e, cliente AS c
   WHERE o.codigo_oficina = e.codigo_oficina
   AND e.codigo_empleado = c.codigo_empleado_rep_ventas
   AND c.ciudad = "fuenlabrada";
   ```

   ```sql
   SELECT o.linea_direccion1, o.linea_direccion2
   FROM oficina As o
   JOIN empleado AS e ON o.codigo_oficina = e.codigo_oficina
   JOIN cliente AS c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
   WHERE c.ciudad = "fuenlabrada";
   ```

7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

   ```SQL
   SELECT c.nombre_cliente, e.nombre, o.ciudad
   FROM cliente AS c, empleado AS e, oficina AS o
   WHERE e.codigo_empleado = c.codigo_empleado_rep_ventas
   AND o.codigo_oficina = e.codigo_oficina;
   ```

   ```sql
   SELECT c.nombre_cliente, e.nombre, o.ciudad
   FROM cliente AS c
   JOIN empleado AS e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
   JOIN oficina AS o ON o.codigo_oficina = e.codigo_oficina;
   ```

8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

   ```SQL
   SELECT e.nombre AS empleado, e2.nombre AS jefe
   FROM empleado AS e, empleado AS e2
   WHERE e.codigo_jefe = e2.codigo_empleado;
   ```

   ```sql
   SELECT e.nombre AS empleado, e2.nombre AS jefe
   FROM empleado AS e
   JOIN empleado AS e2 e.codigo_jefe = e2.codigo_empleado;
   ```

9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

   ```sql
   SELECT e.nombre AS empleado, e2.nombre AS jefe, e3.nombre AS jefe_jefe
   FROM empleado AS e, empleado AS e2, empleado AS e3 
   WHERE e2 ON e.codigo_jefe = e2.codigo_empleado
   AND e3 ON e2.codigo_jefe = e3.codigo_empleado;
   ```

   ```sql
   SELECT e.nombre AS empleado, e2.nombre AS jefe, e3.nombre AS jefe_jefe
   FROM empleado AS e
   JOIN empleado AS e2 ON e.codigo_jefe = e2.codigo_empleado
   JOIN empleado AS e3 ON e2.codigo_jefe = e3.codigo_empleado;
   ```

10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

    ```SQL
    SELECT c.nombre_cliente
    FROM pedido AS p, cliente AS c
    WHERE p.codigo_cliente = c.codigo_cliente
    AND p.fecha_entrega > p.fecha_esperada;
    ```

    ```sql
    SELECT c.nombre_cliente
    FROM pedido AS p
    JOIN cliente AS c USING(codigo_cliente)
    WHERE p.fecha_entrega > p.fecha_esperada;
    ```

11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

    ```SQL
    SELECT c.nombre_cliente, gp.gama, pe.fecha_entrega
    FROM cliente AS c, pedido AS pe, detalle_pedido AS dp, producto AS pr, gama_producto AS gp
    WHERE c.codigo_cliente = pe.codigo_cliente
    AND pe.codigo_pedido = dp.codigo_pedido
    AND pr.codigo_producto = dp.codigo_producto
    AND gp.gama = pr.gama;
    ```

    ```sql
    SELECT c.nombre_cliente, gp.gama, pe.fecha_entrega
    FROM cliente AS c
    JOIN pedido AS pe ON c.codigo_cliente = pe.codigo_cliente
    JOIN detalle_pedido AS dp ON pe.codigo_pedido = dp.codigo_pedido
    JOIN producto AS pr ON pr.codigo_producto = dp.codigo_producto
    JOIN gama_producto AS gp ON gp.gama = pr.gama;
    ```

## Consultas multitabla (compocision externa)

1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

   ```sql
   SELECT c.nombre_cliente
   FROM cliente AS c
   LEFT JOIN pago AS p USING(codigo_cliente)
   WHERE p.codigo_cliente IS NULL;
   ```

2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

   ```sql
   SELECT c.nombre_cliente
   FROM cliente AS c
   LEFT JOIN pedido AS p USING(codigo_cliente)
   WHERE p.codigo_cliente IS NUll;
   ```

3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

   ```sql
   SELECT c.nombre_cliente
   FROM cliente AS c
   LEFT JOIN pedido AS pe USING(codigo_cliente)
   LEFT JOIN pago AS pa USING(codigo_cliente)
   WHERE pa.codigo_cliente IS NULL
   AND pe.codigo_cliente IS NUll;
   ```

4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

   ```sql
   SELECT e.nombre, e.apellido1 AS apellido
   FROM empleado AS e
   WHERE e.codigo_oficina IS NULL;
   ```

5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

   ```sql
   SELECT e.nombre, e.apellido1 AS apellido
   FROM empleado AS e
   LEFT JOIN cliente AS c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
   WHERE c.codigo_empleado_rep_ventas IS NULL;
   ```

6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

   ```sql
   SELECT e.nombre, e.apellido1 AS apellido, o.codigo_postal, o.linea_direccion1
   FROM empleado AS e
   LEFT JOIN cliente AS c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
   JOIN oficina AS o USING(codigo_oficina)
   WHERE c.codigo_empleado_rep_ventas IS NULL;
   ```

7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

   ```sql
   SELECT e.nombre, e.apellido1 AS apellido
   FROM empleado AS e
   LEFT JOIN cliente AS c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
   WHERE c.codigo_empleado_rep_ventas IS NULL
   OR e.codigo_oficina IS NULL;
   ```

8. Devuelve un listado de los productos que nunca han aparecido en un pedido.

   ```sql
   SELECT p.nombre
   FROM producto AS p
   LEFT JOIN detalle_pedido AS dp USING(codigo_producto)
   WHERE dp.codigo_producto IS NULL;
   ```

9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

   ```sql
   SELECT p.nombre, p.descripcion, g.imagen
   FROM producto AS p
   JOIN gama_producto AS g USING(gama)
   LEFT JOIN detalle_pedido AS dp USING(codigo_producto)
   WHERE dp.codigo_producto IS NULL;
   ```

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

    ```SQL
    SELECT o.linea_direccion1 AS direccion_oficina
    FROM oficina AS o
    LEFT JOIN empleado AS e USING(codigo_oficina)
    JOIN cliente AS c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    JOIN pedido AS pe ON c.codigo_cliente = pe.codigo_cliente
    JOIN detalle_pedido AS dp ON pe.codigo_pedido = dp.codigo_pedido
    JOIN producto AS pr ON pr.codigo_producto = dp.codigo_producto
    JOIN gama_producto AS gp ON gp.gama = pr.gama
    WHERE gp.gama = "frutales"
    AND e.codigo_empleado IS NULL; 
    ```

11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

    ```sql
    SELECT c.nombre_cliente
    FROM cliente AS c
    JOIN pedido AS pe USING(codigo_cliente)
    LEFT JOIN pago AS pa USING(codigo_cliente)
    WHERE pa.codigo_cliente IS NULL;
    ```

12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

    ```sql
    SELECT e.nombre AS empleado, e2.nombre AS jefe
    FROM empleado AS e 
    JOIN empleado AS e2 ON e.codigo_jefe = e2.codigo_empleado
    LEFT join cliente AS c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    WHERE c.codigo_empleado_rep_ventas IS NULL;
    ```

## Consultas resumen

1. ¿Cuántos empleados hay en la compañía?

   ```sql
   SELECT COUNT(codigo_empleado) AS nro_empleados
   FROM empleado;
   ```

2. ¿Cuántos clientes tiene cada país?

   ```sql
   SELECT pais, COUNT(codigo_cliente) AS nro_clientes
   FROM cliente
   GROUP BY pais;
   ```

3. ¿Cuál fue el pago medio en 2009?

   ```sql
   SELECT AVG(total)
   FROM pago
   WHERE YEAR(fecha_pago) = 2009;
   ```

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

   ```
   SELECT COUNT(codigo_pedido) AS pedidos, estado
   FROM pedido
   GROUP BY estado
   ORDER BY pedidos DESC;
   ```

5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

   ```
   SELECT (SELECT nombre
   
   )
   ```

   