class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.bigint :user_id, null: false
      t.bigint :recipe_id, null: false
      t.text :body, null: false
      t.float :rate, null: false, default: 0.0

      t.timestamps
    end
  end
end
