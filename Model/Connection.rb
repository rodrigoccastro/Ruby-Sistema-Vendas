require 'pg'
require_relative "UtilPropertiesConnection.rb"

class Connection
    
    @@arrConnection = []
  
    def self.getConnection()
        objUtil = UtilPropertiesConnection.new
        ret = nil
        begin
            if @@arrConnection.size == 0
                ret = PG::Connection.new( objUtil.getHost, objUtil.getPort, nil, nil, objUtil.getDatabaseName, objUtil.getDatabaseLogin, objUtil.getDatabaseSenha )
            else
                ret = @@arrConnection.delete_at(@@arrConnection.size-1)
                if ret.finished?
                    ret = getConnection()
                end 
            end 
        rescue StandardError, AnotherError => e
            puts "Rescued conn: #{e.inspect}"
        ensure

        end
        return ret
    end

    def self.setConnection(conn)
        objUtil = UtilPropertiesConnection.new
        begin
            @@arrConnection[@@arrConnection.size] = conn
        rescue

        ensure

        end
    end
  
end