require_relative "../Service/ServiceVendedor.rb"
require_relative "Util.rb"

class ControllerVendedor
    
    def getList()
        objServiceVendedor = ServiceVendedor.new
        objUtil = Util.new
        arr = objServiceVendedor.getList()
	    if !arr.nil?
	    	return arr
	    else
	    	return objUtil.getHttpStatusNotFound
        end
    end
    
    def getObj(id)
        objServiceVendedor = ServiceVendedor.new
        objUtil = Util.new
        obj = objServiceVendedor.getObj(id)
	    if (!obj.nil?)
	    	return obj
	    else
	    	return objUtil.getHttpStatusNotFound
        end
    end
    
    def add(obj)
        objUtil = Util.new
        objServiceVendedor = ServiceVendedor.new
        resp = objServiceVendedor.add(obj)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
    def update(obj)
        objUtil = Util.new
        objServiceVendedor = ServiceVendedor.new
        resp = objServiceVendedor.update(obj)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
  
    def delete(key)
        objUtil = Util.new
        objServiceVendedor = ServiceVendedor.new
        resp = objServiceVendedor.delete(key)
        if (resp==true)
            return objUtil.getHttpStatusOk
        end
    end
end


