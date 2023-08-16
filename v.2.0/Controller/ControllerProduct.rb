require_relative "../Service/ServiceProduct.rb"

class ControllerProduct
    
    def getList()
        objServiceProduct = ServiceProduct.new
        return objServiceProduct.getList()
    end
    
    def getObj(id)
        objServiceProduct = ServiceProduct.new
        return objServiceProduct.getObj(id)
    end
    
    def add(obj)
        objServiceProduct = ServiceProduct.new
        return objServiceProduct.add(obj)
    end
  
    def update(obj)
        objServiceProduct = ServiceProduct.new
        return objServiceProduct.update(obj)
    end
  
    # def delete(key)
    #     objServiceProduct = ServiceProduct.new
    #     return objServiceProduct.delete(key)
    # end
  
end