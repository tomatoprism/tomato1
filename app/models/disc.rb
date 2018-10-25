class Disc < ApplicationRecord
	belongs_to :product
	has_many :tracks, inverse_of: :disc, dependent: :destroy
	accepts_nested_attributes_for :tracks, reject_if: :all_blank, allow_destroy: true
end
