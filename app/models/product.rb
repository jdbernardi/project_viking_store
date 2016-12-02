class Product < ApplicationRecord
	belongs_to :category, :foreign_key => 'category_id', dependent: :destroy
	has_many :orders, through: :order_contents
end
