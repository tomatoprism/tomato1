class Product < ApplicationRecord
	belongs_to :artist

	has_many :product_categories
	has_many :categories, through: :product_categories
	has_many :reviews, dependent: :destroy

	has_many :cart_items
	attachment :image

	has_many :discs, inverse_of: :product
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

	def self.search(search)
		if search
			Product.where(['title LIKE ?', "%#{search}%"])
		else
			Product.all
		end
	end

end
