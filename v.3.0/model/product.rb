class Product < ApplicationRecord
    validates :name,  presence: true
    validates :price,  presence: true
    has_many :productsales
end
