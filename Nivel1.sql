-- NIvel 1 Exercici 1

create table credit_card (
	id varchar(20) primary key,
	iban varchar(50),
	pan varchar(20),
	pin varchar(4),
	cvv int,
	expiring_date varchar(10));

-- creamos las relaciones entre credit_card y transaction
-- Deshabilitamos las restricciones de las foreign key
set foreign_key_checks=0;

alter table transaction
add foreign key (credit_card_id) references credit_card (id);

-- Nivel 1 Exercici 2
-- Sustituir en el dato con id = 'CcU-2938' el valor actual por iban = 'R323456312213576817699999'
SELECT * FROM credit_card
where id = 'CcU-2938';
-- con el comando update sustituimos el iban y comprobamos.
update credit_card set iban = 'R323456312213576817699999' where id = 'CcU-2938';
select * from credit_card
where id = 'CcU-2938';

-- Nivel 1 Exercici 3
-- Insertar un nuevo usuario en la tabla transacción
-- Introducimos nuevo registro en la tabla transaction mediante INSERT INTO
INSERT INTO transaction (id, credit_card_id, company_id,user_id,lat,longitude,amount,declined)
VALUES ('108B1D1D-5B23-A76C-55EF-C568E49A99DD','CcU-9999','b-9999','9999','829.999', '-117.999','111.11','0');
-- nos da error comprobamos las restricciones de la tabla TRANSACTION
show create table TRANSACTION;
-- el output nos devuelve
CREATE TABLE `transaction` (
   `id` varchar(255) NOT NULL,
   `credit_card_id` varchar(15) DEFAULT NULL,
   `company_id` varchar(20) DEFAULT NULL,
   `user_id` int DEFAULT NULL,
   `lat` float DEFAULT NULL,
   `longitude` float DEFAULT NULL,
   `timestamp` timestamp NULL DEFAULT NULL,
   `amount` decimal(10,2) DEFAULT NULL,
   `declined` tinyint(1) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `company_id` (`company_id`),
   KEY `credit_card_id` (`credit_card_id`),
   CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
   CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`credit_card_id`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
-- Deshabilitamos las restricciones de las foreign key
set foreign_key_checks=0;
-- volvemos a introducir los datos 
INSERT INTO transaction (id, credit_card_id, company_id,user_id,lat,longitude,amount,declined)
VALUES ('108B1D1D-5B23-A76C-55EF-C568E49A99DD','CcU-9999','b-9999','9999','829.999', '-117.999','111.11','0');
-- comprobamos que estén introducidos
SELECT * FROM transaction
where id='108B1D1D-5B23-A76C-55EF-C568E49A99DD';


-- Nivel 1 Exercici 4
-- Des de recursos humans et sol·liciten eliminar la columna "pan" de la taula credit_*card.
-- Recorda mostrar el canvi realitzat.
alter table credit_card
drop pan;
select * from credit_card;
