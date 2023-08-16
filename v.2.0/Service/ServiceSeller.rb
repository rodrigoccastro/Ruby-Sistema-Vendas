require_relative "../Repository/RepositorySeller.rb"

class ServiceSeller
    
    def initialize()
        @repositorySeller = RepositorySeller.new
    end

    def add(obj)
        return @repositorySeller.add(obj)
    end

    def update(obj)
        return @repositorySeller.update(obj)
    end

    def delete(key)
        return @repositorySeller.delete(key)
    end

    def getList()
        return @repositorySeller.getList()
    end

    def getObj(id)
        return @repositorySeller.getObj(id)
    end
  
end

