class City < ApplicationRecord
	belongs_to :state

	validates :name, length: { in: 1..64 }, presence: true

end
