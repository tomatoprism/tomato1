class CartItemsController < ApplicationController
	before_action :correct_user
	def correct_user
	    unless user_signed_in?
	      redirect_to root_path
	    end
  	end

	private
    def cart_item_params
        params.require(:add_item).permit(:cart_id, :product_id, :quantity)
    end

end

