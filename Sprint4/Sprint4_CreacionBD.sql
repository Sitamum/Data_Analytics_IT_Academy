-- creamos la BBDD llamada Sprint4 y ejecutamos USE para asegurarnos que estamos en Sprint4
CREATE DATABASE IF NOT EXISTS Sprint4
USE Sprint4;

-- Creamos la tabla companies
    CREATE TABLE IF NOT EXISTS companies (
        company_id VARCHAR(15) ,
        company_name VARCHAR(255),
        phone VARCHAR(15),
        email VARCHAR(100),
        country VARCHAR(100),
        website VARCHAR(255)
    );

-- cargamos los datos de companies, indicando la ruta del archivo, la coma como separador de campos y que ignore la primera fila

    --LOAD DATA INFILE 'C:\Users\sitam.DESKTOP-T7LI7DB\OneDrive\Documentos\Formación\DataAnalyst_ITAcademy\Sprint 4\Datos Sprint4'
   -- INTO TABLE companies
    --FIELDS TERMINATED BY ','
    --IGNORE 1 ROWS;

--show variables like "secure_file_priv"
-- me indica que la ruta es 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\' cuelgo este archivo en esta carpeta
-- cambio las barras \ por / para que la ruta sea leida correctamente

 LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/companies.csv'
    INTO TABLE companies
    FIELDS TERMINATED BY ','
    IGNORE 1 ROWS;
-- compruebo que se han cargado
    SELECT * FROM companies;

-- repetimos el proceso para el archivo credit_cards.csv
-- creamos la tabla 'credit_cards' con la estructura que visualizamos en el archivo csv
CREATE TABLE IF NOT EXISTS credit_cards (
	id varchar(20),
    user_id int,
	iban varchar(50),
	pan varchar(30),
	pin int,
	cvv int,
    track1 varchar(255),
    track2 varchar (255),
	expiring_date varchar(8)
    );
-- cargamos los datos del archivo 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/credit_cards.csv'
    INTO TABLE credit_cards
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- añadimos un select para visualizar la tabla
SELECT * FROM credit_cards;

-- analizamos el archivo 'products' como hemos realizado 
CREATE TABLE IF NOT EXISTS products (
    id int,
    product_name varchar (100),
    price varchar (9),
    colour varchar (7),
    weight float,
    warehouse_id varchar (6)
);
-- cargamos los datos del archivo
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
    INTO TABLE products
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- visualizamos con un select    
SELECT * FROM products;

-- analizamos el archivo 'transactions' y creamos la tabla con sus campos
CREATE TABLE IF NOT EXISTS transactions (
    id VARCHAR(255),
    card_id VARCHAR (15),
    business_id VARCHAR (20),
    timestamp TIMESTAMP,
    amount DECIMAL (10,2),
    declined BOOLEAN,
    product_ids VARCHAR (20),
    user_id INT,
    lat FLOAT,
    longitude FLOAT
);
-- cargamos los datos del archivo teniendo en cuenta que el separador de campos ahora es ';'
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/transactions.csv'
    INTO TABLE transactions
    FIELDS TERMINATED BY ';'
    ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- visualizamos con select el resultado
SELECT * FROM transactions;

-- en el caso de los tres archivos que quedan los tres tienen la misma estructura, buscamos 
-- creamos las tres tablas 
-- USERS_USA
CREATE TABLE IF NOT EXISTS users_usa (
    id INT,
    name VARCHAR (20),
    surname VARCHAR (20),
    phone VARCHAR (15),
    email VARCHAR (150),
    birth_date VARCHAR (20),
    country VARCHAR (100),
    city VARCHAR (100),
    postal_code VARCHAR (15),
    address VARCHAR (100)

);
-- cargamos los datos del archivo user_usa 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users_usa.csv'
    INTO TABLE users_usa
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
-- visualizamos con un select    
SELECT * FROM users_usa;

-- en el caso de los tres archivos que quedan los tres tienen la misma estructura, buscamos 
-- USERS_UK
CREATE TABLE IF NOT EXISTS users_uk (
    id INT,
    name VARCHAR (20),
    surname VARCHAR (20),
    phone VARCHAR (15),
    email VARCHAR (150),
    birth_date VARCHAR (20),
    country VARCHAR (100),
    city VARCHAR (100),
    postal_code VARCHAR (15),
    address VARCHAR (100)

);
-- cargamos los datos del archivo user_usa añadiendo la condicion '\r' por que sino se queda en la linea 10
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users_uk.csv'
    INTO TABLE users_uk
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
-- visualizamos con un select    
SELECT * FROM users_uk;


-- USERS_CA 
CREATE TABLE IF NOT EXISTS users_ca (
    id INT,
    name VARCHAR (20),
    surname VARCHAR (20),
    phone VARCHAR (15),
    email VARCHAR (150),
    birth_date VARCHAR (20),
    country VARCHAR (100),
    city VARCHAR (100),
    postal_code VARCHAR (15),
    address VARCHAR (100)

);
-- cargamos los datos del archivo user_usa añadiendo la condicion '\r' por que sino se queda en la linea 10
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users_ca.csv'
    INTO TABLE users_ca
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
-- visualizamos con un select    
SELECT * FROM users_ca;

-- para unificar los datos  añado los registros de users_usa a users_uk.
INSERT INTO users_usa
SELECT * FROM users_uk;
-- añadimos ahora a users_usa lo datos de users_ca
INSERT INTO users_usa
SELECT * FROM users_ca;
-- a la tabla resultante le llamo 'users' y compruebo que las filas que contiene son la suma de las otras tres
RENAME TABLE users_usa to users;
SELECT COUNT(*) FROM users;
-- borramos las dos tablas 'users_uk' y 'users_ca' y vemos como quedan las tablas
drop table users_ca;
drop table users_uk;
SHOW FULL TABLES FROM Sprint4;


-- definimos 'company_id' en tabla companies como PRIMARY KEY Y 'business_id' como la FOREIGN KEY 
-- con una relacion de 1:N
ALTER TABLE companies
ADD PRIMARY KEY (company_id);
ALTER TABLE transactions
ADD FOREIGN KEY (business_id) REFERENCES companies(company_id);
-- definimos 'id' en tabla 'credit_cards' como PRIMARY KEY Y 'card_id' como la FOREIGN KEY 
-- en 'transactions' con una relacion de 1:N
ALTER TABLE credit_cards
ADD PRIMARY KEY (id);
ALTER TABLE transactions
ADD FOREIGN KEY (card_id) REFERENCES credit_cards(id);
-- definimos 'id' en tabla 'users' como PRIMARY KEY Y 'user_id' como la FOREIGN KEY en 'transactions'
-- con una relacion de 1:N
ALTER TABLE users
ADD PRIMARY KEY (id);
ALTER TABLE transactions
ADD FOREIGN KEY (user_id) REFERENCES users(id);