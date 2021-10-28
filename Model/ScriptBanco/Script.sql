CREATE DATABASE "BaseVendas"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE tb_clientes (
    cpf VARCHAR(11) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    telefone VARCHAR(50),
    endereco VARCHAR(50)
    );

CREATE TABLE tb_produtos (
    id VARCHAR(11) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    valor money
    );

CREATE TABLE tb_vendedores (
    cpf VARCHAR(11) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    telefone VARCHAR(50),
    endereco VARCHAR(50)
    );

CREATE TABLE tb_vendas (
    id SERIAL PRIMARY KEY,
    cpf_cliente VARCHAR(11) NOT NULL,
    cpf_vendedor VARCHAR(11) NOT NULL,
    datahora TIMESTAMP NOT NULL
    );

CREATE TABLE tb_vendas_produtos (
    id_venda int NOT NULL,
    id_produto VARCHAR(11) NOT NULL,
    valor money,
    qtd int NOT NULL,
	PRIMARY KEY(id_venda, id_produto)
	);


