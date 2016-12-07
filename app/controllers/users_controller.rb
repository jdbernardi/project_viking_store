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


	def edit

		@user = User.find( params[ :id ] )

	end

end
