require 'pg'

class Service

    def initialize(model)
        @model = model
    end

    def list()
        return @model.order('updated DESC');
    end

    def find(id)
        begin
            return @model.find(id)
        rescue
            return nil
        end
    end

    def insert(params)
        begin
            obj = @model.new(params.to_h)
            return obj.save ? get_json_success(obj) : get_json_error(obj)
        rescue StandardError, AnotherError => e
            return get_json_error_msg(e.inspect)
        end
    end

    def update(params)
        begin
            obj = @model.find(params.id)
            return get_json_error_msg('Not found object by id.') if obj.nil?
            params.updated = Time.now
            return obj.update(params.to_h) ? get_json_success(obj) : get_json_error(obj)
        rescue StandardError, AnotherError => e
            return get_json_error_msg(e.inspect)
        end
    end
    
    def get_json_success(obj)
        return OpenStruct.new(:success => true, :data => obj)
    end

    def get_json_error(obj)
        return OpenStruct.new(:success => false, :errors => obj.errors)
    end

    def get_json_error_msg(msg)
        return OpenStruct.new(:success => false, :message => msg)
    end
    
end

