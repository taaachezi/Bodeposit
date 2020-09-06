class CreateRecipeMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_materials do |t|
    	t.bigint :recipe_id, null: false
    	t.bigint :material_id, null: false
    	t.integer :quantity, null: false

      t.timestamps
    end
  end
end
