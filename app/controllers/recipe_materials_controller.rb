class RecipeMaterialsController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe_material = RecipeMaterial.new
    set_recipe_material
  end

  def create
    # genre.materialsで選択可能にする
    if params[:genre_id]
      if params[:genre_id].present?
        @genre = Genre.find(params[:genre_id])
      end
      @recipe = Recipe.find(params[:recipe_id])
      @recipe_materials = @recipe.recipe_materials.all.page(params[:page]).per(6)
      @recipe_material = RecipeMaterial.new
      render :new
    else
      @recipe = Recipe.find(params[:recipe_id])
      @recipe_material = RecipeMaterial.new(params_recipe_material)
      material = params[:recipe_material][:material_id]
      recipe = @recipe.recipe_materials.pluck(:material_id)
      if material == ""
        set_recipe_material
        flash[:error] = "材料が選択されていません"
      elsif recipe.include?(material.to_i)
        set_recipe_material
        flash[:error] = "登録済の材料です"
      else
        @recipe_material.recipe_id = @recipe.id
        @recipe_material.material_id = @recipe_material.material.id
        if @recipe_material.save
          set_recipe_material
          flash[:notice] = "材料を登録しました"
        else
          set_recipe_material
          flash[:error] = "数量が選択されていません"
         end
      end
    end
  end

  def destroy
    @recipe_material = RecipeMaterial.find(params[:id])
    @recipe_material.destroy
    set_recipe_material
    flash[:notice] = "削除しました"
  end

  private

  def params_recipe_material
    params.require(:recipe_material).permit(:material_id, :quantity)
  end

  def set_recipe_material
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_materials = @recipe.recipe_materials.page(params[:page]).per(5)
    @sum_calorie = 0
    @recipe_materials.each do |recipe_material|
      @sum_calorie += recipe_material.quantity * recipe_material.material.calorie / 100
    end
  end

end
