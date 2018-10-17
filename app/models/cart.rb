class Cart < ApplicationRecord
	# attachment :image
	belongs_to :user
	has_many :cart_items, dependent: :destroy
	has_many :histories
end

