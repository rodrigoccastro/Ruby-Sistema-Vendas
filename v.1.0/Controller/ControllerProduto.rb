require_relative "../Service/ServiceProduto.rb"

class ControllerProduto
    
    def getList()
        objServiceProduto = ServiceProduto.new
        return objServiceProduto.getList()
    end
    
    def getObj(id)
        objServiceProduto = ServiceProduto.new
        return objServiceProduto.getObj(id)
    end
    
    def add(obj)
        objServiceProduto = ServiceProduto.new
        return objServiceProduto.add(obj)
    end
  
    def update(obj)
        objServiceProduto = ServiceProduto.new
        return objServiceProduto.update(obj)
    end
  
    def delete(key)
        objServiceProduto = ServiceProduto.new
        return objServiceProduto.delete(key)
    end
  
end