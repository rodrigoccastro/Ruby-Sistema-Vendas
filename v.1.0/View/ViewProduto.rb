require_relative "../Controller/ControllerProduto.rb"
require_relative "Util.rb"
require "ostruct"

class ViewProduto

    def getList()
        objController = ControllerProduto.new
        objUtil = Util.new
        arr = objController.getList()
        if (!arr.nil?)
            puts "\nLista de Produtos"
            puts "Total de Produtos: #{arr.size}"
            puts "------------------------------"
            arr.each do |obj|
                imprimeObj(obj)
            end           
        else
            puts "\nLista de Produtos vazia!"
        end
        
    end
    
    def imprimeObj(obj)               
        puts "Id: #{obj.id} - Nome: #{obj.nome} - Valor: #{obj.valor}"
    end

    def getObj()
        objController = ControllerProduto.new
        objUtil = Util.new
        puts "\nDigite o id:"
        id = gets.delete!("\n")
        obj = objController.getObj(id)
        if (!obj.nil?)
            imprimeObj(obj)
        else
            puts "\nProduto não encontrado!"
        end

    end

    def add()
        objController = ControllerProduto.new
        objUtil = Util.new
    
        puts "\nDigite o Id:"
        id = gets.delete!("\n")
        puts "\nDigite o nome:"
        nome = gets.delete!("\n")
        puts "\nDigite o Valor:"
        valor = gets.delete!("\n")
    
        obj = OpenStruct.new(:id => id, :nome => nome, :valor => valor)
        resp = objController.add(obj)
    
        if (!resp.nil?)
            puts "\nProduto salvo corretamente!"
        else
            puts "\nErro ao tentar salvar Produto!"
        end
    end

    def update()
        objController = ControllerProduto.new
        objUtil = Util.new
    
        puts "\nDigite o Id:"
        id = gets.delete!("\n")
        puts "\nDigite o nome:"
        nome = gets.delete!("\n")
        puts "\nDigite o Valor:"
        valor = gets.delete!("\n")
    
        obj = OpenStruct.new(:id => id, :nome => nome, :valor => valor)
        resp = objController.update(obj)
    
        if (!resp.nil?)
            puts "\nProduto alterado corretamente!"
        else
            puts "\nErro ao tentar alterar o Produto!"
        end
    end


    def delete()
        objController = ControllerProduto.new
        objUtil = Util.new
    
        puts "\nDigite o Id:"
        id = gets.delete!("\n")
        resp = objController.delete(id)
    
        if (!resp.nil?)
            puts "\nProduto excluído corretamente!"
        else
            puts "\nErro ao tentar excluir Produto!"
        end
    end



end