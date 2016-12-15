class OrdersController < ApplicationController


	def index

		@orders = Order.all.limit(40)

	end


end
