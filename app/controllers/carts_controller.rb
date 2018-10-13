class CartsController < ApplicationController
  def show
  	@cart_item = Cart_item.find(params[:id])
  	@cart = Cart.where(user_id)
  	@cart.user_id = current_user
  end
end
