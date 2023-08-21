require_relative 'service.rb'
require_relative "../model/sale.rb"
require_relative "../model/productsale.rb"
require_relative "../model/client.rb"
require_relative "../model/seller.rb"

class ServiceSale < Service

    def initialize()
        super(Sale)
    end

    def list()
        return Sale.order('updated DESC');
    end

    def find(id)
        return Sale.find(id)
    end

    
    def insert(params)
        ret = false
        sale = getObjSale(params)
        begin
            Sale.transaction do
                productsales = getProductSales(params.productsales) 
                if sale.save
                    productsales.each do |item|
                        item.sale_id = sale[:id]
                        item.save
                    end
                    ret = true
                end 
            end
        rescue StandardError, AnotherError => e
            raise ActiveRecord::Rollback, e.inspect
        end
        return ret==true ? get_json_success(sale) : get_json_error(sale)
    end

    def getObjSale(params)
        sale = Sale.new
        sale.client_id = params.client_id
        sale.seller_id = params.seller_id
        return sale
    end

    def getProductSales(productsales)
        arrProductSales = []
        productsales.each do |item|
            newItem = Productsale.new
            newItem.product_id = item.product_id
            newItem.price = Product.find(item.product_id).price
            newItem.quantity = item.quantity
            arrProductSales << newItem
        end
        return arrProductSales
    end

    def update(params)
        ret = false
        sale = Sale.find(params.id)
        begin
            return get_json_error_msg('Not found object by id.') if sale.nil?

            Sale.transaction do
                newsale = Hash.new
                newsale[:id] = params.id
                newsale[:client_id] = params.client_id
                newsale[:seller_id] = params.seller_id
                newsale[:created] = sale[:created]
                newsale[:updated] = Time.now

                if sale.update(newsale)
                    Productsale.where(:sale_id => params.id).delete_all
                    productsales = getProductSales(params.productsales) 
                    productsales.each do |item|
                        item.sale_id = params.id
                        item.save
                    end
                    ret = true
                end 
            end

        rescue StandardError, AnotherError => e
            raise ActiveRecord::Rollback, e.inspect
        end
        return ret==true ? get_json_success(sale) : get_json_error(sale)
    end

end