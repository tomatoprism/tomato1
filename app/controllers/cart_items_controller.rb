class CartItemsController < ApplicationController

	def add_item
		@cart_item = Cart_item.new
		@cart_item.max_stock(params[:stock])
		@cart_item.quantity += params[:quantity].to_i
        @cart_item.save
        redirect_to cart_path(cart.id)
	end

	private
    def cart_item_params
        params.require(:add_item).permit(:cart_id, :product_id, :quantity)
    end

end
