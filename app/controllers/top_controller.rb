class TopController < ApplicationController
  skip_before_action :authenticate_user!, except: [:user_top]
  before_action -> { check_user(params[:id]) }, only: [:user_top]
  def top
  end

  def how_use
  end

  def user_top
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
    end
    @users = User.includes(:messages).order("messages.created_at DESC")
    @eat = current_user.eats.new
    set_calorie(Date.today.in_time_zone.all_day)
    @recipes = Recipe.order("average_rate DESC").limit(3)
  end
end
