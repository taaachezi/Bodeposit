class AddFatToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :fat, :float
  end
end
