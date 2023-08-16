require_relative "../Controller/ControllerSale.rb"
require_relative "../Controller/ControllerClient.rb"
require_relative "../Controller/ControllerSeller.rb"
require_relative "../Controller/ControllerProduct.rb"
require_relative "Util.rb"

class ViewSale

    def getList()
        objController = ControllerSale.new
        objUtil = Util.new
        arr = objController.getList()
        if (!arr.nil?)
            puts "\nList of Sales de Sales"
            puts "Number of Sales: #{arr.size}"
            puts "------------------------------"
            arr.each do |obj|
                id_Sale = obj.id
                printObj(obj)
                arrProducts = objController.getListProducts(id_Sale)
                puts "\tList of Products"
                arrProducts.each do |objSaleProduct|
                    printObjSaleProduct(objSaleProduct)
                end
            end           
        else
            puts "\nList of sales is empty!"
        end
    end

    def printObj(obj)               
        puts "\nId Sale: #{obj.id} - datetime: #{obj.datetime}"
        objControllerClient = ControllerClient.new
        objClient = objControllerClient.getObj(obj.id_client)
        puts "\tClient Info"
        puts "\t\tId: #{objClient.id} - Name: #{objClient.name} - Email: #{objClient.email}"
        puts "\t\tPhone: #{objClient.phone} - Address: #{objClient.address}"
        objControllerSeller = ControllerSeller.new
        objSeller = objControllerSeller.getObj(obj.id_seller)
        puts "\tSeller Info"
        puts "\t\tId: #{objSeller.id} - Name: #{objSeller.name} - Email: #{objSeller.email}"
        puts "\t\tPhone: #{objSeller.phone} - Address: #{objSeller.address}"
    end

    def printObjSaleProduct(objSaleProduct)
        objControllerProduct = ControllerProduct.new
        objProduct = objControllerProduct.getObj(objSaleProduct.id_product)
        puts "\t\tId: #{objSaleProduct.id_product} - name: #{objProduct.name} - price: #{objSaleProduct.price} - quantity: #{objSaleProduct.quantity}"
    end

    def getObj()

        objController = ControllerSale.new
        objUtil = Util.new
        puts "\nEnter id:"
        id = gets.delete!("\n")
        obj = objController.getObj(id)
        if (!obj.nil?)
            id_sale = obj.id
            printObj(obj)
            arrProducts = objController.getListProducts(id_sale)
            puts "\tList of Products"
            arrProducts.each do |objSaleProduct|
                printObjSaleProduct(objSaleProduct)
            end
        else
            puts "\nSale NOT found!"
        end

    end  

    def add()
        objController = ControllerSale.new
        objUtil = Util.new
    
        puts "\nEnter Client Id:"
        id_client = gets.delete!("\n")
        puts "\nEnter Seller Id:"
        id_seller = gets.delete!("\n")
        puts "\nEnter number of products in this sale:"
        qtd = gets.delete!("\n").to_i
        count = 0;
        products = [];
        while count < qtd 
            contador = count+1
            puts "\nEnter Product Id of number (#{contador}):"
            id_product = gets.delete!("\n")
            puts "\nEnter how many products of number (#{contador}):"
            quantity = gets.delete!("\n")
            product = OpenStruct.new(:id_product => id_product, :quantity => quantity)
            products[count] = product;
            count = count+1
        end
    
        obj = OpenStruct.new(:id_client => id_client, :id_seller => id_seller, :products => products)
        resp = objController.add(obj)
    
        if (!resp.nil?)
            puts "\nSale saved!"
        else
            puts "\nError: Sale NOT saved!"
        end
    end

    def update()
        objController = ControllerSale.new
        objUtil = Util.new
    
        puts "\nEnter Sale Id:"
        id = gets.delete!("\n")

        puts "\nEnter Client Id:"
        id_client = gets.delete!("\n")
        puts "\nEnter Seller Id:"
        id_seller = gets.delete!("\n")
        puts "\nEnter number of products in this sale:"
        qtd = gets.delete!("\n").to_i
        count = 0;
        products = [];
        while count < qtd 
            contador = count+1
            puts "\nEnter Product Id of number (#{contador}):"
            id_product = gets.delete!("\n")
            puts "\nEnter how many products of number (#{contador}):"
            quantity = gets.delete!("\n")
            product = OpenStruct.new(:id_product => id_product, :quantity => quantity)
            products[count] = product;
            count = count+1
        end
    
        obj = OpenStruct.new(:id => id, :id_client => id_client, :id_seller => id_seller, :products => products)
        resp = objController.update(obj)
    
        if (!resp.nil?)
            puts "\nSale saved!"
        else
            puts "\nError: Sale NOT saved!"
        end

    end

    # def delete()
    #     objController = ControllerSale.new
    #     objUtil = Util.new
    
    #     puts "\nEnter Id:"
    #     id = gets.delete!("\n")
    #     resp = objController.delete(id)
    
    #     if (!resp.nil?)
    #         puts "\nSale deleted!"
    #     else
    #         puts "\nError: Sale NOT deleted!"
    #     end
    # end

end