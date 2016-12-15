class Order < ApplicationRecord
	belongs_to :user
	belongs_to :address, :foreign_key => "shipping_id"
	belongs_to :address, :foreign_key => "billing_id"

	has_many :categories, :through => :products



	has_many :products, through: :order_contents

	has_many :order_contents


end
