class Item < ApplicationRecord
    validates :code, presence: true, allow_blank: false
    validates :name, presence: true, length: {maximum: 25}, allow_blank: false
    validates :price, numericality: {greater_than: 0}
end
