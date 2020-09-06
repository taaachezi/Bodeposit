class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.bigint :user_id, null: false
      t.bigint :recipe_id, null: false

      t.timestamps
    end
  end
end
