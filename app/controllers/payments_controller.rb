class PaymentsController < ApplicationController
  def show
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