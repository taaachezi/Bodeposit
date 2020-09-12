class RemoveMaterialIdFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :material_id, :bigint
  end
end
