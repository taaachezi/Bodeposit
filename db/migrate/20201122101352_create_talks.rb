class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.bigint :user_id
      t.string :body
      t.bigint :group_id

      t.timestamps
    end
  end
end
