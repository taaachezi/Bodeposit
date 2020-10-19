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
    @eat_calorie = 0
    @eat_protein = 0
    @eat_carbo = 0
    @eat_fat = 0
    @eats = current_user.eats
    @eats.each do |eat|
      @eat_calorie += eat.calorie.to_f
      @eat_protein += eat.protein.to_f
      @eat_carbo += eat.carbohydrate.to_f
      @eat_fat += eat.fat.to_f
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :height, :weight, :level, :age, :sex])
  end
end
