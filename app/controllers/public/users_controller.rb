class Public::UsersController < Public::ApplicationController
	def show
		@user = current_user

	end

	def edit
		@user = User.find(params[:id])
        if @user != current_user
            redirect_to user_path
        end

	end

	def update
		@user = User.find(params[:id])
        if @user.update(user_params)
         redirect_to user_path
       else
        redirect_back
       end
	end
end