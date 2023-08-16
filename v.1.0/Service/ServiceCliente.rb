require_relative "../Model/RepositorioCliente.rb"

class ServiceCliente
    
    def initialize()
        @repositorioCliente = RepositorioCliente.new
    end

    def add(obj)
        return @repositorioCliente.add(obj)
    end

    def update(obj)
        return @repositorioCliente.update(obj)
    end

    def delete(key)
        return @repositorioCliente.delete(key)
    end

    def getList()
        return @repositorioCliente.getList()
    end

    def getObj(id)
        return @repositorioCliente.getObj(id)
    end
  
end

