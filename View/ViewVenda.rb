require_relative "../Controller/ControllerVenda.rb"
require_relative "../Controller/ControllerCliente.rb"
require_relative "../Controller/ControllerVendedor.rb"
require_relative "../Controller/ControllerProduto.rb"
require_relative "Util.rb"

class ViewVenda

    def getList()
        objController = ControllerVenda.new
        objUtil = Util.new
        arr = objController.getList()
        if (!arr.nil?)
            puts "\nLista de Vendas"
            puts "Total de Vendas: #{arr.size}"
            puts "------------------------------"
            arr.each do |obj|
                id_venda = obj.id
                imprimeObj(obj)
                arrProdutos = objController.getListProdutos(id_venda)
                puts "\tLita de Produtos"
                arrProdutos.each do |objVendaProduto|
                    imprimeObjVendaProduto(objVendaProduto)
                end
            end           
        else
            puts "\nLista de Vendas vazia!"
        end
    end

    def imprimeObj(obj)               
        puts "\nId da Venda: #{obj.id} - datahora: #{obj.datahora}"
        objControllerCliente = ControllerCliente.new
        objCliente = objControllerCliente.getObj(obj.cpf_cliente)
        puts "\tDados do Cliente"
        puts "\t\tCpf: #{objCliente.cpf} - Nome: #{objCliente.nome} - Email: #{objCliente.email}"
        puts "\t\tTelefone: #{objCliente.telefone} - Endereço: #{objCliente.endereco}"
        objControllerVendedor = ControllerVendedor.new
        objVendedor = objControllerVendedor.getObj(obj.cpf_vendedor)
        puts "\tDados do Vendedor"
        puts "\t\tCpf: #{objVendedor.cpf} - Nome: #{objVendedor.nome} - Email: #{objVendedor.email}"
        puts "\t\tTelefone: #{objVendedor.telefone} - Endereço: #{objVendedor.endereco}"
    end

    def imprimeObjVendaProduto(objVendaProduto)
        objControllerProduto = ControllerProduto.new
        objProduto = objControllerProduto.getObj(objVendaProduto.id_produto)
        puts "\t\tId: #{objVendaProduto.id_produto} - Nome: #{objProduto.nome} - Valor: #{objVendaProduto.valor} - Qtd: #{objVendaProduto.qtd}"
    end

    def getObj()

        objController = ControllerVenda.new
        objUtil = Util.new
        puts "\nDigite o id:"
        id = gets.delete!("\n")
        obj = objController.getObj(id)
        if (!obj.nil?)
            id_venda = obj.id
            imprimeObj(obj)
            arrProdutos = objController.getListProdutos(id_venda)
            puts "\tLita de Produtos"
            arrProdutos.each do |objVendaProduto|
                imprimeObjVendaProduto(objVendaProduto)
            end
        else
            puts "\nVenda não encontrada!"
        end

    end  

    def add()
        objController = ControllerVenda.new
        objUtil = Util.new
    
        puts "\nDigite o Cpf do Cliente:"
        cpf_cliente = gets.delete!("\n")
        puts "\nDigite o Cpf do vendedor:"
        cpf_vendedor = gets.delete!("\n")
        puts "\nDigite quantos produtos vai vender:"
        qtd = gets.delete!("\n").to_i
        count = 0;
        produtos = [];
        while count < qtd 
            contador = count+1
            puts "\nDigite o id do Produto (#{contador}):"
            id_produto = gets.delete!("\n")
            puts "\nDigite a qtd do Produto (#{contador}):"
            produtos_qtd = gets.delete!("\n")
            produto = OpenStruct.new(:id_produto => id_produto, :qtd => produtos_qtd)
            produtos[count] = produto;
            count = count+1
        end
    
        obj = OpenStruct.new(:cpf_cliente => cpf_cliente, :cpf_vendedor => cpf_vendedor, :produtos => produtos)
        resp = objController.add(obj)
    
        if (!resp.nil?)
            puts "\nVenda salva corretamente!"
        else
            puts "\nErro ao tentar salvar Venda!"
        end
    end

    def update()
        objController = ControllerVenda.new
        objUtil = Util.new
    
        puts "\nDigite o Id da venda:"
        id = gets.delete!("\n")

        puts "\nDigite o Cpf do Cliente:"
        cpf_cliente = gets.delete!("\n")
        puts "\nDigite o Cpf do vendedor:"
        cpf_vendedor = gets.delete!("\n")
        puts "\nDigite quantos produtos vai vender:"
        qtd = gets.delete!("\n").to_i
        count = 0;
        produtos = [];
        while count < qtd 
            contador = count+1
            puts "\nDigite o id do Produto (#{contador}):"
            id_produto = gets.delete!("\n")
            puts "\nDigite a qtd do Produto (#{contador}):"
            produtos_qtd = gets.delete!("\n")
            produto = OpenStruct.new(:id_produto => id_produto, :qtd => produtos_qtd)
            produtos[count] = produto;
            count = count+1
        end
    
        obj = OpenStruct.new(:id => id, :cpf_cliente => cpf_cliente, :cpf_vendedor => cpf_vendedor, :produtos => produtos)
        resp = objController.update(obj)
    
        if (!resp.nil?)
            puts "\nVenda alterada corretamente!"
        else
            puts "\nErro ao tentar alterar Venda!"
        end

    end

    def delete()
        objController = ControllerVenda.new
        objUtil = Util.new
    
        puts "\nDigite o Id:"
        id = gets.delete!("\n")
        resp = objController.delete(id)
    
        if (!resp.nil?)
            puts "\nVenda excluída corretamente!"
        else
            puts "\nErro ao tentar excluir Venda!"
        end
    end

end