-- EXERCISE1
-- Presenta el nom, telèfon, país, data i amount,
-- d'aquelles empreses que van realitzar transaccions 
-- amb un valor comprès entre 100 i 200 euros i en alguna 
-- d'aquestes dates: 29 d'abril del 2021, 20 de juliol 
-- del 2021 i 13 de març del 2022. 
-- Ordena els resultats de major a menor quantitat.

SELECT company.Company_name as Nom, company.phone as Telefon, company.country as pais, date(timestamp) as Data, amount as VentaDia
FROM transaction
join company on  transaction.company_id = company.id
where amount <=200 and amount >= 100 and  (
date(timestamp)= '2021-04-29' or date(timestamp)='2021-07-20' or date(timestamp) ='2022-03-13')
order by amount desc;
-- se podría tambien realizar mediante el comando IN
SELECT company.Company_name as Nom, company.phone as Telefon, company.country as pais, date(timestamp) as Data, amount as VentaDia
FROM transaction
join company on  transaction.company_id = company.id
where amount <=200 and amount >= 100 and 
	date(timestamp) in ('2021-04-29','2021-07-20','2022-03-13')
order by amount desc;

-- EXERCICI 2
SELECT company.Company_name as Nom, count(transaction.id) as 'Quantitat de transaccions',
	CASE WHEN count(transaction.id)>= '4' then 'més' else 'menys' END AS 'Mas o menos de 4 trans'
	FROM transaction
	join company on  transaction.company_id = company.id
	group by company.company_name, company.phone, company.country
    order by count(transaction.id) desc
    ;


	SELECT company.Company_name as Nom, company.phone as Telefon, company.country as pais, date(timestamp) as Data, amount as VentaDia
FROM transaction
join company on  transaction.company_id = company.id
where amount <=200 and amount >= 100 and 
	date(timestamp) in ('2021-04-29','2021-07-20','2022-03-13')
order by amount desc;