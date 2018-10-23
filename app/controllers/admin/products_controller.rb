class Admin::ProductsController < Admin::ApplicationController
	before_action :correct_user, only:[:index, :create, :edit, :update, :destroy]

	def correct_user
	    unless admin_signed_in?
	      redirect_to root_path
	    end
  	end
	def index
		@products = Product.page(params[:page]).reverse_order
		@less = Product.where("stock < 10", nil)
		@a = @less.page(params[:page]).reverse_order

	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to product_path(@product.id), success: '商品が編集されました'
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admin_products_path, success: '商品が削除されました'


	end


	def create
		@product_new = Product.new(product_params)
		@product_new.save
		redirect_to admin_user_path(current_admin), success: '商品が追加されました'
	end

	private
	def product_params
        params.require(:product).permit(:title, :image, :price, :label, :stock, :release, :introduction, :artist_id, category_ids: [], discs_attributes: [:id, :disc_name, :done, :_destroy,tracks_attributes: [:id, :music, :list_num]])
   	end
end





