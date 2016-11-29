class OrderContent < ApplicationRecord
	belongs_to :order
	belongs_to :product


	def revenue

		quantity * product.price

	end
end
