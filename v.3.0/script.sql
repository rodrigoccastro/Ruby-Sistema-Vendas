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
    created TIMESTAMP NOT NULL DEFAULT NOW(),
    updated TIMESTAMP NOT NULL DEFAULT NOW()
    );

CREATE TABLE products (
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    price money,
    created TIMESTAMP NOT NULL DEFAULT NOW(),
    updated TIMESTAMP NOT NULL DEFAULT NOW()
    );

CREATE TABLE sellers (
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(50),
    address VARCHAR(50),
    created TIMESTAMP NOT NULL DEFAULT NOW(),
    updated TIMESTAMP NOT NULL DEFAULT NOW()
    );

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    client_id VARCHAR(20) NOT NULL,
    seller_id VARCHAR(20) NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT NOW(),
    updated TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_client
      FOREIGN KEY(client_id) 
	  REFERENCES clients(id),
    CONSTRAINT fk_seller
      FOREIGN KEY(seller_id) 
	  REFERENCES sellers(id)
    );

CREATE TABLE productsales (
    id SERIAL PRIMARY KEY,
    sale_id int NOT NULL,
    product_id VARCHAR(20) NOT NULL,
    price money,
    quantity int NOT NULL,
    CONSTRAINT fk_sale
      FOREIGN KEY(sale_id) 
	  REFERENCES sales(id),
    CONSTRAINT fk_product
      FOREIGN KEY(product_id) 
	  REFERENCES products(id)
	);


