require_relative "ViewCliente.rb"
require_relative "ViewProduto.rb"
require_relative "ViewVendedor.rb"
require_relative "ViewVenda.rb"

def printTitle()
    puts "                                                                    "
    puts "********************************************************************"
    puts "                  SISTEMA DE VENDAS EM RUBY                         "
    puts "********************************************************************"
end

def printMenu()
    puts "                                                                    "
    puts "                            MENU PRINCIPAL                          "
    puts "Produto:   1 - Listagem |   2 - Pesquisar |   3 - Adicionar |   4 - Alterar |   5 - Excluir"
    puts "Vendedor:  6 - Listagem |   7 - Pesquisar |   8 - Adicionar |   9 - Alterar |  10 - Excluir"
    puts "Cliente:  11 - Listagem |  12 - Pesquisar |  13 - Adicionar |  14 - Alterar |  15 - Excluir"
    puts "Vendas:   16 - Listagem |  17 - Pesquisar |  18 - Adicionar |  19 - Alterar |  20 - Excluir  |  0 - Sair"
    puts "---------------------------------------------------------------------------------------------------------"
end

def executeView(opcao) 

    case opcao
    when 1
        puts "\nVocê escolheu Listagens de Produtos:\n"
        ViewProduto.new.getList()
    when 2
        puts "\nVocê escolheu Pesquisar Produto:\n"
        ViewProduto.new.getObj()
    when 3
        puts "\nVocê escolheu Adicionar Produto:\n"
        ViewProduto.new.add()
    when 4
        puts "\nVocê escolheu Alterar Produto:\n"
        ViewProduto.new.update()
    when 5
        puts "\nVocê escolheu Excluir Produto:\n"
        ViewProduto.new.delete()
    when 6
        puts "\nVocê escolheu Listagens de Vendedor:\n"
        ViewVendedor.new.getList()
    when 7
        puts "\nVocê escolheu Pesquisar Vendedor:\n"
        ViewVendedor.new.getObj()
    when 8
        puts "\nVocê escolheu Adicionar Vendedor:\n"
        ViewVendedor.new.add()
    when 9
        puts "\nVocê escolheu Alterar Vendedor:\n"
        ViewVendedor.new.update()
    when 10
        puts "\nVocê escolheu Excluir Vendedor:\n"
        ViewVendedor.new.delete()
    when 11
        puts "\nVocê escolheu Listagens de Clientes:\n"
        ViewCliente.new.getList()
    when 12
        puts "\nVocê escolheu Pesquisar Clientes:\n"
        ViewCliente.new.getObj()
    when 13
        puts "\nVocê escolheu Adicionar Clientes:\n"
        ViewCliente.new.add()
    when 14
        puts "\nVocê escolheu Alterar Clientes:\n"
        ViewCliente.new.update()
    when 15
        puts "\nVocê escolheu Excluir Clientes:\n"
        ViewCliente.new.delete()
    when 16
        puts "\nVocê escolheu Listagens de Vendas:\n"
        ViewVenda.new.getList()
    when 17
        puts "\nVocê escolheu Pesquisar Produto:\n"
        ViewVenda.new.getObj()
    when 18
        puts "\nVocê escolheu Adicionar Produto:\n"
        ViewVenda.new.add()
    when 19
        puts "\nVocê escolheu Alterar Produto:\n"
        ViewVenda.new.update()
    when 20
        puts "\nVocê escolheu Excluir Produto:\n"
        ViewVenda.new.delete()
    else
        puts "\nOpção inválida!"
    end
end

def main()
    begin
        printTitle()
        continuar = true
        while (continuar) do
            printMenu()
            puts "\nDigite a opção que deseja:"
            opcao = gets.to_i
            if opcao == 0
                continuar = false
                puts "\nSistema finalizado!\n"
            else
                begin
                    executeView(opcao) 
                rescue
                    puts "\nOcorreu um erro!"
                ensure
            
                end
            end
        end
    rescue
        puts "\nOcorreu um erro!"
        puts "\nSistema finalizado!\n"
    ensure

    end
    
end 

# main()

