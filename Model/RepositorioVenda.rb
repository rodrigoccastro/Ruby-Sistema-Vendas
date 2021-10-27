require_relative "Repositorio.rb"
require "ostruct"

class RepositorioVenda < Repositorio
    
    def add(obj)
        sql = "INSERT INTO tb_vendas (cpf_cliente, cpf_vendedor, datahora) VALUES ($1, $2, CURRENT_TIMESTAMP(0));";
        arrValues = [obj.cpf_cliente, obj.cpf_vendedor];
        ret = executeSpValues(sql, arrValues);

        sql = "select max(id) as id_venda from tb_vendas"
        ret = getQueryObjSp(sql, nil);
        id_venda = ret.id_venda

        obj.produtos.each { |item|
            objProd = getQueryObjSp("select valor from tb_produtos where id=$1", [item.id_produto])
            sql = "INSERT INTO tb_vendas_produtos VALUES ($1, $2, $3, $4);"
            arrValues = [id_venda, item.id_produto,objProd.valor,item.qtd]
            ret = executeSpValues(sql, arrValues)
        }

        return ret;
    end

    def update(obj)
        ret = false;
        sql = "UPDATE tb_vendas SET cpf_cliente=$2, cpf_vendedor=$3 WHERE id=$1;";
        arrValues = [obj.id, obj.cpf_cliente, obj.cpf_vendedor];
        ret = executeSpValues(sql, arrValues);

        sql = "DELETE FROM tb_vendas_produtos WHERE  id_venda=$1;";
        ret = executeSpValues(sql, [obj.id]);

        obj.produtos.each { |item|
            objProd = getQueryObjSp("select valor from tb_produtos where id=$1", [item.id_produto])
            sql = "INSERT INTO tb_vendas_produtos VALUES ($1, $2, $3, $4);"
            arrValues = [obj.id, item.id_produto,objProd.valor,item.qtd]
            ret = executeSpValues(sql, arrValues)
        }
        return ret;
    end

    def delete(key)
        sql = "DELETE FROM tb_vendas_produtos WHERE  id_venda=$1;";
        ret = executeSpValues(sql, [key]);
        sql = "DELETE FROM tb_vendas WHERE  id=$1;";
        ret = executeSpValues(sql, [key]);
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