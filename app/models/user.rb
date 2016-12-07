class User < ApplicationRecord
	has_many :orders
	has_many :addresses
	has_many :credit_cards

	validates :first_name, length: { in: 1..64 }, presence: true

	validates :last_name, length: { in: 1..64 }, presence: true

	validates :email, length: { in: 1..64 }, presence: true

end
