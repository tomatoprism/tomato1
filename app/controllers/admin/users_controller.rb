class Admin::UsersController < Admin::ApplicationController
	def index
		@users = User.all

	end

	def show
		@product_new = Product.new
		@disc = @product_new.discs.build
  		@track = @disc.tracks.build
	end
end
