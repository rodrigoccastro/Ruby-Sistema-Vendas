require_relative "../Controller/ControllerSeller.rb"
require_relative "Util.rb"

class ViewSeller


    def getList()
        objController = ControllerSeller.new
        objUtil = Util.new
        arr = objController.getList()
        if (!arr.nil?)
            puts "\nList of Sellers"
            puts "NUmber of Sellers: #{arr.size}"
            puts "------------------------------"
            arr.each do |obj|
                printObj(obj)
            end           
        else
            puts "\nList of sellers is empty!"
        end
    end

    def printObj(obj)               
        puts "Id: #{obj.id} - Name: #{obj.name} - Email: #{obj.email} - Phone: #{obj.phone} - Address: #{obj.address}"
    end

    def getObj()
        objController = ControllerSeller.new
        objUtil = Util.new
        puts "\nEnter Id:"
        id = gets.delete!("\n")
        obj = objController.getObj(id)
        if (!obj.nil?)
            printObj(obj)
        else
            puts "\nSeller NOT found!"
        end
    end  

    def add()
        objController = ControllerSeller.new
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
            puts "\nSeller saved!"
        else
            puts "\nError: Seller NOT saved!"
        end
    end

    def update()
        objController = ControllerSeller.new
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
            puts "\nSeller saved!"
        else
            puts "\nError: Seller NOT saved!"
        end
    end

    def delete()
        objController = ControllerSeller.new
        objUtil = Util.new
    
        puts "\nEnter Id:"
        id = gets.delete!("\n")
        resp = objController.delete(id)
    
        if (!resp.nil?)
            puts "\nSeller deleted!"
        else
            puts "\nError: Seller NOT deleted!"
        end
    end

end