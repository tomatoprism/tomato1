class Public::FavoritesController < ApplicationController
	def index
        @categories = Category.all
        @artists = Artist.all
        @user = current_user
        @userfavorites = @user.favorites
        if @userfavorites.count > 0
        products = @userfavorites.pluck(:product_id)
        @favariteproducts = Product.where(id: products)
        else redirect_to root_path
        end
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
