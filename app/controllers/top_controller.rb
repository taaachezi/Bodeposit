class TopController < ApplicationController
  before_action :authenticate_user!, only: [:user_top]

  def top
  end

  def how_use
  end

  def user_top
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
    end
    @users = User.all
    @eat = current_user.eats.new
    set_calorie
    @recipes = Recipe.order("average_rate DESC").limit(3)
  end
end
