class ProductsController < ApplicationController

    include ProductsHelper

	def index

		@products  = Product.all
		@categories = Category.all

	end


	def new

      @product = Product.new

	end

    def create

        @product = Product.new( products_params )

        generate_sku

        if @product.save
            flash.notice = "Product #{@product.name} Created!"
            redirect_to products_path
        else
            flash.notice = errors
            redirect_to new_product_path
        end

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
