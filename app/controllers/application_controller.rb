class ApplicationController < ActionController::Base
  # devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
    user_top_path(current_user.id)
  end

  def after_sign_in_path_for(resource)
    user_top_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def check_user(user)
    unless current_user.id == user.to_i || 6
      redirect_back(fallback_location: root_path)
      flash[:error] = "不正なアクセスです"
    end
  end

  def set_calorie(day)
    search_day = day
    @eat_calorie = current_user.eats.where(created_at: search_day).sum(:calorie).to_f.round(1)
    @eat_protein = current_user.eats.where(created_at: search_day).sum(:protein).to_f.round(1)
    @eat_carbo = current_user.eats.where(created_at: search_day).sum(:carbohydrate).to_f.round(1)
    @eat_fat = current_user.eats.where(created_at: search_day).sum(:fat).to_f.round(1)
    @eats = current_user.eats.where(created_at: search_day)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :height, :weight, :level, :age, :sex])
  end
end
