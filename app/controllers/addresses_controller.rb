class AddressesController < ApplicationController

	include AddressesHelper



	def index

		if params[:user]

			@addresses = User.find( params[:user] ).addresses

		else

			@addresses = Address.all

		end


	end

	def show

		user_id = Address.find(params[:id]).user_id

		@user = User.find( user_id )

	end

	def edit

		@user = User.find( params[:id] )

	end


end
