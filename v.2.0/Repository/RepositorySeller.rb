require_relative "Repository.rb"
require "ostruct"

class RepositorySeller < Repository
    
    def add(obj)
        sql = "INSERT INTO tb_sellers VALUES ($1,$2,$3,$4,$5);"
        return executeSpObj(sql, obj)
    end

    def update(obj)
        sql = "UPDATE tb_sellers set name=$2, email=$3, phone=$4, address=$5 where id=$1;"
        return executeSpObj(sql, obj)
    end

    def delete(key)
        sql = "delete from tb_sellers where cidpf=$1;"
        return executeSpValues(sql, [key])
    end

    def getList()
        sql = "SELECT * FROM tb_sellers AS tb order by tb.name;"
        return getQueryListSp(sql, nil)
    end

    def getObj(key)
        sql = "SELECT * FROM tb_sellers AS tb WHERE tb.id = $1;"
        return getQueryObjSp(sql, [key])
    end
      
end
