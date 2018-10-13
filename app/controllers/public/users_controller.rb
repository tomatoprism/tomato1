class Public::UsersController < Public::ApplicationController

	def create_cart
		cart.create(User.id:self.id)
	end

	def show
		@user = current_user
		@product = Product.find(params[:id])

	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
    	user.update(user_params)
    	redirect_to user_path(user)
	end

	private
    def user_params
        params.require(:user).permit(:name, :name_kana, :email, :phone, :post_code, :adddress)
    end
end