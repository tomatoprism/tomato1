class Public::ProductsController < Public::ApplicationController
	def index
		@product = Product.find(params[:id])

	end

	def show

	end

	def edit

	end

	def update

	end

	def destroy

	end

	def new

	end

	def create
		
	end

	def product_params
        params.require(:product).permit(:title, :image_id, :pricd, :label, :stock, :release, :introduction, :artist_id, :category_id)
    end
end