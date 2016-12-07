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

	def credit_card( user )

		if user.credit_cards.first

			return user.credit_cards.first

		else

  		return nil

  	end

	end

	def order_total( order )

		arr = []

		order.order_contents.each { |d| arr << ( d.quantity * d.product.price ) }

		return arr.inject(0) { |r,e| r+e }

	end


end


