require_relative "util.rb"

class View

    def initialize(controller, nameModel)
        @controller = controller
        @nameList = nameModel + 's'
        @nameItem = nameModel
    end

    def list()
        arr = @controller.list()
        if (!arr.nil?)
            puts "\n#{@nameList} List"
            puts "Number of #{@nameList}: #{arr.size}"
            puts "------------------------------"
            arr.each do |obj|
                printObj(obj)
            end           
        else
            puts "\nList of #{@nameList} is empty!"
        end
    end

    def find()
        puts "\nEnter id:"
        id = gets.delete!("\n")
        obj = @controller.find(id)
        if obj.nil?
            puts "\n#{@nameItem} NOT found!"
            return nil 
        else
            printObj(obj)
        end
    end  

    def printObj(obj)               
        puts "--not implemented printObj--"
    end

    def insert()
        obj = getData()
        return if obj.nil?
        resp = @controller.insert(obj)
    
        if (resp[:success])
            puts "\n#{@nameItem} saved!"
        else
            puts "\nError: #{@nameItem} NOT saved!"
            if !resp[:errors].nil?
                resp[:errors].each do |error|
                    puts "--> attribute: #{error.attribute} - type: #{error.type} - options: #{error.options}"
                end
            end
            puts "--> message: #{resp[:message]}" if !resp[:message].nil?            
        end
    end

    def getData()
        puts "--not implemented getData--"
    end

    def update()
        obj = getData()
        pesq = @controller.find(obj[:id])
        if pesq.nil?
            puts "\n#{@nameItem} NOT found by id #{obj[:id]} !"
            return nil 
        end
        resp = @controller.update(obj)
    
        if (resp[:success])
            puts "\n#{@nameItem} updated!"
        else
            puts "\nError: #{@nameItem} NOT saved!"
            if !resp[:errors].nil?
                !resp[:errors].each do |error|
                    puts "--> attribute: #{error.attribute} - type: #{error.type} - options: #{error.options}"
                end
            end
            puts "--> message: #{resp[:message]}" if !resp[:message].nil?           
        end
    end

end