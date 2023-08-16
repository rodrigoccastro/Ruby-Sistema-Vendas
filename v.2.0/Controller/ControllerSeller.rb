require_relative "../Service/ServiceSeller.rb"

class ControllerSeller
    
    def getList()
        objServiceSeller = ServiceSeller.new
        return objServiceSeller.getList()
    end
    
    def getObj(id)
        objServiceSeller = ServiceSeller.new
        return objServiceSeller.getObj(id)
    end
    
    def add(obj)
        objServiceSeller = ServiceSeller.new
        return objServiceSeller.add(obj)
    end
  
    def update(obj)
        objServiceSeller = ServiceSeller.new
        return objServiceSeller.update(obj)
    end
  
    # def delete(key)
    #     objServiceSeller = ServiceSeller.new
    #     return objServiceSeller.delete(key)
    # end
end


