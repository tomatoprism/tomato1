class History < ApplicationRecord
	belongs_to :cart
	has_many :history_products

	acts_as_paranoid
end
