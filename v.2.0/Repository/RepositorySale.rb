require_relative "Repository.rb"
require "ostruct"
require_relative "Connection.rb"

class RepositorySale < Repository
    
    def add(obj)
        ret = nil;
        objUtil = UtilPropertiesConnection.new
        conn = Connection.getConnection()
        begin
            ret = execCommandConn(conn, "BEGIN;", nil, false, false);

            sql = "INSERT INTO tb_sales (id_client, id_seller, datetime) VALUES ($1, $2, CURRENT_TIMESTAMP(0));";
            arrValues = [obj.id_client, obj.id_seller];
            ret = execCommandConn(conn, sql, arrValues, false, false);
            sql = "select max(id) as id_sale from tb_sales"
            ret = execCommandConn(conn, sql, nil, true, false);
            id_sale = ret.id_sale
            obj.products.each { |item|
                objProd = getQueryObjSp("select price from tb_products where id=$1", [item.id_product])
                sql = "INSERT INTO tb_sales_products VALUES ($1, $2, $3, $4);"
                arrValues = [id_sale, item.id_product, objProd.price, item.quantity]
                ret = execCommandConn(conn, sql, arrValues, false, false);
            }
            ret = execCommandConn(conn, "COMMIT;", nil, false, false);
            ret = true;
        rescue StandardError, AnotherError => e
            puts "Rescued: #{e.inspect}"
            if !conn.nil?
                execCommandConn(conn, "ROLLBACK;", nil, false, false);
            end
            ret = nil;
        ensure
            Connection.setConnection(conn)
        end
        return ret;
    end

    def update(obj)
        ret = nil;
        conn = nil
        objUtil = UtilPropertiesConnection.new
        conn = Connection.getConnection()
        begin
            sale_id = obj.id
            ret = execCommandConn(conn, "BEGIN;", nil, false, false);

            sql = "UPDATE tb_sales SET id_client=$2, id_seller=$3 WHERE id=$1;";
            arrValues = [sale_id, obj.id_client, obj.id_seller];
            ret = execCommandConn(conn, sql, arrValues, false, false);

            sql = "DELETE FROM tb_sales_products WHERE  id_sale=$1;";
            ret = execCommandConn(conn, sql, [sale_id], false, false);
            obj.products.each { |item|
                objProd = getQueryObjSp("select price from tb_products where id=$1", [item.id_product])
                sql = "INSERT INTO tb_sales_products VALUES ($1, $2, $3, $4);"
                arrValues = [sale_id,item.id_product,objProd.price,item.quantity]
                ret = execCommandConn(conn, sql, arrValues, false, false);
            }
            ret = execCommandConn(conn, "COMMIT;", nil, false, false);
            ret = true;
        rescue StandardError, AnotherError => e
            puts "Error: #{e.inspect}"
            ret = nil;
            if !conn.nil?
                ret = execCommandConn(conn, "ROLLBACK;", nil, false, false);
            end
        ensure
            Connection.setConnection(conn)
        end
        return ret;
    end

    def delete(key)
        ret = nil;
        conn = nil
        objUtil = UtilPropertiesConnection.new
        conn = Connection.getConnection()
        begin

            ret = execCommandConn(conn, "BEGIN;", nil, false, false);

            sql = "DELETE FROM tb_sales_produtcts WHERE  id_sale=$1;";
            ret = executeSpValues(sql, [key]);
            
            sql = "DELETE FROM tb_sales WHERE  id=$1;";
            ret = executeSpValues(sql, [key]);

            ret = execCommandConn(conn, "COMMIT;", nil, false, false);
            ret = true;
        rescue
            ret = nil;
            if !conn.nil?
                ret = execCommandConn(conn, "ROLLBACK;", nil, false, false);
            end
        ensure
            Connection.setConnection(conn)
        end
        return ret;
    end

    def getList()
        sql = "SELECT * FROM tb_sales AS tb order by tb.datetime desc;"
        return getQueryListSp(sql, nil)
    end

    def getListProducts(key)
        sql = "SELECT * FROM tb_sales_products where id_sale=$1;"
        return getQueryListSp(sql, [key])
    end

    def getObj(key)
        sql = "SELECT * FROM tb_sales AS tb WHERE tb.id = $1;"
        ret = getQueryObjSp(sql, [key])
    end
  
    
end