class AddProteinToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :protein, :float
  end
end
