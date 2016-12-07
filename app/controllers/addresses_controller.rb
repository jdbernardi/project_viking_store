class AddressesController < ApplicationController

	include AddressesHelper

	def index


			@addresses = Address.all




	end

	def show


		@user = User.find( params[:id])

	end


end
