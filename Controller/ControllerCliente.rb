require_relative "../Service/ServiceCliente.rb"

class ControllerCliente
    
    def getList()
        objServiceCliente = ServiceCliente.new
        return objServiceCliente.getList()
    end
    
    def getObj(id)
        objServiceCliente = ServiceCliente.new
        return objServiceCliente.getObj(id)
    end
    
    def add(obj)
        objServiceCliente = ServiceCliente.new
        return objServiceCliente.add(obj)
    end
  
    def update(obj)
        objServiceCliente = ServiceCliente.new
        return objServiceCliente.update(obj)
    end
  
    def delete(key)
        objServiceCliente = ServiceCliente.new
        return objServiceCliente.delete(key)
    end
  
end


