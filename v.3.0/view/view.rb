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
        if (!obj.nil?)
            printObj(obj)
        else
            puts "\n#{@nameItem} NOT found!"
        end
    end  

    def printObj(obj)               
        puts "--not implemented printObj--"
    end

    def insert()
        obj = getData()
        resp = @controller.insert(obj)
    
        if (resp.success)
            puts "\n#{@nameItem} saved!"
        else
            puts "\nError: #{@nameItem} NOT saved!"
            resp.errors.each do |error|
                puts "--> attribute: #{error.attribute} - type: #{error.type} - options: #{error.options}"
            end
        end
    end

    def getData()
        puts "--not implemented getData--"
    end

    def update()
        obj = getData()
        resp = @controller.update(obj)
    
        if (resp.success)
            puts "\n#{@nameItem} updated!"
        else
            puts "\nError: #{@nameItem} NOT saved!"
            resp.errors.each do |error|
                puts "--> attribute: #{error.attribute} - type: #{error.type} - options: #{error.options}"
            end
        end
    end

end