class Public::MessagesController < Public::ApplicationController

  def new
  	@message = Message.new
  end

  def create
  	message = Message.new(message_params)
  	message.save
  	redirect_to new_message_path, success: 'お問い合わせ内容が送信されました'
  end

  private
    def message_params
        params.require(:message).permit(:name, :mail, :text)
    end

end