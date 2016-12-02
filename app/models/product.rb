class Product < ApplicationRecord
	belongs_to :category, :foreign_key => 'category_id', dependent: :destroy
	has_many :orders
end
