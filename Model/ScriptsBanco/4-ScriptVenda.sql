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

