class CartsController < ApplicationController
  def show
  	@cart_item = Cart_item.find(params[:id])
  	@cart = Cart.find(params[:user_id])
  	@cart.user_id != current_user
  	redirect_to root_path
  end

  def delete_item
  	@cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(cart.id)
  end

private
    def cart_params
        params.require(:cart).permit(:user_id)
    end

end

