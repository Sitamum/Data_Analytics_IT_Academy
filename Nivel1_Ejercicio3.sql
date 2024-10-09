-- Mostra totes les transaccions realitzades per empreses --
-- de Alemanya sin utilizar JOIN--
select * from transaction
where company_id in
	(select id
	from company
	where country = "germany")

-- Lista de empresas que han realizado transacciones superiores--
-- a la media de todas las transacciones--
select company_name from company
where id in (
	select distinct company_id
	from transaction
	where amount >
			(select avg(amount) 
		from transaction)
);

-- Eliminar las empresas que no tienen transacciones--
-- listado de empresas eliminadas--
select * from transaction
where company_id not in 
	(select distinct id from company)


-- El mismo ejercicio pero con la suma de las ventas
