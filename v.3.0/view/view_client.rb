require_relative "../controller/controller_client.rb"
require_relative "util.rb"
require_relative "view.rb"

class ViewClient < View

    def initialize()
        super(ControllerClient.new, 'Client')
    end

    def printObj(obj)               
        puts "Id: #{obj.id} - Name: #{obj.name} - Email: #{obj.email} - Phone: #{obj.phone} - Address: #{obj.address} - Address: #{obj.datetime}"
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
    
        return OpenStruct.new(:id => id, :name => name, :email => email, :phone => phone, :address => address)
    end

end