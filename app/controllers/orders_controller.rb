class OrdersController < ApplicationController

	include OrdersHelper

	def index

		if params[:user]

			@orders = Order.where( user_id: params[:user] )
			@user = User.find( params[:user] )

		else

			@orders = Order.all.limit(200)

		end

	end


	def new

		@user = User.find( params[:id] )
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


	def create

		@order = Order.new(
				:user_id => params[:user_id],
				:shipping_id => params[:address][:shipping_id],
				:billing_id => params[:address][:billing_id],
				:credit_card_id => params[:credit_card][:id]
		 )
		@order.save
		redirect_to edit_order_path( @order )
		# Order(id: integer, checkout_date: datetime, user_id: integer, shipping_id: integer, billing_id: integer, created_at: datetime, updated_at: datetime, credit_card_id: integer)
		# Parameters {
		#	"user_id"=>"519", "utf8"=>
		#	"address"=>{"shipping_id"=>"1346", "billing_id"=>"1345"}
		#	"credit_card"=>{"id"=>"410"}


	end

	def edit

		@order = Order.find( params[:id] )
		@user = User.find(@order.user_id)

	end

end
