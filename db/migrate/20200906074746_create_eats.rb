class CreateEats < ActiveRecord::Migration[5.2]
  def change
    create_table :eats do |t|
      t.bigint :user_id, null: false
      t.bigint :material_id, null: false
      t.float :fat
      t.float :carbohydrate
      t.float :protein
      t.float :calorie, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
