require_relative "../Service/ServiceProduto.rb"
require_relative "Util.rb"

class ControllerProduto
    
    def getList()
        objServiceProduto = ServiceProduto.new
        objUtil = Util.new
        arr = objServiceProduto.getList()
	    if !arr.nil?
	    	return arr
	    else
	    	return objUtil.getHttpStatusNotFound
        end
    end
    
    def getObj(id)
        objServiceProduto = ServiceProduto.new
        objUtil = Util.new
        obj = objServiceProduto.getObj(id)
	    if (!obj.nil?)
	    	return obj
	    else
	    	return objUtil.getHttpStatusNotFound
        end
    end
    
    def add(obj)
        objUtil = Util.new
        objServiceProduto = ServiceProduto.new
        resp = objServiceProduto.add(obj)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
    def update(obj)
        objUtil = Util.new
        objServiceProduto = ServiceProduto.new
        resp = objServiceProduto.update(obj)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
    def delete(key)
        objUtil = Util.new
        objServiceProduto = ServiceProduto.new
        resp = objServiceProduto.delete(key)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
end