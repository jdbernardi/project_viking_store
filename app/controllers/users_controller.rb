class UsersController < ApplicationController

	include UsersHelper

	def index

		@users = User.all

	end


	def show

		@user = User.find( params[ :id ] )
		@card = credit_card( @user )


	end


end
