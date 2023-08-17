require_relative 'controller.rb'
require_relative "../service/service_seller.rb"

class ControllerSeller < Controller
    
    def initialize()
        super(ServiceSeller.new)
    end
    
end