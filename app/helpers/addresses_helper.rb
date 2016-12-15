module AddressesHelper

	def errors

			flash.notice = "#{@address.errors.full_messages.join}"

	end


end
