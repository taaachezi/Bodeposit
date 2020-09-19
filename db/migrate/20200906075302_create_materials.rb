class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.bigint :user_id, null: false
      t.bigint :genre_id, null: false
      t.string :name, null: false
      t.float :carbohydrate, null:false
      t.float :protein, null:false
      t.float :fat, null:false
      t.float :calorie, null:false

      t.timestamps
    end
  end
end
