require 'rails_helper'

RSpec.describe Review, type: :model do
  context "アソシエーションが正しく設定されている" do
    it "N:1になっている" do
      expect(Review.reflect_on_association(:user).macro).to eq :belongs_to
      expect(Review.reflect_on_association(:recipe).macro).to eq :belongs_to
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

      @review = Review.new
      @review.user_id = 1
      @review.recipe_id = 1
      @review.body = "aaaaa"
      @review.rate = 3
      @review.save
    end

    it "全て入力されているので保存される" do
      expect(@review).to be_valid
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

      @review = Review.new
      @review.user_id = 1
      @review.recipe_id = 1
      @review.body = ""
      @review.rate = 3
      @review.save
    end

    it "bodyが入力されていないので保存されない" do
      expect(@review).to be_invalid
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

      @review = Review.new
      @review.user_id = 1
      @review.recipe_id = 1
      @review.body = "aaaaa"
      @review.rate = ""
      @review.save
    end

    it "rateが入力されていないので保存されない" do
      expect(@review).to be_invalid
    end
  end
end
