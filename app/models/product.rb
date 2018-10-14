class Product < ApplicationRecord
	belongs_to :category
	belongs_to :artist

	has_many :reviews
	has_many :cart_items
	attachment :image

	has_many :discs, inverse_of: :product
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

end
