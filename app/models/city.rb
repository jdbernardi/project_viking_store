class City < ApplicationRecord
	belongs_to :state

	validates :city, length: { in: 1..64 }, presence: true

end
