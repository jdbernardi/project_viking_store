class Order < ApplicationRecord
	belongs_to :user
	has_one :order_content
	belongs_to :address, :foreign_key => "shipping_id"
	belongs_to :address, :foreign_key => "billing_id"
	has_many :products
	has_many :categories, :through => :products
end
