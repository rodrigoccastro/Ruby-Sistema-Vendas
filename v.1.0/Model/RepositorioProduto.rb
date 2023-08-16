require_relative "Repositorio.rb"
require "ostruct"

class RepositorioProduto < Repositorio
    
    def add(obj)
        sql = "INSERT INTO tb_produtos VALUES ($1,$2,$3);"
        return executeSpObj(sql, obj)
    end

    def update(obj)
        sql = "UPDATE tb_produtos set nome=$2, valor=$3 where id=$1;"
        return executeSpObj(sql, obj)
    end

    def delete(key)
        sql = "delete from tb_produtos where id=$1;"
        return executeSpValues(sql, [key])
    end

    def getList()
        sql = "SELECT * FROM tb_produtos AS tb order by tb.nome;"
        return getQueryListSp(sql, nil)
    end

    def getObj(key)
        sql = "SELECT * FROM tb_produtos AS tb WHERE tb.id = $1;"
        return getQueryObjSp(sql, [key])
    end
  
end