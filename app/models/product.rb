class Product < ApplicationRecord
    belongs_to :car_items, dependent: :destroy, optional: true
end
