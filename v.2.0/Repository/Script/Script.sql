CREATE DATABASE "DatabaseSales"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE tb_clients (
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(50),
    address VARCHAR(50)
    );

CREATE TABLE tb_products (
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    price money
    );

CREATE TABLE tb_sellers (
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(50),
    address VARCHAR(50)
    );

CREATE TABLE tb_sales (
    id SERIAL PRIMARY KEY,
    id_client VARCHAR(20) NOT NULL,
    id_seller VARCHAR(20) NOT NULL,
    datetime TIMESTAMP NOT NULL,
    CONSTRAINT fk_client
      FOREIGN KEY(id_client) 
	  REFERENCES tb_clients(id),
    CONSTRAINT fk_seller
      FOREIGN KEY(id_seller) 
	  REFERENCES tb_sellers(id)
    );

CREATE TABLE tb_sales_products (
    id_sale int NOT NULL,
    id_product VARCHAR(20) NOT NULL,
    price money,
    quantity int NOT NULL,
	PRIMARY KEY(id_sale, id_product),
    CONSTRAINT fk_sale
      FOREIGN KEY(id_sale) 
	  REFERENCES tb_sales(id),
    CONSTRAINT fk_product
      FOREIGN KEY(id_product) 
	  REFERENCES tb_products(id)
	);


