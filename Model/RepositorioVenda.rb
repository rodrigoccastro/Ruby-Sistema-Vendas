require_relative "Repositorio.rb"
require "ostruct"
require_relative "Connection.rb"

class RepositorioVenda < Repositorio
    
    def add(obj)
        ret = nil;
        objUtil = UtilPropertiesConnection.new
        #conn = PG::Connection.new( objUtil.getHost, objUtil.getPort, nil, nil, objUtil.getDatabaseName, objUtil.getDatabaseLogin, objUtil.getDatabaseSenha )
        #connection = Connection.new
        #conn = connection.getConnection()
        conn = Connection.getConnection()
        begin
            ret = execCommandConn(conn, "BEGIN;", nil, false, false);

            sql = "INSERT INTO tb_vendas (cpf_cliente, cpf_vendedor, datahora) VALUES ($1, $2, CURRENT_TIMESTAMP(0));";
            arrValues = [obj.cpf_cliente, obj.cpf_vendedor];
            ret = execCommandConn(conn, sql, arrValues, false, false);
            sql = "select max(id) as id_venda from tb_vendas"
            ret = execCommandConn(conn, sql, nil, true, false);
            id_venda = ret.id_venda
            obj.produtos.each { |item|
                objProd = getQueryObjSp("select valor from tb_produtos where id=$1", [item.id_produto])
                sql = "INSERT INTO tb_vendas_produtos VALUES ($1, $2, $3, $4);"
                arrValues = [id_venda, item.id_produto,objProd.valor,item.qtd]
                ret = execCommandConn(conn, sql, arrValues, false, false);
            }
            ret = execCommandConn(conn, "COMMIT;", nil, false, false);
            ret = true;
        rescue StandardError, AnotherError => e
            puts "Rescued: #{e.inspect}"
            ret = nil;
            if !con.nil?
                ret = execCommandConn(conn, "ROLLBACK;", nil, false, false);
            end
        ensure
            #connection.setConnection(conn)
            Connection.setConnection(conn)
        end
        return ret;
    end

    def update(obj)
        ret = nil;
        conn = nil
        objUtil = UtilPropertiesConnection.new
        #conn = PG::Connection.new( objUtil.getHost, objUtil.getPort, nil, nil, objUtil.getDatabaseName, objUtil.getDatabaseLogin, objUtil.getDatabaseSenha )
        #connection = Connection.new
        #conn = connection.getConnection()
        conn = Connection.getConnection()
        begin

            ret = execCommandConn(conn, "BEGIN;", nil, false, false);

            sql = "UPDATE tb_vendas SET cpf_cliente=$2, cpf_vendedor=$3 WHERE id=$1;";
            arrValues = [obj.id, obj.cpf_cliente, obj.cpf_vendedor];
            ret = execCommandConn(conn, sql, arrValues, false, false);

            sql = "DELETE FROM tb_vendas_produtos WHERE  id_venda=$1;";
            ret = execCommandConn(conn, sql, [obj.id], false, false);

            obj.produtos.each { |item|
                objProd = getQueryObjSp("select valor from tb_produtos where id=$1", [item.id_produto])
                sql = "INSERT INTO tb_vendas_produtos VALUES ($1, $2, $3, $4);"
                arrValues = [obj.id, item.id_produto,objProd.valor,item.qtd]
                ret = execCommandConn(conn, sql, arrValues, false, false);
            }
            ret = execCommandConn(conn, "COMMIT;", nil, false, false);
            ret = true;
        rescue
            ret = nil;
            if !con.nil?
                ret = execCommandConn(conn, "ROLLBACK;", nil, false, false);
            end
        ensure
            #connection.setConnection(conn)
            Connection.setConnection(conn)
        end
        return ret;
    end

    def delete(key)
        ret = nil;
        conn = nil
        objUtil = UtilPropertiesConnection.new
        #conn = PG::Connection.new( objUtil.getHost, objUtil.getPort, nil, nil, objUtil.getDatabaseName, objUtil.getDatabaseLogin, objUtil.getDatabaseSenha )
        #connection = Connection.new
        #conn = connection.getConnection()
        conn = Connection.getConnection()
        begin

            ret = execCommandConn(conn, "BEGIN;", nil, false, false);

            sql = "DELETE FROM tb_vendas_produtos WHERE  id_venda=$1;";
            ret = executeSpValues(sql, [key]);
            
            sql = "DELETE FROM tb_vendas WHERE  id=$1;";
            ret = executeSpValues(sql, [key]);

            ret = execCommandConn(conn, "COMMIT;", nil, false, false);
            ret = true;
        rescue
            ret = nil;
            if !con.nil?
                ret = execCommandConn(conn, "ROLLBACK;", nil, false, false);
            end
        ensure
            #connection.setConnection(conn)
            Connection.setConnection(conn)
        end
        return ret;
    end

    def getList()
        sql = "SELECT * FROM tb_vendas AS tb order by tb.datahora desc;"
        return getQueryListSp(sql, nil)
    end

    def getListProdutos(key)
        sql = "SELECT * FROM tb_vendas_produtos where id_venda=$1;"
        return getQueryListSp(sql, [key])
    end

    def getObj(key)
        sql = "SELECT * FROM tb_vendas AS tb WHERE tb.id = $1;"
        ret = getQueryObjSp(sql, [key])
    end
  
    
end