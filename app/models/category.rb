class Category < ApplicationRecord

	validates :name, length: { in: 4..16 },presence: true

	has_many :products

end
