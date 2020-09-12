class AddMaterialIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :material_id, :bigint
  end
end
