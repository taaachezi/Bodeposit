class AddCalorieToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :calorie, :float
  end
end
