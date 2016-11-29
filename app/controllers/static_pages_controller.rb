class StaticPagesController < ApplicationController


	def index

		@total_users = User.all
		@total_orders = Order.all
		@total_products = Product.all
		@order_contents = OrderContent.all

		array = []

		@order_contents.each{ |x| array << x.revenue }

    @revenue = array.inject(0) { |r,e| r+e }

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
