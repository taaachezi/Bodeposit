class ApplicationController < ActionController::Base
  # devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    user_top_path(current_user.id)
  end

  def after_sign_in_path_for(resource)
    user_top_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def set_calorie
    search_today = Date.today.in_time_zone.all_day
    @eat_calorie = current_user.eats.where(created_at: search_today).sum(:calorie).to_f.round(1)
    @eat_protein = current_user.eats.where(created_at: search_today).sum(:protein).to_f.round(1)
    @eat_carbo = current_user.eats.where(created_at: search_today).sum(:carbohydrate).to_f.round(1)
    @eat_fat = current_user.eats.where(created_at: search_today).sum(:fat).to_f.round(1)
    @eats = current_user.eats.where(created_at: search_today)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :height, :weight, :level, :age, :sex])
  end
end
