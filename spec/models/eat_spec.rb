require 'rails_helper'

RSpec.describe Eat, type: :model do
  context "アソシエーションが正しく設定されている" do
    it "N:1になっている" do
      expect(Eat.reflect_on_association(:recipe).macro).to eq :belongs_to
      expect(Eat.reflect_on_association(:material).macro).to eq :belongs_to
      expect(Eat.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end

  context "データが正しく保存される" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = "111111"
      @user.height = "111"
      @user.weight = "11"
      @user.age = "11"
      @user.level = 0
      @user.sex = 1
      @user.save

      @material = Material.new
      @material.name = "aa"
      @material.fat = 11
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save

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

      @eat = Eat.new
      @eat.user_id = 1
      @eat.material_id = 1
      @eat.recipe_id = 1
      @eat.fat = 11
      @eat.carbohydrate = 11
      @eat.protein = 11
      @eat.calorie = 11
      @eat.quantity = 111
      @eat.save
    end

    it "全て入力してあるので保存される" do
      expect(@eat).to be_valid
    end
  end

  context "データが保存されない" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = "111111"
      @user.height = "111"
      @user.weight = "11"
      @user.age = "11"
      @user.level = 0
      @user.sex = 1
      @user.save

      @material = Material.new
      @material.name = "aa"
      @material.fat = 11
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save

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

      @eat = Eat.new
      @eat.user_id = 1
      @eat.material_id = 1
      @eat.recipe_id = 1
      @eat.fat = ""
      @eat.carbohydrate = 11
      @eat.protein = 11
      @eat.calorie = 11
      @eat.quantity = 111
      @eat.save
    end

    it "fatが入力されていないので保存されない" do
      expect(@eat).to be_invalid
    end
  end

  context "データが保存されない" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = "111111"
      @user.height = "111"
      @user.weight = "11"
      @user.age = "11"
      @user.level = 0
      @user.sex = 1
      @user.save

      @material = Material.new
      @material.name = "aa"
      @material.fat = 11
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save

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

      @eat = Eat.new
      @eat.user_id = 1
      @eat.material_id = 1
      @eat.recipe_id = 1
      @eat.fat = 11
      @eat.carbohydrate = ""
      @eat.protein = 11
      @eat.calorie = 11
      @eat.quantity = 111
      @eat.save
    end

    it "carbohydrateが入力されていないので保存されない" do
      expect(@eat).to be_invalid
    end
  end

  context "データが保存されない" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = "111111"
      @user.height = "111"
      @user.weight = "11"
      @user.age = "11"
      @user.level = 0
      @user.sex = 1
      @user.save

      @material = Material.new
      @material.name = "aa"
      @material.fat = 11
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save

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

      @eat = Eat.new
      @eat.user_id = 1
      @eat.material_id = 1
      @eat.recipe_id = 1
      @eat.fat = 11
      @eat.carbohydrate = 11
      @eat.protein = ""
      @eat.calorie = 11
      @eat.quantity = 111
      @eat.save
    end

    it "proteinが入力されていないので保存されない" do
      expect(@eat).to be_invalid
    end
  end

  context "データが保存されない" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = "111111"
      @user.height = "111"
      @user.weight = "11"
      @user.age = "11"
      @user.level = 0
      @user.sex = 1
      @user.save

      @material = Material.new
      @material.name = "aa"
      @material.fat = 11
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save

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

      @eat = Eat.new
      @eat.user_id = 1
      @eat.material_id = 1
      @eat.recipe_id = 1
      @eat.fat = 11
      @eat.carbohydrate = 11
      @eat.protein = 11
      @eat.calorie = ""
      @eat.quantity = 111
      @eat.save
    end

    it "calorieが入力されていないので保存されない" do
      expect(@eat).to be_invalid
    end
  end
end
