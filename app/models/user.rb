class User < ApplicationRecord
	has_many :orders
	has_many :addresses
	has_many :credit_cards
end
