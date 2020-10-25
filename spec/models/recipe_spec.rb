require 'rails_helper'

RSpec.describe Recipe, type: :model do
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
    end

    it "全て入力してあるので保存される" do
      expect(@recipe).to be_valid
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
      @recipe.name = ""
      @recipe.body = "aaa"
      @recipe.carbohydrate = 11
      @recipe.protein = 11
      @recipe.fat = 11
      @recipe.calorie = 11
      @recipe.average_rate = 3
      @recipe.image_id = "111111"
      @recipe.save
    end

    it "nameが入力されていないので保存できない" do
      expect(@recipe).to be_invalid
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
      @recipe.body = ""
      @recipe.carbohydrate = 11
      @recipe.protein = 11
      @recipe.fat = 11
      @recipe.calorie = 11
      @recipe.average_rate = 3
      @recipe.image_id = "111111"
      @recipe.save
    end

    it "bodyが入力されていないので保存できない" do
      expect(@recipe).to be_invalid
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
      @recipe.image_id = ""
      @recipe.save
    end

    it "imageが入力されていないので保存できない" do
      expect(@recipe).to be_invalid
    end
  end
end
