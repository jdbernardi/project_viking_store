module AddressesHelper


	def address_params

		params.require(:user).permit(:street_address)


	end


end
