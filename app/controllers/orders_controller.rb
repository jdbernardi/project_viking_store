class OrdersController < ApplicationController


	def index

		if params[:user]

			@orders = Order.where( user_id: params[:user] )
			@user = User.find( params[:user] )

		else

			@orders = Order.all.limit(200)

		end

	end


	def show

		if User.exists?(params[:id])

			redirect_to orders_path( :user => params[:id] )

		elsif Order.exists?(params[:id])

			@order = Order.find( params[:id])


		else

			redirect_to orders_path

		end

	end


end
