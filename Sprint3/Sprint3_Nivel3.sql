-- Exercici 1
-- La setmana vinent tindràs una nova reunió amb els gerents de màrqueting. 
-- Un company del teu equip va realitzar modificacions en la base de dades, 
-- però no recorda com les va realitzar. 
-- Et demana que l'ajudis a deixar els comandos executats per a obtenir el següent diagrama:

show create table company
-- nos muestra este resultado
-- 'company', 'CREATE TABLE `company` (\n  `id` varchar(15) NOT NULL,\n  `company_name` varchar(255) DEFAULT NULL,\n  `phone` varchar(15) DEFAULT NULL,\n  `email` varchar(100) DEFAULT NULL,\n  `country` varchar(100) DEFAULT NULL,\n  `website` varchar(255) DEFAULT NULL,\n  PRIMARY KEY (`id`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'
ALTER TABLE company
DROP COLUMN website;
-- comprobamos 
DESCRIBE company;

-- repetimos el proceso con 'credit_card' y comprobamos que hay que añadir una columna 'fecha_actual'
ALTER TABLE credit_card
add fecha_actual DATE;
DESCRIBE Credit_card;	

-- mismo proceso tabla 'user' , 
DESCRIBE user;


-- tenemos que cambiarle el nombre a la tabla por 'data_user' y
RENAME TABLE user to Data_user;
-- cambiar el nombre de columna 'email' por 'personal_email'
ALTER TABLE Data_user
RENAME COLUMN email TO personal_email ;

-- Ahora vamos con la tabla 'transaction' y comprobamos que es igual al ejemplo por tanto no hay que modificar nada
-- en el caso de las relaciones vemos tambien que son de las mismas características y mismas key
-- no se modifica nada





