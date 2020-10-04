class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(params_recipe)
    recipe.user_id = current_user.id
    # 画像認識
    if recipe.save
      p recipe.image
      tags = Vision.get_image_data(recipe.image)
      #recipe.tags.destroy_all
      tags.each do |tag|
        recipe.tags.create(name: tag)
      end
      redirect_to new_recipe_recipe_material_path(recipe_id: recipe.id)
    else flash[:error] = "全て記入してください"
      @recipe = Recipe.new
      set_recipe
      render :new
    end
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @recipes = @user.favorite_recipes.page(params[:page]).per(9)
    elsif params[:name]
      @search = params[:name]
      @recipes = Recipe.where("name LIKE?", "%#{params[:name]}%").page(params[:page]).per(9)
    else
      @recipes = Recipe.page(params[:page]).per(9)
    end

    if params[:option] == "new"
      @recipes = Recipe.order("created_at DESC").page(params[:page]).per(9)
    elsif params[:option] == "low_calorie"
      @recipes = Recipe.order("calorie ASC").page(params[:page]).per(9)
    elsif params[:option] == "high_rate"
      @recipes = Recipe.order("average_rate DESC").page(params[:page]).per(9)
    elsif params[:option] == "high_protein"
      @recipes = Recipe.order("protein DESC").page(params[:page]).per(9)
    elsif params[:option] == "high_carbo"
      @recipes = Recipe.order("carbohydrate DESC").page(params[:page]).per(9)
    elsif params[:option] == "low_fat"
      @recipes = Recipe.order("fat ASC").page(params[:page]).per(9)
    elsif params[:option] == "all"
      @recipes = Recipe.all.page(params[:page]).per(9)
    end
  end

  def show
    if user_signed_in?
      @eat = current_user.eats.new
    end
    @review = Review.new
    @reviews = @recipe.reviews.page(params[:page]).per(5)
    @recipe_materials = @recipe.recipe_materials
    # 同じタグを持つレシピを取り出す
    recipe_tags = @recipe.tags #.where.not(name: ["Cuisine", "Food", "Dish"])
    recipe_tags = recipe_tags.pluck(:name)
    same_tags = Tag.where(name: recipe_tags).pluck(:recipe_id)
    @recipes = Recipe.where.not(id: @recipe).where(id: same_tags)
    # レシピのマクロ栄養素計算
    @recipe.fat = 0
    @recipe.protein = 0
    @recipe.carbohydrate = 0
    @recipe_materials.each do |recipe_material|
      @recipe.fat += recipe_material.material.fat * recipe_material.quantity / 100
      @recipe.protein += recipe_material.material.protein * recipe_material.quantity / 100
      @recipe.carbohydrate += recipe_material.material.carbohydrate * recipe_material.quantity / 100
    end
    @recipe.calorie = Material.calorie_fit(@recipe.fat, @recipe.protein, @recipe.carbohydrate)
    @recipe.update(fat: @recipe.fat, protein: @recipe.protein, carbohydrate: @recipe.carbohydrate, calorie: @recipe.calorie)
    @data = { "たんぱく質" => @recipe.protein.round(1), "脂質" => @recipe.fat.round(1), "炭水化物" => @recipe.carbohydrate.round(1) }
  end

  def edit
  end

  def update
    if @recipe.update(params_recipe)
      # タグの更新　一度タグを削除した後再度作成
      tags = Vision.get_image_data(@recipe.image)
      tags.each do |tag|
        @recipe.tags.destroy_all
        @recipe.tags.create(name: tag)
      end
      redirect_to new_recipe_recipe_material_path(recipe_id: @recipe.id)
    else flash[:error] = "全て記入してください"
         set_recipe
         render :edit
    end
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
