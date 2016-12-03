module ProductsHelper

	def products_params
		params.require( :product ).permit(:name, :description, :sku, :price, :category_id )
	end

	def generate_sku

		@product[:sku] = Faker::Code.ean

	end

	def remove_dollar_sign


		@product[:price].to_s.delete( "$" ).to_i

	end

	def errors

			flash.notice = "#{@product.errors.full_messages.join}"

	end


end
