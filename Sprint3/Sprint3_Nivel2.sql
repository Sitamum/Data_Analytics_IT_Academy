-- Elimina de la taula transaction el registre 
-- amb ID 02C6201E-D90A-1859-B4EE-88D2986D3B02 de la base de dades.
delete from transaction
where ID='02C6201E-D90A-1859-B4EE-88D2986D3B02';
select * from transaction
where ID='02C6201E-D90A-1859-B4EE-88D2986D3B02';

-- EJERCICIO 2
--  Serà necessària que creïs una vista anomenada VistaMarketing que contingui la 
-- següent informació: 
--               Nom de la companyia.
--               Telèfon de contacte. 
--               País de residència. 
--               Mitjana de compra realitzat per cada companyia. 
-- Presenta la vista creada, ordenant les dades de major a menor mitjana de compra.

CREATE VIEW VistaMarketing AS
SELECT company_name as Nom, phone as Telefon, country as Pais, avg(amount) as 'Promedio Ventas' from company as C
JOIN transaction as t ON t.company_id=c.id
GROUP BY company_name, telefon, country;

SELECT * FROM VistaMarketing
ORDER BY avg(amount) DESC ;

-- Exercici 3
-- Filtra la vista VistaMarketing per a mostrar només les companyies que tenen 
-- el seu país de residència en "Germany"

SELECT * FROM vistamarketing
WHERE pais = 'Germany';

