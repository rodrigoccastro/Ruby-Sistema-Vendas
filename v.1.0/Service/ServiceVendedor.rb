require_relative "../Model/RepositorioVendedor.rb"

class ServiceVendedor
    
    def initialize()
        @repositorioVendedor = RepositorioVendedor.new
    end

    def add(obj)
        return @repositorioVendedor.add(obj)
    end

    def update(obj)
        return @repositorioVendedor.update(obj)
    end

    def delete(key)
        return @repositorioVendedor.delete(key)
    end

    def getList()
        return @repositorioVendedor.getList()
    end

    def getObj(id)
        return @repositorioVendedor.getObj(id)
    end
  
end

