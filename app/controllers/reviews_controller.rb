class ReviewsController < ApplicationController
  before_action :set_recipe
  before_action :authenticate_user!

  def create
    @review = Review.new(params_reviews)
    @review.user_id = current_user.id
    @review.recipe_id = @recipe.id
    review = @recipe.reviews.pluck(:user_id)
    if @review.save
      @average_rate = @recipe.reviews.average(:rate).round(1).to_f
      @recipe.update(average_rate: @average_rate)
      flash[:notice] = "レビューを投稿しました"
    else 
      flash[:error] = "評価またはコメントがありません"
    end
  end

  def destroy
    @review = Review.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    @review.destroy
    flash[:notice] = "レビューを削除しました"
    if @recipe.reviews.blank?
      @recipe.update(average_rate: 0.0)
    else
      @average_rate = @recipe.reviews.average(:rate).round(1).to_f
      @recipe.update(average_rate: @average_rate)
    end
  end

  private

  def params_reviews
    params.require(:review).permit(:recipe_id, :rate, :body)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
    @reviews = @recipe.reviews.page(params[:page]).per(5)
  end
end
