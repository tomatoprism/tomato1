class PaymentsController < ApplicationController
  before_action :correct_user

  def correct_user
      unless user_signed_in? || admin_signed_in?
        redirect_to root_path
      end
  end
  
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