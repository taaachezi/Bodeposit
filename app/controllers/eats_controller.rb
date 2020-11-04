class EatsController < ApplicationController
  before_action :authenticate_user!
  def create
    # recipeを摂取する
    if params["recipe_id"]
      recipe = Recipe.find(params[:recipe_id])
      eat = current_user.eats.new
      eat.recipe_id = recipe.id
      eat.protein = recipe.protein
      eat.fat = recipe.fat
      eat.carbohydrate = recipe.carbohydrate
      eat.calorie = recipe.calorie
      eat.save
      flash[:notice] = "#{recipe.name}を摂取しました"
      redirect_to user_top_path(current_user.id)
    else
      # materialを摂取する
      @eat = current_user.eats.new(params_eat)
      if params[:eat][:material_id].empty? || params[:eat][:quantity].empty?
        flash[:error] = "材料または数量が選択されていません"
        set_calorie
      else
        @eat.material_id = @eat.material.id
        @eat.protein = @eat.material.protein * @eat.quantity / 100
        @eat.fat = @eat.material.fat * @eat.quantity / 100
        @eat.carbohydrate = @eat.material.carbohydrate * @eat.quantity / 100
        @eat.calorie = Material.calorie_fit(@eat.fat, @eat.protein, @eat.carbohydrate)
        @eat.save
        set_calorie
      end
    end
  end

  def destroy
    eat = Eat.find_by(id: params[:id])
    eat.destroy
    @eat = current_user.eats.new
    set_calorie
  end

  def destroy_all
    current_user.eats.destroy_all
    @eat = current_user.eats.new
    set_calorie
  end


  private

  def params_eat
    params.require(:eat).permit(:material_id, :protein, :fat, :carbohydrate, :calorie, :quantity)
  end
end
