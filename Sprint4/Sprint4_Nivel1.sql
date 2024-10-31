-- Exercici 1
-- Realitza una subconsulta que mostri tots els usuaris amb més de 30 transaccions
-- utilitzant almenys 2 taules.

SELECT CONCAT (name ," ", surname ) AS  Nombre, count(u.id) AS Num_Trans from transactions as t
JOIN users as u ON t.user_id = u.id
GROUP BY Nombre
HAVING Num_Trans > 30
ORDER BY Num_Trans desc
 ;

-- Exercici 2
-- Mostra la mitjana d'amount per IBAN de les targetes de crèdit
-- a la companyia Donec Ltd, utilitza almenys 2 taules.

