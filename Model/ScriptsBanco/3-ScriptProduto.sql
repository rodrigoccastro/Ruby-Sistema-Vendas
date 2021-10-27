CREATE TABLE tb_produtos (
    id VARCHAR(11) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    valor money
    );

CREATE PROCEDURE spGetListaProdutos()
	LANGUAGE SQL
	BEGIN ATOMIC
		SELECT * FROM tb_produtos AS tb order by tb.nome;
	END;

CREATE PROCEDURE spGetProduto(id VARCHAR(11))
	LANGUAGE SQL
	BEGIN ATOMIC
		SELECT * FROM tb_produtos AS tb WHERE tb.id = id;
	END;

CREATE PROCEDURE spAddProduto(id VARCHAR(11), nome VARCHAR(50), valor money)
	LANGUAGE SQL
	BEGIN ATOMIC
		INSERT INTO tb_produtos VALUES (id, nome, valor);
	END;
    
CREATE PROCEDURE spUpdProduto(vid VARCHAR(11), vnome VARCHAR(50), vvalor money)
	LANGUAGE SQL
	BEGIN ATOMIC
		UPDATE tb_produtos set nome=vnome, valor=vvalor where id=vid;
	END;
CREATE PROCEDURE spDelProduto(vid VARCHAR(11))
	LANGUAGE SQL
	BEGIN ATOMIC
		delete from tb_produtos where id=vid;
	END;