class CartItemsController < ApplicationController


	private
    def cart_item_params
        params.require(:add_item).permit(:cart_id, :product_id, :quantity)
    end

end

