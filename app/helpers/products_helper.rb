module ProductsHelper

	def products_params
		params.require( :product ).permit(:name, :description, :sku )
	end

	def errors

			flash.notice = "#{@product.errors.full_messages.join}"


	end


end
