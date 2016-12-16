class OrdersController < ApplicationController


	def index

		if params[:user]

			@orders = Order.where( user_id: params[:user] )
			@user = User.find( params[:user] )

		else

			@orders = Order.all.limit(200)

		end

	end


	def new

		@user = User.find( params[:format] )
		@order = Order.new

	end




	def show

		if User.exists?(params[:id])

			redirect_to orders_path( :user => params[:id] )

		elsif Order.exists?(params[:id])

			@order = Order.find( params[:id])
			@order_contents = @order.order_contents

		else

			redirect_to orders_path

		end

	end


end
