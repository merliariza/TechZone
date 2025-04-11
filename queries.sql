--Consultas
--Listar los productos con stock menor a 5 unidades.
SELECT product_name, price, stock 
FROM products
WHERE stock < 5;

--Calcular ventas totales de un mes específico.
SELECT SUM(total) AS total_ventas_mes
FROM sales
WHERE EXTRACT(MONTH FROM sale_date) = 4  
  AND EXTRACT(YEAR FROM sale_date) = 2025;

--Obtener el cliente con más compras realizadas.
SELECT cs.customer_id, c.customer_name, COUNT(cs.sales_id) AS total_compras
FROM customer_sales cs
JOIN customers c ON cs.customer_id = c.id
GROUP BY cs.customer_id, c.customer_name
ORDER BY total_compras DESC
LIMIT 1;

--Listar los 5 productos más vendidos.
SELECT p.product_name, SUM(sd.quantity) AS total_vendido
FROM sales_details sd
JOIN products p ON sd.id_product = p.id
GROUP BY p.product_name
ORDER BY total_vendido DESC
LIMIT 5;

--Consultar ventas realizadas en un rango de fechas de tres Días y un Mes.
SELECT sale_date, total
FROM sales
WHERE sale_date BETWEEN '2025-04-01' AND '2025-04-03'; 

--Identificar clientes que no han comprado en los últimos 6 meses.
SELECT c.id, c.customer_name
FROM customers c
LEFT JOIN customer_sales cs ON c.id = cs.customer_id
LEFT JOIN sales s ON cs.sales_id = s.id
WHERE s.sale_date IS NULL OR s.sale_date < CURRENT_DATE - INTERVAL '6 months';
