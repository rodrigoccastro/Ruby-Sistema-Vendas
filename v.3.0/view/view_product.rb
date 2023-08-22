require_relative "../controller/controller_product.rb"
require_relative "util.rb"
require_relative "view.rb"

class ViewProduct < View

    def initialize()
        super(ControllerProduct.new, 'Product')
    end

    def printObj(obj)               
        puts "Id: #{obj.id} - Name: #{obj.name} - Price: #{obj.price} - Created: #{obj.created} - Updated: #{obj.updated}"
    end

    def getData()
        puts "\nEnter id:"
        id = gets.delete!("\n")
        puts "\nEnter name:"
        name = gets.delete!("\n")
        puts "\nEnter price:"
        price = gets.delete!("\n")
    
        return {:id => id, :name => name, :price => price}
    end

end