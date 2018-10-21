class HistoriesController < ApplicationController
  def index
    @histories = History.all
    @users = User.with_deleted.all
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
      stock = c.product.stock - c.quantity
      stock_update = Product.find_by(id: c.product.id)
      stock_update.update(stock: stock)
  	end
    @history.cart_id = cart.id

  	@history.post_code_history = current_user.post_code
  	@history.post_address_history = current_user.address
    @history.user_name = current_user.name
  	@history.post_code_history = current_user.post.post_code
    @history.prefecture_history = current_user.prefecture.prefecture
  	@history.post_address_history = current_user.post.post_address
    
    @history.status = 0
  	@history.save
  	cart = Cart.new(user_id: current_user.id)
  	cart.save
  	redirect_to root_path, success: 'ご購入ありがとうございました'
  end

  private
  def history_params
    params.require(:history).permit(:status, :post_code_history, :prefecture_history, :post_address_history)
  end
end

