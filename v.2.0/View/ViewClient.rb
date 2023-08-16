require_relative "../Controller/ControllerClient.rb"
require_relative "Util.rb"

class ViewClient

    def getList()
        objController = ControllerClient.new
        arr = objController.getList()
        if (!arr.nil?)
            puts "\nClients List"
            puts "Number of Clients: #{arr.size}"
            puts "------------------------------"
            arr.each do |obj|
                printObj(obj)
            end           
        else
            puts "\nList of Clients is empty!"
        end
    end

    def printObj(obj)               
        puts "Id: #{obj.id} - Name: #{obj.name} - Email: #{obj.email} - Phone: #{obj.phone} - Address: #{obj.address}"
    end

    def getObj()
        objController = ControllerClient.new
        objUtil = Util.new
        puts "\nEnter id:"
        id = gets.delete!("\n")
        obj = objController.getObj(id)
        if (!obj.nil?)
            printObj(obj)
        else
            puts "\nClient NOT found!"
        end
    end  

    def add()
        objController = ControllerClient.new
        objUtil = Util.new
    
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
    
        obj = OpenStruct.new(:id => id, :name => name, :email => email, :phone => phone, :address => address)
        resp = objController.add(obj)
    
        if (!resp.nil?)
            puts "\nClient saved!"
        else
            puts "\nError: Cliente NOT saved!"
        end
    end

    def update()
        objController = ControllerClient.new
        objUtil = Util.new
    
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
    
        obj = OpenStruct.new(:id => id, :name => name, :email => email, :phone => phone, :address => address)
        resp = objController.update(obj)
    
        if (!resp.nil?)
            puts "\nClient updated!"
        else
            puts "\nError: Cliente NOT saved!"
        end
    end

    def delete()
        objController = ControllerClient.new
        objUtil = Util.new
    
        puts "\nEnter id:"
        id = gets.delete!("\n")
        resp = objController.delete(id)
    
        if (!resp.nil?)
            puts "\nClient deleetd!"
        else
            puts "\nError: Cliente NOT deleted!"
        end
    end


end