class UsersController < ApplicationController
  before_action -> {
    set_user
    check_user(params[:id])
  }
  after_action :set_user

  def show
  end

  def update
    if @user.update(params_users) == false
      flash[:error] = "入力に誤りがあります"
    else
      @user.calorie = User.intake_nutorition(@user.height, @user.weight, @user.sex, @user.age, @user.level)
      @user.protein = User.intake_protein(@user.weight)
      @user.fat = User.intake_fat(@user.weight)
      @user.carbohydrate = User.intake_carbo(@user.protein, @user.fat, @user.calorie)
      if @user.update(params_users)
        flash[:notice] = "情報を更新しました"
      else flash[:error] = "入力に誤りがあります"
      end
    end
  end

  def unsubscribe
    @user.really_destroy!
    redirect_to root_path
  end

  private

  def params_users
    params.require(:user).permit(:name, :email, :sex, :age, :height, :weight, :level, :calorie, :fat, :protein, :carbohydrate)
  end

  def set_user
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).per(6)
  end
end
