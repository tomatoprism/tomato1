class HistoriesController < ApplicationController
  def index
    @histories = History.all
  end

  def update
    history = History.find(params[:id])
    history.update(history_params)
    redirect_to histories_path
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  	@history = History.new
  	cart = Cart.where(user_id: current_user.id).last
  	@history.price_history = 400 #送料と手数料
  	cart.cart_items.each do |c|
  		@history.price_history += c.product.price * c.quantity
  	end
    @history.cart_id = cart.id
  	@history.post_code_history = current_user.post_code
  	@history.post_address_history = current_user.address
    @history.status = 0
  	@history.save
  	cart = Cart.new(user_id: current_user.id)
  	cart.save
  	redirect_to root_path
  end

  private
  def history_params
    params.require(:history).permit(:status)
  end

end

