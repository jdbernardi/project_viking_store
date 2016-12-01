class Category < ApplicationRecord

	validates :name, length: { in: 4..16 },presence: true

end
