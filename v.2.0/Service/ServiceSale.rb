require_relative "../Repository/RepositorySale.rb"

class ServiceSale
    
    def initialize()
        @repositorySale = RepositorySale.new
    end

    def add(obj)
        return @repositorySale.add(obj)
    end

    def update(obj)
        return @repositorySale.update(obj)
    end

    def delete(key)
        return @repositorySale.delete(key)
    end

    def getList()
        return @repositorySale.getList()
    end

    def getListProducts(key)
        return @repositorySale.getListProducts(key)
    end

    def getObj(id)
        return @repositorySale.getObj(id)
    end
  
end