CREATE TABLE tb_vendedores (
    cpf VARCHAR(11) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    telefone VARCHAR(50),
    endereco VARCHAR(50)
    );

CREATE PROCEDURE spGetListaVendedores()
	LANGUAGE SQL
	BEGIN ATOMIC
		SELECT * FROM tb_vendedores AS tb order by tb.nome;
	END;

CREATE PROCEDURE spGetVendedor(cpf VARCHAR(11))
	LANGUAGE SQL
	BEGIN ATOMIC
		SELECT * FROM tb_vendedores AS tb WHERE tb.cpf = cpf;
	END;

CREATE PROCEDURE spAddVendedor(cpf VARCHAR(11), nome VARCHAR(50), email VARCHAR(50), telefone VARCHAR(50), endereco VARCHAR(50))
	LANGUAGE SQL
	BEGIN ATOMIC
		INSERT INTO tb_vendedores VALUES (cpf, nome, email, telefone, endereco);
	END;
    
CREATE PROCEDURE spUpdVendedor(vcpf VARCHAR(11), vnome VARCHAR(50), vemail VARCHAR(50), vtelefone VARCHAR(50), vendereco VARCHAR(50))
	LANGUAGE SQL
	BEGIN ATOMIC
		UPDATE tb_vendedores set nome=vnome, email=vemail, telefone=vtelefone, endereco=vendereco where cpf=vcpf;
	END;

CREATE PROCEDURE spDelVendedor(vcpf VARCHAR(11))
	LANGUAGE SQL
	BEGIN ATOMIC
		delete from tb_vendedores where cpf=vcpf;
	END;