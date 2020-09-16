class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def new
  	@recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(params_recipe)
  	@recipe.user_id = current_user.id
  	@recipe.save
  	redirect_to  new_recipe_recipe_material_path(recipe_id: @recipe.id)
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @review = Review.new
    @reviews = @recipe.reviews
    @recipe_materials = @recipe.recipe_materials
    @recipe.fat = 0
    @recipe.protein = 0
    @recipe.carbohydrate = 0
    @recipe_materials.each do |recipe_material|
      @recipe.fat += recipe_material.material.fat * recipe_material.quantity/100
      @recipe.protein += recipe_material.material.protein * recipe_material.quantity/100
      @recipe.carbohydrate += recipe_material.material.carbohydrate * recipe_material.quantity/100
    end
    @recipe.calorie = Material.calorie_fit(@recipe.fat, @recipe.protein, @recipe.carbohydrate)
    @recipe.update(fat: @recipe.fat, protein: @recipe.protein, carbohydrate: @recipe.carbohydrate, calorie: @recipe.calorie)
    @data = {"たんぱく質" => @recipe.protein.round(1), "脂質" => @recipe.fat.round(1), "炭水化物" => @recipe.carbohydrate.round(1)}
  end

  def edit
  end

  def update
    @recipe.update(params_recipe)
    redirect_to new_recipe_recipe_material_path(recipe_id: @recipe.id)
  end

  def destroy
    @recipe.destroy
    redirect_to user_top_path(current_user.id)
  end

  private

  def params_recipe
  	params.require(:recipe).permit(:name, :body, :image)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
