class RecipesController < ApplicationController
  def new
  	@recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(params_recipe)
  	@recipe.user_id = current_user.id
  	@recipe.save
  	redirect_to  new_recipe_recipe_material_path(recipe_id: @recipe.id)
  end

  def index
  end

  def show
  end

  private
  def params_recipe
  	params.require(:recipe).permit(:name, :body, :image)
  end
end
