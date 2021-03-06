class User < ApplicationRecord
	has_many :orders
	has_many :addresses
	accepts_nested_attributes_for :addresses

	has_many :credit_cards

	validates :first_name, length: { in: 1..64 }, presence: true

	validates :last_name, length: { in: 1..64 }, presence: true

	validates :email, length: { in: 1..64 }, presence: true

	validates_format_of :email, :with => /@/, :message =>  "must have @ symbol"

end
