-- Listado de paises haciendo compras --
SELECT distinct country FROM company
INNER join transaction
ON company.id = transaction.company_id;

-- Desde cuántos paises se están haciendo compras --
SELECT COUNT(distinct country) FROM company
INNER join transaction
ON company.id = transaction.company_id;

-- identificar Compañía con la media mas alta de ventas--
select company.company_name, avg(transaction.amount) as VentaMedia from transaction
join company on transaction.company_id=company.id
where transaction.declined = 0
group by transaction.company_id
order by VentaMedia desc
limit 1;

 