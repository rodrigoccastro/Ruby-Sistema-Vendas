require_relative "../Controller/ControllerProduct.rb"
require_relative "Util.rb"
require "ostruct"

class ViewProduct

    def getList()
        objController = ControllerProduct.new
        objUtil = Util.new
        arr = objController.getList()
        if (!arr.nil?)
            puts "\nList of Products"
            puts "Number of Products: #{arr.size}"
            puts "------------------------------"
            arr.each do |obj|
                printObj(obj)
            end           
        else
            puts "\nList of Products is empty!"
        end
        
    end
    
    def printObj(obj)               
        puts "Id: #{obj.id} - Name: #{obj.name} - Price: #{obj.price}"
    end

    def getObj()
        objController = ControllerProduct.new
        objUtil = Util.new
        puts "\nEnter id:"
        id = gets.delete!("\n")
        obj = objController.getObj(id)
        if (!obj.nil?)
            printObj(obj)
        else
            puts "\nProduct not found!"
        end

    end

    def add()
        objController = ControllerProduct.new
        objUtil = Util.new
    
        puts "\nEnter id:"
        id = gets.delete!("\n")
        puts "\nEnter name:"
        name = gets.delete!("\n")
        puts "\nEnter price:"
        price = gets.delete!("\n")
    
        obj = OpenStruct.new(:id => id, :name => name, :price => price)
        resp = objController.add(obj)
    
        if (!resp.nil?)
            puts "\nProduct saved!"
        else
            puts "\nError: Product NOT saved!"
        end
    end

    def update()
        objController = ControllerProduct.new
        objUtil = Util.new
    
        puts "\nEnter id:"
        id = gets.delete!("\n")
        puts "\nEnter name:"
        name = gets.delete!("\n")
        puts "\nEnter price:"
        price = gets.delete!("\n")
    
        obj = OpenStruct.new(:id => id, :name => name, :price => price)
        resp = objController.update(obj)
    
        if (!resp.nil?)
            puts "\nProduct saved!"
        else
            puts "\nError: Product NOT saved!"
        end
    end


    def delete()
        objController = ControllerProduct.new
        objUtil = Util.new
    
        puts "\nEnter id:"
        id = gets.delete!("\n")
        resp = objController.delete(id)
    
        if (!resp.nil?)
            puts "\nProduct deleted!"
        else
            puts "\nError: Product NOT deleted!"
        end
    end



end