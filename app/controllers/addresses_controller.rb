class AddressesController < ApplicationController

	include AddressesHelper

	def index

		@addresses = Address.all


	end


end
