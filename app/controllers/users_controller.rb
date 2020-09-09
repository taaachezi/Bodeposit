class UsersController < ApplicationController

  before_action :set_user

  def show
    @user.calorie
    @data = {"たんぱく質" => @user.protein.round(1), "脂質" => @user.fat.round(1), "炭水化物" => @user.carbohydrate.round(1)}
  end

  def update
    @user.calorie = intake_nutorition(@user.height, @user.weight, @user.sex, @user.age, @user.level)
    @user.protein = intake_protein(@user.weight)
    @user.fat = intake_fat(@user.weight)
    @user.carbohydrate = intake_carbo(@user.protein, @user.fat, @user.calorie)
    @user.update(params_users)
    redirect_back(fallback_location: root_path)
  end

  def unsubscribe
    current_user.destroy
    redirect_to root_path
  end

  def withdraw
  end

  private

  def params_users
    params.require(:user).permit(:name, :email, :sex, :age, :height, :weight, :level, :calorie, :fat, :protein, :carbohydrate)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
