module OrdersHelper

	def revenue( order )
		arr = []
		order.order_contents.each do |o|
			arr << o.revenue
		end
		return arr.inject( 0 ) { | r, e | r + e }
	end

	def num_products( order_contents )
		arr = []
		order_contents.each do | n |
			arr << n.quantity
		end
		return arr.inject( 0 ) { |r, e| r + e }
	end


	def get_street_address( id )

		id.nil? ? "N/A" : Address.find( id ).street_address

	end


	def get_city( id )

		id.nil? ? "N/A" : Address.find( id ).city.name

	end


	def get_state( id )

		id.nil? ? "N/A" : to_state_abbrev( Address.find( id ).state.name )

	end


	def get_credit_card( id )

		id.nil? ? "N/A" : CreditCard.find( id ).card_number

	end

	def last_four_digits( number )

		return number.split(//).last(4).join

	end

	def errors

			flash.notice = "#{@order.errors.full_messages.join}"

	end

end


