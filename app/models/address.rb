class Address < ApplicationRecord
	belongs_to :city
	belongs_to :state

	belongs_to :user

	validates :city, presence: true

	validates :state, presence: true

	validates :zip_code, presence: true

end
