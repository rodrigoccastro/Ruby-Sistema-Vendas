require_relative "../Service/ServiceCliente.rb"
require_relative "Util.rb"

class ControllerCliente
    
    def getList()
        objServiceCliente = ServiceCliente.new
        objUtil = Util.new
        arr = objServiceCliente.getList()
	    if !arr.nil?
	    	return arr
	    else
	    	return objUtil.getHttpStatusNotFound
        end
    end
    
    def getObj(id)
        objServiceCliente = ServiceCliente.new
        objUtil = Util.new
        obj = objServiceCliente.getObj(id)
        if (!obj.nil?)
	    	return obj
	    else
	    	return objUtil.getHttpStatusNotFound
        end
    end
    
    def add(obj)
        objUtil = Util.new
        objServiceCliente = ServiceCliente.new
        resp = objServiceCliente.add(obj)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
    def update(obj)
        objUtil = Util.new
        objServiceCliente = ServiceCliente.new
        resp = objServiceCliente.update(obj)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
    def delete(key)
        objUtil = Util.new
        objServiceCliente = ServiceCliente.new
        resp = objServiceCliente.delete(key)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
end


