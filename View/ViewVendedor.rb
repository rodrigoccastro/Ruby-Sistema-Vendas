require_relative "../Controller/ControllerVendedor.rb"
require_relative "Util.rb"

class ViewVendedor


    def getList()
        objController = ControllerVendedor.new
        objUtil = Util.new
        arr = objController.getList()
        if (arr != objUtil.getHttpStatusNotFound)
            puts "\nLista de Vendedores"
            puts "Total de Vendedores: #{arr.size}"
            puts "------------------------------"
            arr.each do |obj|
                imprimeObj(obj)
            end           
        else
            puts "\nLista de Vendedores vazia!"
        end
    end

    def imprimeObj(obj)               
        puts "Cpf: #{obj.cpf} - Nome: #{obj.nome} - Email: #{obj.email} - Telefone: #{obj.telefone} - Endereço: #{obj.endereco}"
    end

    def getObj()

        objController = ControllerVendedor.new
        objUtil = Util.new
        puts "\nDigite o cpf:"
        id = gets.delete!("\n")
        obj = objController.getObj(id)
        if (obj != objUtil.getHttpStatusNotFound)
            imprimeObj(obj)
        else
            puts "\nVendedor não encontrado!"
        end

    end  

    def add()
        objController = ControllerVendedor.new
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
    
        if (resp == objUtil.getHttpStatusOk)
            puts "\nVendedor salvo corretamente!"
        else
            puts "\nErro ao tentar salvar Vendedor!"
        end
    end

    def update()
        objController = ControllerVendedor.new
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
    
        if (resp == objUtil.getHttpStatusOk)
            puts "\nVendedor alterado corretamente!"
        else
            puts "\nErro ao tentar alterar o Vendedor!"
        end
    end

    def delete()
        objController = ControllerVendedor.new
        objUtil = Util.new
    
        puts "\nDigite o cpf:"
        id = gets.delete!("\n")
        resp = objController.delete(id)
    
        if (resp == objUtil.getHttpStatusOk)
            puts "\nVendedor excluído corretamente!"
        else
            puts "\nErro ao tentar excluir Vendedor!"
        end
    end

end