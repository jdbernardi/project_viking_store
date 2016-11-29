class StaticPagesController < ApplicationController


	def index

		@total_users = User.all
		@total_orders = Order.all
		@total_products = Product.all

		OrderContent.joins(:product)
		
		#revenue is equal to the sum of all the orders

	end

	def show
	end

	def new
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end


end
