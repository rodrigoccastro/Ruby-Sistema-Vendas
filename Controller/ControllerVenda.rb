require_relative "../Service/ServiceVenda.rb"
require_relative "Util.rb"

class ControllerVenda
    
    def getList()
        objServiceVenda = ServiceVenda.new
        objUtil = Util.new
        arr = objServiceVenda.getList()
	    if !arr.nil?
	    	return arr
	    else
	    	return objUtil.getHttpStatusNotFound
        end
    end
    
    def getListProdutos(key)
        objServiceVenda = ServiceVenda.new
        objUtil = Util.new
        arr = objServiceVenda.getListProdutos(key)
	    if !arr.nil?
	    	return arr
	    else
	    	return objUtil.getHttpStatusNotFound
        end
    end

    def getObj(id)
        objServiceVenda = ServiceVenda.new
        objUtil = Util.new
        obj = objServiceVenda.getObj(id)
	    if (!obj.nil?)
	    	return obj
	    else
	    	return objUtil.getHttpStatusNotFound
        end
    end
    
    def add(obj)
        objUtil = Util.new
        objServiceVenda = ServiceVenda.new
        resp = objServiceVenda.add(obj)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
    def update(obj)
        objUtil = Util.new
        objServiceVenda = ServiceVenda.new
        resp = objServiceVenda.update(obj)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
    def delete(key)
        objUtil = Util.new
        objServiceVenda = ServiceVenda.new
        resp = objServiceVenda.delete(key)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
end