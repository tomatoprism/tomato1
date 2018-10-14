class CartItem < ApplicationRecord
	belongs_to :product
	belongs_to :cart

	@stock = 0
	def max_stock(count)
		@stock = count
	end

	validates :stock, numericality: { presence: true, only_integer: true, greater_than: 0, less_than_or_equal_to: :@stock }

end
