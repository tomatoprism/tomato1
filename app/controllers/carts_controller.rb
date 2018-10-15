class CartsController < ApplicationController

  def add_item
    @cart_item = CartItem.new
    @cart_item.cart_id = current_user.cart.id
    @cart_item.product_id = params[:cart_id]
    @cart_item.quantity = params[:product][:stock].to_i
    @cart_item.save
    redirect_to cart_path(current_user.cart.id)
  end


  def show
  	@cart_item = CartItem.find(params[:id])
    @cart_item.cart_id = current_user.cart.id

  end

  def delete_item
  	@cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_user.cart.id)
  end

private
    def cart_params
        params.require(:cart).permit(:user_id)
    end

end

