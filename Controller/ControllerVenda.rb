require_relative "../Service/ServiceVenda.rb"

class ControllerVenda
    
    def getList()
        objServiceVenda = ServiceVenda.new
        return objServiceVenda.getList()
    end
    
    def getListProdutos(key)
        objServiceVenda = ServiceVenda.new
        return objServiceVenda.getListProdutos(key)
    end

    def getObj(id)
        objServiceVenda = ServiceVenda.new
        return objServiceVenda.getObj(id)
    end
    
    def add(obj)
        objServiceVenda = ServiceVenda.new
        return objServiceVenda.add(obj)
    end
  
    def update(obj)
        objServiceVenda = ServiceVenda.new
        return objServiceVenda.update(obj)
    end
  
    def delete(key)
        objServiceVenda = ServiceVenda.new
        return objServiceVenda.delete(key)
    end
  
end