module ProductsHelper

	def products_params

		params[:product][:price] = remove_dollar_sign( params[:product][:price] )

		params.require( :product ).permit(:name, :description, :sku, :price, :category_id )

	end

	def generate_sku

		@product[:sku] = Faker::Code.ean

	end

	def remove_dollar_sign( val )

		val.delete( "$" )

	end

	def errors

			flash.notice = "#{@product.errors.full_messages.join}"

	end


end
