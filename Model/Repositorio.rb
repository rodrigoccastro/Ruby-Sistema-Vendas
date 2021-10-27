require 'pg'
require "ostruct"
require_relative "UtilPropertiesConnection.rb"

class Repositorio
    
    # execute enviando obj OpenStruct
    def executeSpObj(sql,obj)
        # convert o openstruc em array de dados
        arrValues = nil
        if !obj.nil?
            arrValues = obj.each_pair.to_a.transpose[1]
        end
        return execCommand(sql, arrValues, false, false)
    end

    # execute enviando arr de valores
    def executeSpValues(sql,arrValues)
        return execCommand(sql, arrValues, false, false)
    end

    # query que retorna um obj
    def getQueryObjSp(sql, arrValues)
        return execCommand(sql, arrValues, true, false)
    end 
    
    # query que retorna uma lista de objetos
    def getQueryListSp(sql, arrValues)
        return execCommand(sql, arrValues, true, true)
    end 

    def execCommand(sql, arrValues, returnResultSet, listReturn)
        ret = nil;
        resultset = nil;
        if (returnResultSet == false)
            ret = false
        end
        objUtil = UtilPropertiesConnection.new
        conn = PG::Connection.new( objUtil.getHost, objUtil.getPort, nil, nil, objUtil.getDatabaseName, objUtil.getDatabaseLogin, objUtil.getDatabaseSenha )
        if (returnResultSet) # query
            if (arrValues.nil?) # sem parametros de entrada
                resultset = conn.exec(sql)
            else # com parametros de entrada
                resultset = conn.exec_params(sql, arrValues)

            end
            if listReturn==true # se retorna uma lista
                ret = prepareListObjRep(resultset)
            else
                ret = prepareObjRep(resultset)
            end
        else # insert, update ou delete
            if (arrValues.nil?) # sem parametros de entrada
                conn.exec(sql)
            else # com parametros de entrada
                conn.exec_params(sql,arrValues)
            end
            ret = true;
        end
        #conn.disconnect
        return ret
    end
    
    def prepareListObjRep(resultset) 
        tabela = []
        count = -1
        resultset.each do |row|
            count = count+1
            tabela[count] = OpenStruct.new(row)
        end           
        if (count >= 0)
            return tabela
        else
            return nil
        end
    end    
    
    def prepareObjRep(resultset)
        obj = nil
        resultset.each do |row|
            obj = OpenStruct.new(row)
        end  
        return obj         
    end
  
end