class Seller < ApplicationRecord
    validates :id, presence: true
    validates :name, presence: true
    has_many :sales
end
