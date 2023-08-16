require_relative "../Service/ServiceClient.rb"

class ControllerClient
    
    def getList()
        objServiceClient = ServiceClient.new
        return objServiceClient.getList()
    end
    
    def getObj(id)
        objServiceClient = ServiceClient.new
        return objServiceClient.getObj(id)
    end
    
    def add(obj)
        objServiceClient = ServiceClient.new
        return objServiceClient.add(obj)
    end
  
    def update(obj)
        objServiceClient = ServiceClient.new
        return objServiceClient.update(obj)
    end
  
    # def delete(key)
    #     objServiceClient = ServiceClient.new
    #     return objServiceClient.delete(key)
    # end
  
end


