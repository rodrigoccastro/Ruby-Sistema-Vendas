require_relative "../Repository/RepositoryProduct.rb"

class ServiceProduct
    
    def initialize()
        @repositoryProduct = RepositoryProduct.new
    end

    def add(obj)
        return @repositoryProduct.add(obj)
    end

    def update(obj)
        return @repositoryProduct.update(obj)
    end

    def delete(key)
        return @repositoryProduct.delete(key)
    end

    def getList()
        return @repositoryProduct.getList()
    end

    def getObj(id)
        return @repositoryProduct.getObj(id)
    end
  
end