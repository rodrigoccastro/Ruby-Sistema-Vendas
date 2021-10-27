CREATE TABLE tb_clientes (
    cpf VARCHAR(11) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    telefone VARCHAR(50),
    endereco VARCHAR(50)
    );

CREATE PROCEDURE spGetListaClientes()
	LANGUAGE SQL
	BEGIN ATOMIC
		SELECT * FROM tb_clientes AS tb order by tb.nome;
	END;

CREATE PROCEDURE spGetCliente(cpf VARCHAR(11))
	LANGUAGE SQL
	BEGIN ATOMIC
		SELECT * FROM tb_clientes AS tb WHERE tb.cpf = cpf;
	END;

CREATE PROCEDURE spAddCliente(cpf VARCHAR(11), nome VARCHAR(50), email VARCHAR(50), telefone VARCHAR(50), endereco VARCHAR(50))
	LANGUAGE SQL
	BEGIN ATOMIC
		INSERT INTO tb_clientes VALUES (cpf, nome, email, telefone, endereco);
	END;
    
CREATE PROCEDURE spUpdCliente(vcpf VARCHAR(11), vnome VARCHAR(50), vemail VARCHAR(50), vtelefone VARCHAR(50), vendereco VARCHAR(50))
	LANGUAGE SQL
	BEGIN ATOMIC
		UPDATE tb_clientes set nome=vnome, email=vemail, telefone=vtelefone, endereco=vendereco where cpf=vcpf;
	END;
CREATE PROCEDURE spDelCliente(vcpf VARCHAR(11))
	LANGUAGE SQL
	BEGIN ATOMIC
		delete from tb_clientes where cpf=vcpf;
	END;