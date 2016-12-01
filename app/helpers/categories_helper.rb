module CategoriesHelper

	def categories_params
		params.require( :category ).permit(:name, :description )
	end

	def errors

			flash.notice = "#{@category.errors.full_messages.join}"


	end

end
