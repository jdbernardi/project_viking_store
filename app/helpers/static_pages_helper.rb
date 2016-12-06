module StaticPagesHelper


	def get_revenue

		arr = []

		@order_contents.each do | o |

			arr << ( o.quantity * o.product.price )

		end

		return arr.inject( 0 ) { | r, e | r + e }

	end


end
