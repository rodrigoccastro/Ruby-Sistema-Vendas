require_relative "../Service/ServiceSale.rb"

class ControllerSale
    
    def getList()
        objServiceSale = ServiceSale.new
        return objServiceSale.getList()
    end
    
    def getListProducts(key)
        objServiceSale = ServiceSale.new
        return objServiceSale.getListProducts(key)
    end

    def getObj(id)
        objServiceSale = ServiceSale.new
        return objServiceSale.getObj(id)
    end
    
    def add(obj)
        objServiceSale = ServiceSale.new
        return objServiceSale.add(obj)
    end
  
    def update(obj)
        objServiceSale = ServiceSale.new
        return objServiceSale.update(obj)
    end
  
    # def delete(key)
    #     objServiceSale = ServiceSale.new
    #     return objServiceSale.delete(key)
    # end
  
end