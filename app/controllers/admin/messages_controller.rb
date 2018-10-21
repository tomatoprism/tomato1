class Admin::MessagesController < Admin::ApplicationController
	before_action :correct_user, only:[:index,:show]

	def correct_user
	    unless admin_signed_in?
	      redirect_to root_path
	    end
  	end
	def index
		@messages = Message.all
	end

	def show
		@message = Message.find(params[:id])
	end

	private
    def message_params
        params.require(:message).permit(:name, :mail, :text)
    end
end
