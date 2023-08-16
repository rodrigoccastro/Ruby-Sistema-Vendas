require_relative "Repository.rb"
require "ostruct"

class RepositoryProduct < Repository
    
    def add(obj)
        sql = "INSERT INTO tb_products VALUES ($1,$2,$3);"
        return executeSpObj(sql, obj)
    end

    def update(obj)
        sql = "UPDATE tb_products set name=$2, price=$3 where id=$1;"
        return executeSpObj(sql, obj)
    end

    def delete(key)
        sql = "delete from tb_products where id=$1;"
        return executeSpValues(sql, [key])
    end

    def getList()
        sql = "SELECT * FROM tb_products AS tb order by tb.name;"
        return getQueryListSp(sql, nil)
    end

    def getObj(key)
        sql = "SELECT * FROM tb_products AS tb WHERE tb.id = $1;"
        return getQueryObjSp(sql, [key])
    end
  
end