class Order < ApplicationRecord
	belongs_to :user, :foreign_key => "user_id"
	belongs_to :address, :foreign_key => "shipping_id"
	belongs_to :address, :foreign_key => "billing_id"
end
