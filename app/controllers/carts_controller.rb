class CartsController < ApplicationController
  def show
  	@cart_item = Cart_item.find(params[:id])
  	@cart = Cart.find(params[:user_id])
  	@cart.user_id = current_user
  end

  def delete_item
    @cart_item.destroy
    redirect_to cart_path(cart.id)
  end

end

