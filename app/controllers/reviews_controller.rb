class ReviewsController < ApplicationController

	before_action :set_recipe

	def create
		@review = Review.new(params_reviews)
		@review.user_id = current_user.id
		@review.recipe_id = @recipe.id
		@review.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		Review.find_by(user_id: current_user.id, recipe_id: @recipe.id).destroy
		redirect_back(fallback_location: root_path)
	end
	private
	def params_reviews
		params.require(:review).permit(:recipe_id, :rate, :body)
	end
	def set_recipe
		@recipe = Recipe.find(params[:recipe_id])
	end
end

