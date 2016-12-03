class ProductsController < ApplicationController

	def index

		@products  = Product.all
		@categories = Category.all

	end


	def new

	end


	def show

    @product = Product.find( params[:id] )

    @cart = []
    @ordered = []

    @product.orders.each do | p |
    	if p.checkout_date
    		@ordered << p
    	else
    		@cart	<< :add
    	end
    end


	end

end
