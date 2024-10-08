-- Identificar los 5 dias en los que se va a generar mayor volumen--
-- ingresos en la empresa por ventas, mostrar la fecha y total ventas--

-- utilizando JOIN
SELECT date(timestamp) as Fecha FROM transaction
	GROUP BY Fecha
    ORDER BY VentasDía DESC
    LIMIT 5;

-- Obtener la media de ventas por pais y ordenarlo de mayor a menor--
SELECT Country, avg(amount) as MediaVentas FROM transaction, company
	WHERE transaction.company_id = company.id
	GROUP BY Country
    ORDER BY MediaVentas DESC;

-- Listado de las transacciones realizadas en el mismo pais que ‘Non Institute’ --
SELECT transaction.id, amount, company_name, country FROM transaction, company
	WHERE 
		transaction.company_id = company.id and 
        Country = (select distinct country from company where company_name = "Non Institute") and
        company_name <> "Non Institute";