class Admin::MessagesController < Admin::ApplicationController
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
