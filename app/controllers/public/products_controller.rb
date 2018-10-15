class Public::ProductsController < Public::ApplicationController
	def index
		@products = Product.all.order(release: "DESC")
	end

	def show
		@product = Product.find(params[:id])
		@discs = @product.discs
		@user = current_user
	end
	def search
		@productfind = Product.search(params[:search]).order(release: "DESC")
	end

	private
	def product_params
        params.require(:product).permit(:title, :image_id, :price, :label, :stock, :release, :introduction, :artist_id, :category_id)
    end
end


