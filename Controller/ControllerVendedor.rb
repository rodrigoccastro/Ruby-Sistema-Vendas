require_relative "../Service/ServiceVendedor.rb"

class ControllerVendedor
    
    def getList()
        objServiceVendedor = ServiceVendedor.new
        return objServiceVendedor.getList()
    end
    
    def getObj(id)
        objServiceVendedor = ServiceVendedor.new
        return objServiceVendedor.getObj(id)
    end
    
    def add(obj)
        objServiceVendedor = ServiceVendedor.new
        return objServiceVendedor.add(obj)
    end
  
    def update(obj)
        objServiceVendedor = ServiceVendedor.new
        return objServiceVendedor.update(obj)
    end
  
    def delete(key)
        objServiceVendedor = ServiceVendedor.new
        return objServiceVendedor.delete(key)
    end
end


