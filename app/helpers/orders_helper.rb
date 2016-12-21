module OrdersHelper

	def order_params

		params.permit(:id, params[:address][:shipping_id] => :shipping_id, params[:credit_card][:id] => :credit_card_id )

	end

	def is_number?(string)

		true if Float( string ) rescue false

	end

	def check_quantities( quantities )

		quantities.each do | q |

			return false if !is_number?( q )

		end

		return true

	end


	def check_product_ids_and_quantities( ids, qty )



		n = 0
		ids.each do

			# Product.exists?( id )
			if Product.exists?( ids[ n ] ) && is_number?( qty[ n ] )
			# if it exists, is the qty a number?
			# if true then does the order already have product
				if order_have_product_already?( ids[n] )

					o = @order.order_contents.find_by(product_id: ids[n] )
					o.quantity += qty[ n ].to_i
					o.save

				else

					oc = OrderContent.new
					oc.order_id = @order.id
					oc.quantity = qty[ n ].to_i
					oc.product_id = ids[ n ]

					oc.save

				end #order_have_product?

			else

				redirect_to edit_order_path( @order )

			end #product.exists?

			n += 1

		end #ids.each

	end


	def order_have_product_already?( id )

		@order.order_contents.exists?(product_id: [id])

	end


	def check_product_ids( product_ids, quantities )

		n = 0

		product_ids.each do | id |

			if Product.exists?( id ) && is_number?( quantities[ n ] )
			# if the product exists
			# create an order content with the id of the order
				OrderContent.new( :order_id => @order.id, :product_id => id, :quantity => quantities[ n ] )
			# assign that product id as the product_id
			# assign the quantity as the quantity
			# save the order_content
			# redirect to show with message

			# else redirect to edit with errors
			else

				return false

			end

			n += 1

		end


	end


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


