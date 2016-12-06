class StaticPagesController < ApplicationController

	include StaticPagesHelper

	def index

		@total_users = User.all
		@total_orders = Order.all
		@total_products = Product.all
		@order_contents = OrderContent.all

		@revenue = get_revenue

    @user_7_days = User.where(:created_at => (Time.now.midnight - 7.days)..Time.now.midnight).count
    @order_7_days = Order.where(:created_at => (Time.now.midnight - 7.days)..Time.now.midnight).count
    @product_7_days = Product.where(:created_at => (Time.now.midnight - 7.days)..Time.now.midnight).count


	end

end
