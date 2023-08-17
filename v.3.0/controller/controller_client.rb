require_relative 'controller.rb'
require_relative "../service/service_client.rb"

class ControllerClient < Controller
    
    def initialize()
        super(ServiceClient.new)
    end
    
end


