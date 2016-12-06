module UsersHelper

	def get_last_checkout( user )

		# starting with last order go through each entry
		user.orders.reverse.each do | u |

			# if there is a checkout date an order was placed
			if u.checkout_date
				# that date will be returned and function exited
				return u.checkout_date

			end

		end

		# if all orders iterated w/no checkout, return n/a
		return "N/A"

	end

	def credit_card_verify( user, action )

		if user.credit_cards.first

			return user.credit_cards."#{action}"

		end

		return 'No card on file'

	end

end


