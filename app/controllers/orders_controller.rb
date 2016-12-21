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


		else

			redirect_to orders_path

		end

	end


	def update_contents

		@order = Order.find( params[ :order_id ] )
		quantities = params[:quantity]

    if	check_quantities( quantities )

    	n = 0

    	@order.order_contents.each do | oc |

    		if quantities[n] == "0"

    			oc.destroy

    		else

	    		oc.quantity = quantities[n]
	    		oc.save

    	  end

    	  n += 1

    	end


    	redirect_to order_path( @order )

    else

    	redirect_to edit_order_path( @order )

    end



	end


	# custom action on edit/new order to add products to order
	def update_products

		@order = Order.find( params[:id] )

		value = check_product_ids_and_quantities( params["product_ids"], params["quantities"] )
binding.pry

		# check params[product_id] to see that there is a valid id
		# if one is bogus, then abort!

	end



	def create

		@order = Order.new(
				:user_id => params[:user_id],
				:shipping_id => params[:address][:shdipping_id],
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
