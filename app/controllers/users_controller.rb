class UsersController < ApplicationController

	include UsersHelper

	def index

		@users = User.all


	end


	def new

		@user = User.new

	end


	def show

		@user = User.find( params[ :id ] )
		@card = credit_card( @user )


	end


	def create

		@user = User.new( user_params )

		if @user.save
			flash.notice = "User #{@user.first_name} added!"
			redirect_to users_path
		else
			flash.notice = errors
			redirect_to new_user_path
		end

	end



	def edit

		@user = User.find( params[ :id ] )

	end

end
