class CreateEats < ActiveRecord::Migration[5.2]
  def change
    create_table :eats do |t|
      t.bigint :user_id, null: false
      t.bigint :material_id
      t.float :fat
      t.float :carbohydrate
      t.float :protein
      t.float :calorie, null: false
      t.integer :quantity
      t.bigint :recipe_id

      t.timestamps
    end
  end
end
