module OrdersHelper

	def revenue( order )

		arr = []

		order.order_contents.each do |o|

			arr << o.revenue

		end

		return arr.inject( 0 ) { | r, e | r + e }

	end

end


