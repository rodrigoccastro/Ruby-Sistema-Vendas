class Controller

    def initialize(service)
        @service = service
    end
    
    def list()
        return @service.list()
    end
    
    def find(id)
        return @service.find(id)
    end
    
    def insert(params)
        return @service.insert(params)
    end
  
    def update(params)
        return @service.update(params)
    end
  
end


