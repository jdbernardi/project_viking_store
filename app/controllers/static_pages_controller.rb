class StaticPagesController < ApplicationController


	def index

		total_users = User.count
		total_orders = Order.count

	end



end
