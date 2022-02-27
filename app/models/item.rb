class Item < ApplicationRecord
    validates :code, presence: true
    validates :name, presence: true, length: {maximum: 25}
    validates :price, numericality: {greater_than: 0}
end
