class Public::FavoritesController < ApplicationController
	def index
        @user = current_user
        @userfavorites = @user.favorites
        porducts = @userfavorites.pluck(:product_id)
        @favariteproducts = Product.where(id: products)
	end
	def create
        product = Product.find(params[:product_id])
        favorite = current_user.favorites.new(product_id: product.id)
        favorite.save
        redirect_to product_path(product)
    end
    def destroy
        product = Product.find(params[:product_id])
        favorite = current_user.favorites.find_by(product_id: product.id)
        favorite.destroy
        redirect_to product_path(product)
    end
end
