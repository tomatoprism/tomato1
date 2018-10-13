class Public::ProductsController < Public::ApplicationController
	def index
		@product = Product.find(params[:id])

	end

	def show

	end

	def product_params
        params.require(:product).permit(:title, :image_id, :price, :label, :stock, :release, :introduction, :artist_id, :category_id)
    end
end