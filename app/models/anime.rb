class Anime < ApplicationRecord
	has_many :products, dependent: :destroy
	attachment :logo
  	validates_uniqueness_of :anime_name
	validates_presence_of :anime_name
end
