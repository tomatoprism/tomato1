class CartsController < ApplicationController
  before_action :correct_user

  def correct_user
      unless user_signed_in? || admin_signed_in?
        redirect_to root_path
      end
    end

  def add_item

    cart_item = CartItem.new
    cart = Cart.where(user_id: current_user.id).last
    cart_item.cart_id = cart.id
    cart_item.product_id = params[:cart_id]
    cart_item.quantity = params[:product][:stock].to_i
     if cart_item.quantity > cart_item.product.stock
      @message = "在庫は" + cart_item.product.stock.to_s + "個です"
      redirect_to product_path(cart_item.product.id), alert: @message
      else
      cart_item.save

      redirect_to root_path, success: 'カートに商品が追加されました'
      end
  end
  

  def show
  end

  def delete_item
    cart_item = CartItem.find(params[:id])
    cart_item.cart_id = current_user.carts.where(user_id: current_user.id).last.id
    cart_item.destroy
    redirect_to cart_path(current_user.carts.where(user_id: current_user.id).last.id)
  end

private
    def cart_params
        params.require(:cart).permit(:user_id)
    end

end

