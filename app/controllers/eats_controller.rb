class EatsController < ApplicationController
  before_action :authenticate_user!
  after_action :set_calorie
  def create
    # recipeを摂取する
    if params["recipe_id"]
      recipe = Recipe.find(params[:recipe_id])
      eat = current_user.eats.new
      eat.recipe_id = recipe.id
      eat.protein = recipe.protein.to_f
      eat.fat = recipe.fat.to_f
      eat.carbohydrate = recipe.carbohydrate.to_f
      eat.calorie = recipe.calorie.to_f
      eat.save
      flash[:notice] = "#{recipe.name}を摂取しました"
      redirect_to user_top_path(current_user.id)
    else
    # materialを摂取する
      @eat = current_user.eats.new(params_eat)
      if params[:eat][:material_id].empty? || params[:eat][:quantity].empty?
        flash[:error] = "材料または数量が選択されていません"
      else
        @eat.material_id = @eat.material.id
        @eat.protein = @eat.material.protein * @eat.quantity / 100
        @eat.fat = @eat.material.fat * @eat.quantity / 100
        @eat.carbohydrate = @eat.material.carbohydrate * @eat.quantity / 100
        @eat.calorie = Material.calorie_fit(@eat.fat, @eat.protein, @eat.carbohydrate)
        @eat.save
      end
    end
  end

  def destroy
    eat = Eat.find_by(id: params[:id])
    eat.destroy
    @eat = current_user.eats.new
  end

  private

  def params_eat
    params.require(:eat).permit(:material_id, :protein, :fat, :carbohydrate, :calorie, :quantity)
  end

  def set_calorie
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
  end
end
