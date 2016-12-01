class Category < ApplicationRecord

	validates :name, length: { in: 4..16 },presence: { message: "must be given please" }

end
