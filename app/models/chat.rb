class Chat < ApplicationRecord
	has_many :messages, dependent: :destroy
	has_many :chat_users, dependent: :destroy
end
