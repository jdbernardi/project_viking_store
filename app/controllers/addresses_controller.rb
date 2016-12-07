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


		@user = User.find( params[:id])

	end


end
