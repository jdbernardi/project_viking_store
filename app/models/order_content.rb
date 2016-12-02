class OrderContent < ApplicationRecord
	belongs_to :order
	has_many :products


	def revenue

		quantity * product.price

	end
end
