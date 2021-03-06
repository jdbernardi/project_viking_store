class Address < ApplicationRecord
	belongs_to :city
	belongs_to :state
	has_many :orders

	belongs_to :user

	validates :street_address, length: { in: 1..64 }, presence: true

	validates :zip_code, presence: true

end
