class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.bigint :user_id, null:false
      t.bigint :chat_id, null:false
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
