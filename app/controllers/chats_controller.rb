class ChatsController < ApplicationController
	def show
		user = User.find(params[:id])
		chat_user = ChatUser.pluck(:user_id)
		if chat_user.include?(current_user.id)
			if current_user.id == 6
				@chat = ChatUser.where(user_id:user.id).pluck(:chat_id)
			else
				@chat = ChatUser.where(user_id: current_user.id).pluck(:chat_id)
			end
		else 
			@chat = Chat.new
			@chat.save
			ChatUser.create(user_id: current_user.id, chat_id: @chat.id)
			ChatUser.create(user_id: 6, chat_id: @chat.id)
		end
		@messages = Message.where(chat_id: @chat)
		@message = Message.new(chat_id: @chat, user_id: current_user.id)
	end

end
