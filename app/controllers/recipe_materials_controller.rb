class RecipeMaterialsController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipe_material = RecipeMaterial.new
    set_recipe_material
  end

  def create
    # genre.materialsの展開
    if params[:genre_id]
      if params[:genre_id].present?
        @genre = Genre.find(params[:genre_id])
      end
      @recipe_material = RecipeMaterial.new
      set_recipe_material
      render :new
    else

      @recipe = Recipe.find(params[:recipe_id])
      @recipe_material = RecipeMaterial.new(params_recipe_material)
      material = params[:recipe_material][:material_id]
      recipe = @recipe.recipe_materials.pluck(:material_id)
      if material == ""
        flash[:error] = "材料が選択されていません"
        set_recipe_material
      elsif recipe.include?(material.to_i)
        flash[:error] = "登録済の材料です"
        set_recipe_material
      else
        @recipe_material.recipe_id = @recipe.id
        @recipe_material.material_id = @recipe_material.material.id
        if @recipe_material.save
          flash[:notice] = "材料を登録しました"
          set_recipe_material
        else
          flash[:error] = "数量が選択されていません"
          set_recipe_material
         end
      end
    end
  end

  def destroy
    @recipe_material = RecipeMaterial.find(params[:id])
    @recipe_material.destroy
    flash[:notice] = "削除しました"
    set_recipe_material
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
