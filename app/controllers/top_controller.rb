class TopController < ApplicationController
	def top
		@categories = Category.all
		@artists = Artist.all
	end
	def admin
	end
end
