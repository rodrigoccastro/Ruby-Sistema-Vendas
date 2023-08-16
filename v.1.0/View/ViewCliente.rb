require_relative "../Controller/ControllerCliente.rb"
require_relative "Util.rb"

class ViewCliente

    def getList()
        objController = ControllerCliente.new
        arr = objController.getList()
        if (!arr.nil?)
            puts "\nLista de Clientes"
            puts "Total de Clientes: #{arr.size}"
            puts "------------------------------"
            arr.each do |obj|
                imprimeObj(obj)
            end           
        else
            puts "\nLista de Clientes vazia!"
        end
    end

    def imprimeObj(obj)               
        puts "Cpf: #{obj.cpf} - Nome: #{obj.nome} - Email: #{obj.email} - Telefone: #{obj.telefone} - Endereço: #{obj.endereco}"
    end

    def getObj()
        objController = ControllerCliente.new
        objUtil = Util.new
        puts "\nDigite o cpf:"
        id = gets.delete!("\n")
        obj = objController.getObj(id)
        if (!obj.nil?)
            imprimeObj(obj)
        else
            puts "\nCliente não encontrado!"
        end
    end  

    def add()
        objController = ControllerCliente.new
        objUtil = Util.new
    
        puts "\nDigite o cpf:"
        cpf = gets.delete!("\n")
        puts "\nDigite o nome:"
        nome = gets.delete!("\n")
        puts "\nDigite o email:"
        email = gets.delete!("\n")
        puts "\nDigite o telefone:"
        telefone = gets.delete!("\n")
        puts "\nDigite o endereco:"
        endereco = gets.delete!("\n")
    
        obj = OpenStruct.new(:cpf => cpf, :nome => nome, :email => email, :telefone => telefone, :endereco => endereco)
        resp = objController.add(obj)
    
        if (!resp.nil?)
            puts "\nCliente salvo corretamente!"
        else
            puts "\nErro ao tentar salvar Cliente!"
        end
    end

    def update()
        objController = ControllerCliente.new
        objUtil = Util.new
    
        puts "\nDigite o cpf:"
        cpf = gets.delete!("\n")
        puts "\nDigite o nome:"
        nome = gets.delete!("\n")
        puts "\nDigite o email:"
        email = gets.delete!("\n")
        puts "\nDigite o telefone:"
        telefone = gets.delete!("\n")
        puts "\nDigite o endereco:"
        endereco = gets.delete!("\n")
    
        obj = OpenStruct.new(:cpf => cpf, :nome => nome, :email => email, :telefone => telefone, :endereco => endereco)
        resp = objController.update(obj)
    
        if (!resp.nil?)
            puts "\nCliente alterado corretamente!"
        else
            puts "\nErro ao tentar alterar o Cliente!"
        end
    end

    def delete()
        objController = ControllerCliente.new
        objUtil = Util.new
    
        puts "\nDigite o cpf:"
        id = gets.delete!("\n")
        resp = objController.delete(id)
    
        if (!resp.nil?)
            puts "\nCliente excluído corretamente!"
        else
            puts "\nErro ao tentar excluir Cliente!"
        end
    end


end