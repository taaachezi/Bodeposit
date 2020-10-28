class MessagesController < ApplicationController
	def create
		@message = Message.new(message_params)
		@message.user_id = current_user.id
		if params[:chat_id].kind_of?(Array)
			@message.chat_id = params[:chat_id][0]
		else
			@message.chat_id = params[:chat_id]
		end
		@message.save
		# ajaxにする
		redirect_to user_top_path(current_user.id)
	end
	private
	def message_params
		params.require(:message).permit(:question, :answer, :chat_id)
	end
end
