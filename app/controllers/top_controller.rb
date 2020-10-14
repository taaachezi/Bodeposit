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
    # current_userの累計摂取量
    @eat_calorie = 0
    @eat_protein = 0
    @eat_carbo = 0
    @eat_fat = 0
    @eats = current_user.eats.page(params[:page]).per(5)
    @eats.each do |eat|
      @eat_calorie += eat.calorie.to_f
      @eat_protein += eat.protein.to_f
      @eat_carbo += eat.carbohydrate.to_f
      @eat_fat += eat.fat.to_f
    end
    @recipes = Recipe.order("average_rate DESC").limit(3)
  end
  
end
