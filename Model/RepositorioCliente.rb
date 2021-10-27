require_relative "Repositorio.rb"
require "ostruct"

class RepositorioCliente < Repositorio
    
    def add(obj)
        sql = "Call spAddCliente($1,$2,$3,$4,$5)"
        sql = "INSERT INTO tb_clientes VALUES ($1,$2,$3,$4,$5);"
        return executeSpObj(sql, obj)
    end

    def update(obj)
        sql = "Call spUpdCliente($1,$2,$3,$4,$5)"
        sql = "UPDATE tb_clientes set nome=$2, email=$3, telefone=$4, endereco=$5 where cpf=$1;"
        return executeSpObj(sql, obj)
    end

    def delete(key)
        sql = "Call spDelCliente($1)"
        sql = "delete from tb_clientes where cpf=$1;"
        return executeSpValues(sql, [key])
    end

    def getList()
        sql = "Call spGetListaClientes()"
        sql = "SELECT * FROM tb_clientes AS tb order by tb.nome;"
        return getQueryListSp(sql, nil)
    end

    def getObj(key)
        sql = "Call spGetCliente($1)"
        sql = "SELECT * FROM tb_clientes AS tb WHERE tb.cpf = $1;"
        return getQueryObjSp(sql, [key])
    end
        
end