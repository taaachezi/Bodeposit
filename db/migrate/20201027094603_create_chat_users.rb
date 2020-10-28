class CreateChatUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_users do |t|
      t.bigint :user_id, null:false
      t.integer :chat_id, null:false

      t.timestamps
    end
  end
end
