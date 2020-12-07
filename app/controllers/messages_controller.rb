class MessagesController < ApplicationController
  
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if params[:chat_id].is_a?(Array)
      @message.chat_id = params[:chat_id][0]
    else
      @message.chat_id = params[:chat_id]
    end
    @message.save
    @messages = Message.where(chat_id: @message.chat_id)
  end

  private

  def message_params
    params.require(:message).permit(:question, :answer, :chat_id)
  end
end
