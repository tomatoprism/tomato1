class PaymentsController < ApplicationController
  def show
  	@cart_items = CartItem.find(params[:id])
    @cart_items.cart_id = current_user.carts.where(user_id: current_user.id).last.id
  end

  private
    def cart_params
        params.require(:cart).permit(:user_id)
    end

    private
    def cart_item_params
        params.require(:add_item).permit(:cart_id, :product_id, :quantity)
    end

end