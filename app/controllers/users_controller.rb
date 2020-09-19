class UsersController < ApplicationController

  before_action :set_user

  def show
    @recipes = current_user.recipes.all
  end

  def update
    # フォームからの情報を一度更新
    @user.update(params_users)
    # 更新された情報で再度マクロを計算し、マクロ情報を更新
    @user.calorie = User.intake_nutorition(@user.height, @user.weight, @user.sex, @user.age, @user.level)
    @user.protein = User.intake_protein(@user.weight)
    @user.fat = User.intake_fat(@user.weight)
    @user.carbohydrate = User.intake_carbo(@user.protein, @user.fat, @user.calorie)
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
