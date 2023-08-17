CREATE DATABASE "DatabaseSalesActiveRecord"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE clients (
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(50),
    address VARCHAR(50),
    datetime TIMESTAMP NOT NULL DEFAULT NOW()
    );

CREATE TABLE products (
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    price money,
    datetime TIMESTAMP NOT NULL DEFAULT NOW()
    );

CREATE TABLE sellers (
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(50),
    address VARCHAR(50),
    datetime TIMESTAMP NOT NULL DEFAULT NOW()
    );

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    id_client VARCHAR(20) NOT NULL,
    id_seller VARCHAR(20) NOT NULL,
    datetime TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_client
      FOREIGN KEY(id_client) 
	  REFERENCES clients(id),
    CONSTRAINT fk_seller
      FOREIGN KEY(id_seller) 
	  REFERENCES sellers(id)
    );

CREATE TABLE productsales (
    id_sale int NOT NULL,
    id_product VARCHAR(20) NOT NULL,
    price money,
    quantity int NOT NULL,
	PRIMARY KEY(id_sale, id_product),
    CONSTRAINT fk_sale
      FOREIGN KEY(id_sale) 
	  REFERENCES sales(id),
    CONSTRAINT fk_product
      FOREIGN KEY(id_product) 
	  REFERENCES products(id)
	);


