class Public::UsersController < Public::ApplicationController
	def show
		@user = current_user

	end

	def edit
		@user = User.find(params[:id])
            redirect_to user_path
        end

	end

	def update
		@user = User.find(params[:id])
        if @user.update(user_params)
         redirect_to user_path
       else
        redirect_to iser_path
       end

       private
 
    def user_params
        params.require(:user).permit(:name_kana, :name, :email, :phone, :post_code, :address)

    end
end