class ProductsController < ApplicationController

	def index

		@products  = Product.all
		@categories = Category.all
	end

	def show

    @product = Product.find( params[:id] )

    product_ords = @product.orders

    @cart = []
    @ordered = []

    product_ords.each do | p |

    	if p.checkout_date

    		@ordered << p

    	else

    		@cart	<< "add"

    	end

    end


	end

end
