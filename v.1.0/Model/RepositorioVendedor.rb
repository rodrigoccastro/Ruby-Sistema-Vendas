require_relative "Repositorio.rb"
require "ostruct"

class RepositorioVendedor < Repositorio
    
    def add(obj)
        sql = "INSERT INTO tb_vendedores VALUES ($1,$2,$3,$4,$5);"
        return executeSpObj(sql, obj)
    end

    def update(obj)
        sql = "UPDATE tb_vendedores set nome=$2, email=$3, telefone=$4, endereco=$5 where cpf=$1;"
        return executeSpObj(sql, obj)
    end

    def delete(key)
        sql = "delete from tb_vendedores where cpf=$1;"
        return executeSpValues(sql, [key])
    end

    def getList()
        sql = "SELECT * FROM tb_vendedores AS tb order by tb.nome;"
        return getQueryListSp(sql, nil)
    end

    def getObj(key)
        sql = "SELECT * FROM tb_vendedores AS tb WHERE tb.cpf = $1;"
        return getQueryObjSp(sql, [key])
    end
      
end
