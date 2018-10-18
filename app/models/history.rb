class History < ApplicationRecord
	belongs_to :cart
	acts_as_paranoid
end
