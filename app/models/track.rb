class Track < ApplicationRecord
	belongs_to :disc
	default_scope -> { order(list_num: :asc) }
end
