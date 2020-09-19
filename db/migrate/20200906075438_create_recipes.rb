class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.bigint :user_id, null: false
      t.string :name, null: false
      t.text :body, null: false
      t.string :image_id, null: false
      t.float :fat
      t.float :protein
      t.float :carbohydrate
      t.float :calorie
      t.float :average_rate
      

      t.timestamps
    end
  end
end
