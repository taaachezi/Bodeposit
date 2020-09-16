class FavoritesController < ApplicationController

	before_action :set_recipe

	def create
		favorite = current_user.favorites.new
		favorite.recipe_id = @recipe.id
		favorite.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id).destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def set_recipe
		@recipe = Recipe.find(params[:recipe_id])
	end
end
