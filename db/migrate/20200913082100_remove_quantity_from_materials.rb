class RemoveQuantityFromMaterials < ActiveRecord::Migration[5.2]
  def change
    remove_column :materials, :quantity, :integer
  end
end
