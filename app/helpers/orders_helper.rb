module OrdersHelper

	def revenue( order )

		arr = []

		order.order_contents.each do |o|

			arr << o.revenue

		end

		return arr.inject( 0 ) { | r, e | r + e }

	end


	def errors

			flash.notice = "#{@order.errors.full_messages.join}"

	end

end


