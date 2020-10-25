require 'rails_helper'
RSpec.describe Favorite, type: :model do
  context "アソシエーションが正しく設定されている" do
    it "N:1になっている" do
      expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      expect(Favorite.reflect_on_association(:recipe).macro).to eq :belongs_to
    end
  end

  context "データが保存される" do
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

      @favorite = Favorite.new
      @favorite.user_id = 1
      @favorite.recipe_id = 1
      @favorite.save
    end

    it "全て入力されているので保存される" do
      expect(@favorite).to be_valid
    end
  end

  context "データが保存されない" do
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

      @favorite = Favorite.new
      @favorite.user_id = ""
      @favorite.recipe_id = 1
      @favorite.save
    end

    it "userが選択されていないので保存されない" do
      expect(@favorite).to be_invalid
    end
  end

  context "データが保存されない" do
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

      @favorite = Favorite.new
      @favorite.user_id = 1
      @favorite.recipe_id = ""
      @favorite.save
    end

    it "recipeが選択されていないので保存されない" do
      expect(@favorite).to be_invalid
    end
  end
end
