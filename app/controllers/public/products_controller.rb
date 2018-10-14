class Public::ProductsController < Public::ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@discs = @product.discs
	end

    def add_item
		@cart_item = Cart_item.new
		@cart_item.max_stock(params[:stock])
		@cart_item.quantity += params[:quantity].to_i
        @cart_item.save
        redirect_to cart_path(cart.id)
	end

	def product_params
        params.require(:product).permit(:title, :image_id, :price, :label, :stock, :release, :introduction, :artist_id, :category_id)
    end
end


