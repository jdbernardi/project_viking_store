class CreditCard < ApplicationRecord

	belongs_to :user, dependent: :destroy


	def last_four

		"Ending in #{last_four_digits(card_number)}"

	end

	def last_four_digits( number )

		return number.split(//).last(4).join

	end

end
