-- EJERCICIO 1
-- Identificar los 5 dias en los que se va a generar mayor volumen--
-- ingresos en la empresa por ventas
--  mostrar las fecha y total ventas--
-- Mostra el llistat aplicant JOIN i subconsultes.
-- Mostra el llistat aplicant solament subconsultes.

-- utilizando subconsultas
SELECT date(timestamp) as  Fecha, sum(amount) as Ingresos FROM transaction
    WHERE declined= 0
    GROUP BY Fecha
    ORDER BY Ingresos DESC
    LIMIT 5;
-- utilizando Join
SELECT DATE(Timestamp) as Fecha, sum(amount) as Ventas 
FROM transaction
JOIN company
	on transaction.company_id = company.id AND DECLINED= 0
	GROUP BY Fecha
    ORDER BY Ventas DESC
    limit 5;

-- EJERCICIO 2
-- Obtener la media de ventas por pais y ordenarlo de mayor a menor
-- utilizando Join
SELECT company.Country, avg(amount) as MediaVentas 
FROM transaction
JOIN company
	ON transaction.company_id = company.id AND DECLINED=0
	GROUP BY Country
    ORDER BY MediaVentas DESC;

-- utilizando subqueries
SELECT company.Country, avg(amount) as MediaVentas 
FROM company,transaction
WHERE transaction.company_id = company.id AND DECLINED=0
	GROUP BY Country
    ORDER BY MediaVentas DESC;


-- EJERCICIO 3
-- Listado de las transacciones realizadas en el mismo pais que ‘Non Institute’ --
--Utilizando subqueries
select * from transaction
where company_id in
    (select id from company
    where country=
	    (select distinct country 
		   from company 
           where company_name = "Non Institute") 
           
    and company_name <> "Non Institute");

-- utilizando join
SELECT transaction.id, amount, company_name, country 
FROM transaction
join company
ON transaction.company_id = company.id
WHERE Country = (select distinct country from company where company_name = "Non Institute") and
        company_name <> "Non Institute";