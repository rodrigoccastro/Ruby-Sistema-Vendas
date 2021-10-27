require 'pg'
require "ostruct"

conn = PG::Connection.new( "localhost", "5432", nil, nil, "BaseVendas", "postgres", "barnabe" )
#resultset = conn.exec("Call spGetListaClientes()")
resultset = conn.exec("Select * from tb_produtos")
tabela = []
count = -1
resultset.each do |row|
    count = count+1
    obj = OpenStruct.new(row)
    #obj = OpenStruct.new(:id => row["id"], :nome => row["nome"], :valor => row["valor"])
    #obj = OpenStruct.new
    #column_names.each do |campo|
    #    obj.campo = row[campo]
    #end
    arrValues = obj.each_pair.to_a.transpose[1]
    puts arrValues

    tabela[count] = obj
end           
