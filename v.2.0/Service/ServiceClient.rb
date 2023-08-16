require_relative "../Repository/RepositoryClient.rb"

class ServiceClient
    
    def initialize()
        @repositoryClient = RepositoryClient.new
    end

    def add(obj)
        return @repositoryClient.add(obj)
    end

    def update(obj)
        return @repositoryClient.update(obj)
    end

    def delete(key)
        return @repositoryClient.delete(key)
    end

    def getList()
        return @repositoryClient.getList()
    end

    def getObj(id)
        return @repositoryClient.getObj(id)
    end
  
end

