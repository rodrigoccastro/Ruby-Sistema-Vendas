require_relative 'controller.rb'
require_relative "../service/service_sale.rb"

class ControllerSale < Controller
    
    def initialize()
        super(ServiceSale.new)
    end
    
end