require_relative 'service.rb'
require_relative "../model/sale.rb"

class ServiceSale < Service

    def initialize()
        super(Sale)
    end

end