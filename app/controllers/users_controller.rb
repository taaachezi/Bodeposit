class UsersController < ApplicationController

  before_action :set_user

  def show
  end

  def update
    @user.update(params_users)
    redirect_back(fallback_location: root_path)
  end

  def unsubscribe
    current_user.destroy
    redirect_to @user
  end

  def withdraw
  end

  private

  def params_users
    params.require(:user).permit(:name, :email, :sex, :age, :height, :weight, :level)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
