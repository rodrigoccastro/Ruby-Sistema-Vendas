require_relative "../Model/RepositorioProduto.rb"

class ServiceProduto
    
    def initialize()
        @repositorioProduto = RepositorioProduto.new
    end

    def add(obj)
        return @repositorioProduto.add(obj)
    end

    def update(obj)
        return @repositorioProduto.update(obj)
    end

    def delete(key)
        return @repositorioProduto.delete(key)
    end

    def getList()
        return @repositorioProduto.getList()
    end

    def getObj(id)
        return @repositorioProduto.getObj(id)
    end
  
end