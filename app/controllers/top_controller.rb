class TopController < ApplicationController
	def top
		@categories = Category.all
		@artists = Artist.all
		@productfind = Product.search(params[:search])
		@products = Product.all.order("release DESC")
	end
	def admin
	end
	private
	def product_params
        params.require(:product).permit(:title, :image_id, :price, :label, :stock, :release, :introduction, :artist_id, :category_id)
    end
end
