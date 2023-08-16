require_relative "ViewClient.rb"
require_relative "ViewProduct.rb"
require_relative "ViewSeller.rb"
require_relative "ViewSale.rb"

def printTitle()
    puts "                                                                    "
    puts "********************************************************************"
    puts "                       SALES SYSTEM IN RUBY                         "
    puts "********************************************************************"
end

def printMenu()
    puts "                                                                    "
    puts "                            MENU PRINCIPAL                          "
    puts "Product:   1 - List |   2 - Find |   3 - Insert |   4 - Update"
    puts "Seller:    6 - List |   7 - Find |   8 - Insert |   9 - Update"
    puts "Client:   11 - List |  12 - Find |  13 - Insert |  14 - Update"
    puts "Sales:    16 - List |  17 - Find |  18 - Insert |  19 - Update  |  0 - Sair"
    puts "---------------------------------------------------------------------------------------------------------"
end

def executeView(opcao) 

    case opcao
    when 1
        puts "\nYou selected List of Products:\n"
        ViewProduct.new.getList()
    when 2
        puts "\nYou selected Find Product:\n"
        ViewProduct.new.getObj()
    when 3
        puts "\nYou selected Insert Product:\n"
        ViewProduct.new.add()
    when 4
        puts "\nYou selected Update Product:\n"
        ViewProduct.new.update()
    when 6
        puts "\nYou selected List of Sellers:\n"
        ViewSeller.new.getList()
    when 7
        puts "\nYou selected Find Seller:\n"
        ViewSeller.new.getObj()
    when 8
        puts "\nYou selected Insert Seller:\n"
        ViewSeller.new.add()
    when 9
        puts "\nYou selected Update Seller:\n"
        ViewSeller.new.update()
    when 11
        puts "\nYou selected List of clients:\n"
        ViewClient.new.getList()
    when 12
        puts "\nYou selected Find Client:\n"
        ViewClient.new.getObj()
    when 13
        puts "\nYou selected Insert Client:\n"
        ViewClient.new.add()
    when 14
        puts "\nYou selected Update Client:\n"
        ViewClient.new.update()
    when 16
        puts "\nYou selected List of Sales:\n"
        ViewSale.new.getList()
    when 17
        puts "\nYou selected Find Sale:\n"
        ViewSale.new.getObj()
    when 18
        puts "\nYou selected Insert Sale:\n"
        ViewSale.new.add()
    when 19
        puts "\nYou selected Update Sale:\n"
        ViewSale.new.update()
    else
        puts "\nInvalid Option!"
    end
end

def main()
    begin
        printTitle()
        continuar = true
        while (continuar) do
            printMenu()
            puts "\nEnter the option:"
            opcao = gets.to_i
            if opcao == 0
                continuar = false
                puts "\nFinalized system!\n"
            else
                begin
                    executeView(opcao) 
                rescue StandardError, AnotherError => e
                    puts "Error: #{e.inspect}"
                ensure
            
                end
            end
        end
    rescue
        puts "\nError!"
        puts "\nFinalized system!\n"
    ensure

    end
    
end 

# main()

