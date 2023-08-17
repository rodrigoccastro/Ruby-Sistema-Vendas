require_relative 'service.rb'
require_relative "../model/client.rb"

class ServiceClient < Service

    def initialize()
        super(Client)
    end

end

