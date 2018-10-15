class Public::UsersController < Public::ApplicationController
   before_action :correct_user, only:[:edit, :update, :destroy, :show, :create_cart]

	def create_cart
		cart.create(User.id:self.id)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
    	user.update(user_params)
    	redirect_to user_path(user)
	end

	def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def correct_user
    @user = User.find(params[:id])
    @admin = Admin.find(params[:id])
    unless {@user == current_user, @admin == current_admin}
      redirect_to user_path(current_user.id)
    end

	private
    def user_params
        params.require(:user).permit(:name, :name_kana, :email, :phone, :post_code, :adddress)
    end
end
