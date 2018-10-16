class Public::MessagesController < Public::ApplicationController

  def new
  	@message = Message.new
  end

  def create
  	message = Message.new(message_params)
  	message.save
  	redirect_to new_message_path, flash: {notice:'お問い合わせを送信しました'}
  end

  private
 
    def message_params
        params.require(:message).permit(:name, :email, :text)
    end

end