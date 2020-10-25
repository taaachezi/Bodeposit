require 'rails_helper'

RSpec.describe RecipeMaterial, type: :model do
  context "アソシエーションが正しく設定されている" do
    it "1:Nになっている" do
      expect(RecipeMaterial.reflect_on_association(:recipe).macro).to eq :belongs_to
      expect(RecipeMaterial.reflect_on_association(:material).macro).to eq :belongs_to
    end
  end

  context "データが正しく保存される" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = 111111
      @user.height = 111
      @user.weight = 11
      @user.age = 11
      @user.level = 0
      @user.sex = 1
      @user.save

      @recipe = Recipe.new
      @recipe.user_id = 1
      @recipe.name = "aa"
      @recipe.body = "aaa"
      @recipe.carbohydrate = 11
      @recipe.protein = 11
      @recipe.fat = 11
      @recipe.calorie = 11
      @recipe.average_rate = 3
      @recipe.image_id = "111111"
      @recipe.save

      @genre = Genre.new
      @genre.user_id = 1
      @genre.name = "aa"
      @genre.status = true
      @genre.save

      @material = Material.new
      @material.user_id = 1
      @material.genre_id = 1
      @material.name = "aa"
      @material.fat = 11
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save

      @recipe_material = RecipeMaterial.new
      @recipe_material.recipe_id = 1
      @recipe_material.material_id = 1
      @recipe_material.quantity = 111
      @recipe_material.save
    end

    it "全て入力されているので保存される" do
      expect(@recipe_material).to be_valid
    end
  end

  context "デーが保存されない" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = 111111
      @user.height = 111
      @user.weight = 11
      @user.age = 11
      @user.level = 0
      @user.sex = 1
      @user.save

      @recipe = Recipe.new
      @recipe.user_id = 1
      @recipe.name = "aa"
      @recipe.body = "aaa"
      @recipe.carbohydrate = 11
      @recipe.protein = 11
      @recipe.fat = 11
      @recipe.calorie = 11
      @recipe.average_rate = 3
      @recipe.image_id = "111111"
      @recipe.save

      @genre = Genre.new
      @genre.user_id = 1
      @genre.name = "aa"
      @genre.status = true
      @genre.save

      @material = Material.new
      @material.user_id = 1
      @material.genre_id = 1
      @material.name = "aa"
      @material.fat = 11
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save

      @recipe_material = RecipeMaterial.new
      @recipe_material.recipe_id = 1
      @recipe_material.material_id = ""
      @recipe_material.quantity = 111
      @recipe_material.save
    end

    it "materialが選択されていないので保存できない" do
      expect(@recipe_material).to be_invalid
    end
  end

  context "デーが保存されない" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = 111111
      @user.height = 111
      @user.weight = 11
      @user.age = 11
      @user.level = 0
      @user.sex = 1
      @user.save

      @recipe = Recipe.new
      @recipe.user_id = 1
      @recipe.name = "aa"
      @recipe.body = "aaa"
      @recipe.carbohydrate = 11
      @recipe.protein = 11
      @recipe.fat = 11
      @recipe.calorie = 11
      @recipe.average_rate = 3
      @recipe.image_id = "111111"
      @recipe.save

      @genre = Genre.new
      @genre.user_id = 1
      @genre.name = "aa"
      @genre.status = true
      @genre.save

      @material = Material.new
      @material.user_id = 1
      @material.genre_id = 1
      @material.name = "aa"
      @material.fat = 11
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save

      @recipe_material = RecipeMaterial.new
      @recipe_material.recipe_id = 1
      @recipe_material.material_id = 1
      @recipe_material.quantity = ""
      @recipe_material.save
    end

    it "quantityが入力されていないので保存できない" do
      expect(@recipe_material).to be_invalid
    end
  end
end
