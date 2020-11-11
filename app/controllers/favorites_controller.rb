class FavoritesController < ApplicationController
  before_action -> {
    set_recipe
    check_user(params[:user_id])
  }

  def create
    favorite = current_user.favorites.new
    favorite.recipe_id = @recipe.id
    favorite.save
    flash[:notice] = "マイレシピに登録しました"
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id).destroy
    flash[:notice] = "解除しました"
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
