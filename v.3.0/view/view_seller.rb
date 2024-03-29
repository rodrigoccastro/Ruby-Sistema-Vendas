require_relative "../controller/controller_seller.rb"
require_relative "util.rb"
require_relative "view.rb"

class ViewSeller < View

    def initialize()
        super(ControllerSeller.new, 'Seller')
    end

    def printObj(obj)               
        puts "Id: #{obj.id} - Name: #{obj.name} - Email: #{obj.email} - Phone: #{obj.phone} - Address: #{obj.address} - Created: #{obj.created} - Updated: #{obj.updated}"
    end

    def getData()
        puts "\nEnter id:"
        id = gets.delete!("\n")
        puts "\nEnter name:"
        name = gets.delete!("\n")
        puts "\nEnter email:"
        email = gets.delete!("\n")
        puts "\nEnter phone:"
        phone = gets.delete!("\n")
        puts "\nEnter address:"
        address = gets.delete!("\n")
    
        return {:id => id, :name => name, :email => email, :phone => phone, :address => address} 
    end

end