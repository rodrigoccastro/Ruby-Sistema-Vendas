require 'pg'
require "ostruct"
require_relative "Connection.rb"
require_relative "UtilPropertiesConnection.rb"

class Repositorio
    
    # execute enviando obj OpenStruct
    def executeSpObj(sql,obj)
        ret = nil
        arrValues = nil
        begin
            if !obj.nil?
                # convert o openstruc em array de dados
                arrValues = obj.each_pair.to_a.transpose[1]
            end
            ret = execCommand(sql, arrValues, false, false)    
        rescue
            ret = nil
        ensure

        end
        return ret
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

    def execCommandConn(conn, sql, arrValues, returnResultSet, listReturn)
        ret = nil;
        resultset = nil;
        begin
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
        rescue StandardError, AnotherError => e
            ret = nil;
            puts "Rescued: #{e.inspect}"
        ensure
            
        end
        return ret
    end

    def execCommand(sql, arrValues, returnResultSet, listReturn)
        ret = nil
        objUtil = UtilPropertiesConnection.new
        #conn = PG::Connection.new( objUtil.getHost, objUtil.getPort, nil, nil, objUtil.getDatabaseName, objUtil.getDatabaseLogin, objUtil.getDatabaseSenha )
        #connection = Connection.new
        conn = Connection.getConnection()
        begin
            ret = execCommandConn(conn, sql, arrValues, returnResultSet, listReturn)
        rescue
            ret = nil
        ensure
            #connection.setConnection(conn)
            Connection.setConnection(conn)
        end
        return ret
    end
    
    def prepareListObjRep(resultset) 
        ret = nil
        begin
            tabela = []
            count = -1
            resultset.each do |row|
                count = count+1
                tabela[count] = OpenStruct.new(row)
            end           
            if (count >= 0)
                ret = tabela
            end
        rescue
            ret = nil
        ensure

        end
        return ret
    end    
    
    def prepareObjRep(resultset)
        ret = nil
        begin
            resultset.each do |row|
                ret = OpenStruct.new(row)
            end  
        rescue
            ret = nil
        ensure

        end
        return ret
    end
  
end