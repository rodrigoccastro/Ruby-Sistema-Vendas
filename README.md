# Ruby-Sistema-Vendas

Sistema de Vendas em Ruby para acessar banco postgres.

Neste sistema existem 5 ações (Listagem, pesquisa por chave, adicionar, alterar e excluir) 
para quatro entidades (produto, vendedores, cliente, venda).

O acesso ao banco é gerenciado por um pool de conexões garantindo reutilização de conexões.

========================

Configuração inicial

1) instalar esta gem executando no terminal: gem install pg

2) instalar postgres ou docker com imagem do postgres

3) executar os scripts do banco estão na pasta Model/Script/

4) alterar as propriedades de acesso ao banco no arquivo Model/UtilPropertiesConnection.rb

5) executar no terminal: ruby vendas.rb
