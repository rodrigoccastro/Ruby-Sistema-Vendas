require 'active_record'
require_relative "./view/Home.rb"

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'postgres',
  password: 'postgres',
  database: 'DatabaseSalesActiveRecord'
)

main()

