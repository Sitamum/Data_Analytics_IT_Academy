-- Listado de paises haciendo compras --
SELECT distinct country FROM company
INNER join transaction
ON company.id = transaction.company_id;

-- Desde cuantos paises se están haciendo compras --
SELECT COUNT(distinct country) FROM company
INNER join transaction
ON company.id = transaction.company_id;

-- Compañía con la media mas alta de ventas--
CREATE TABLE TopPrecioMedio
	SELECT company_id, AVG(amount) AS Precio_medio from transaction
		GROUP BY company_id
		order by Precio_medio DESC;
SELECT Company_name FROM company
	JOIN toppreciomedio
    ON toppreciomedio.company_id=company.id
    LIMIT 1;

-- 