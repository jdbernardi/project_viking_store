class CategoriesController < ApplicationController

	include CategoriesHelper

	def index

		@categories = Category.all

	end

	def new

		@category = Category.new

	end

	def create

		@category = Category.new( categories_params)

		if @category.save
			flash.notice = "Category #{@category.name} Created!"
			redirect_to admin_categories_path
		else
			flash.notice = errors
			redirect_to new_admin_category_path
		end

	end

	def show

	end

end
