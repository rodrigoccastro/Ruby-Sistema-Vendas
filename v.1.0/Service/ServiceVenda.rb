require_relative "../Model/RepositorioVenda.rb"

class ServiceVenda
    
    def initialize()
        @repositorioVenda = RepositorioVenda.new
    end

    def add(obj)
        return @repositorioVenda.add(obj)
    end

    def update(obj)
        return @repositorioVenda.update(obj)
    end

    def delete(key)
        return @repositorioVenda.delete(key)
    end

    def getList()
        return @repositorioVenda.getList()
    end

    def getListProdutos(key)
        return @repositorioVenda.getListProdutos(key)
    end

    def getObj(id)
        return @repositorioVenda.getObj(id)
    end
  
end