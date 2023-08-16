require_relative "Repository.rb"
require "ostruct"

class RepositoryClient < Repository
    
    def add(obj)
        sql = "INSERT INTO tb_clients VALUES ($1,$2,$3,$4,$5);"
        return executeSpObj(sql, obj)
    end

    def update(obj)
        sql = "UPDATE tb_clients set name=$2, email=$3, phone=$4, address=$5 where id=$1;"
        return executeSpObj(sql, obj)
    end

    def delete(key)
        sql = "delete from tb_clients where id=$1;"
        return executeSpValues(sql, [key])
    end

    def getList()
        sql = "SELECT * FROM tb_clients AS tb order by tb.name;"
        return getQueryListSp(sql, nil)
    end

    def getObj(key)
        sql = "SELECT * FROM tb_clients AS tb WHERE tb.id = $1;"
        return getQueryObjSp(sql, [key])
    end
        
end