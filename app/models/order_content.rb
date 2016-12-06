class OrderContent < ApplicationRecord
	belongs_to :order
	has_many :products
	belongs_to :product


  def revenue


		quantity * product.price

	end


end
