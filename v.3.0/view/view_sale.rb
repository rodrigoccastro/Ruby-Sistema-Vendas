require_relative "../controller/controller_sale.rb"
require_relative "../controller/controller_client.rb"
require_relative "../controller/controller_seller.rb"
require_relative "../controller/controller_product.rb"
require_relative "util.rb"
require_relative "view.rb"

class ViewSale < View

    def initialize()
        super(ControllerSale.new, 'Sale')
    end

    def getData()
        puts "\nEnter Client Id:"
        client_id = gets.delete!("\n")
        client = Client.find(client_id)
        if client.nil?
            puts "\nClient NOT found!"
            return nil 
        else
            puts client.name
        end

        puts "\nEnter Seller Id:"
        seller_id = gets.delete!("\n")
        seller = Seller.find(seller_id)
        if seller.nil?
            puts "\nSeller NOT found!"
            return nil 
        else
            puts seller.name
        end

        puts "\nEnter number of products in this sale:"
        qtd = gets.delete!("\n").to_i
        if qtd<=0
            puts "\nInvalid quantity!"
            return nil 
        end

        count = 0;
        productsales = [];
        while count < qtd 
            contador = count+1

            puts "\nEnter Product Id of number (#{contador}):"
            product_id = gets.delete!("\n")
            product = Product.find(product_id)
            if product.nil?
                    puts "\nProduct NOT found!"
                return nil 
            else
                puts product.name
            end

            puts "\nEnter how many products of number (#{contador}):"
            quantity = gets.delete!("\n").to_i
            if quantity<=0
                puts "\nInvalid quantity!"
                return nil 
            end

            productsale = {:product_id => product_id, :quantity => quantity}
            productsales[count] = productsale;
            count = count+1
        end
        return {:client_id => client_id, :seller_id => seller_id, :productsales => productsales}
    end

    def printObj(obj)               
        puts "\nId Sale: #{obj.id} - created: #{obj.created} - updated: #{obj.updated}"

        objClient = obj.client
        puts "\tClient Info"
        puts "\t\tId: #{objClient.id} - Name: #{objClient.name} - Email: #{objClient.email}"
        puts "\t\tPhone: #{objClient.phone} - Address: #{objClient.address}"
        puts "\t\tCreated: #{objClient.created} - Updated: #{objClient.updated}"

        objSeller = obj.seller
        puts "\tSeller Info"
        puts "\t\tId: #{objSeller.id} - Name: #{objSeller.name} - Email: #{objSeller.email}"
        puts "\t\tPhone: #{objSeller.phone} - Address: #{objSeller.address}"
        puts "\t\tCreated: #{objSeller.created} - Updated: #{objSeller.updated}"

        total = 0
        puts "\tList of Products"
        obj.productsales.each do |productsale|
            partial = (productsale.price * productsale.quantity)
            puts "\t\tId: #{productsale.product_id} - name: #{productsale.product.name} - price: $ #{productsale.price} - quantity: #{productsale.quantity} --> partial: #{partial}"
            total = total + partial
        end

        puts "\tTotal: $ #{total}"
    end

    def update()
        puts "\nEnter id:"
        id = gets.delete!("\n")
        sale = Sale.find(id)
        if sale.nil?
            puts "\nSale NOT found!"
            return nil 
        end

        obj = getData()
        obj[:id] = id

        resp = @controller.update(obj)
        if (resp[:success])
            puts "\n#{@nameItem} updated!"
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

end
