require_relative 'service.rb'
require_relative "../model/product.rb"

class ServiceProduct < Service

    def initialize()
        super(Product)
    end

end