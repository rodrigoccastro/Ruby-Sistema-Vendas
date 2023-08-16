# Ruby-System-Sales

Sales System in Ruby to access postgres database.

In this system there are 4 actions (List, search by key, add, change)
for four entities (product, vendors, customer, sale).

========================

Initial setting

1) install this gem by running in terminal: gem install pg

2) install postgres or docker with postgres image

3) run the database scripts are in the folder Model/Script/

4) change the database access user and password properties in the Model/UtilPropertiesConnection.rb file

5) run in terminal: ruby sales.rb