require_relative 'controller.rb'
require_relative "../service/service_product.rb"

class ControllerProduct < Controller
    
    def initialize()
        super(ServiceProduct.new)
    end
    
end