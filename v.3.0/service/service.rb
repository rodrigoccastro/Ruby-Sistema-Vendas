require 'pg'

class Service

    def initialize(model)
        @model = model
    end

    def list()
        return @model.order('datetime DESC');
    end

    def find(id)
        begin
            return @model.find(id)
        rescue
            return nil
        end
    end

    def insert(params)
        obj = @model.new(params.to_h)
        return obj.save ? get_json_success(obj) : get_json_error(obj)
    end

    def update(params)
        obj = @model.find(params.id)
        return obj.update(params.to_h) ? get_json_success(obj) : get_json_error(obj)
    end
    
    def get_json_success(obj)
        return OpenStruct.new(:success => true, :data => obj)
    end

    def get_json_error(obj)
        return OpenStruct.new(:success => false, :errors => obj.errors)
    end
    
end

