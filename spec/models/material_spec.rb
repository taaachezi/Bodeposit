require 'rails_helper'

RSpec.describe Material, type: :model do
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
    end

    it "全て入力してあるので保存される" do
      expect(@material).to be_valid
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

      @genre = Genre.new
      @genre.user_id = 1
      @genre.name = "aa"
      @genre.status = true
      @genre.save

      @material = Material.new
      @material.user_id = 1
      @material.genre_id = 1
      @material.name = ""
      @material.fat = 11
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save
    end

    it "nameが入力されていません" do
      expect(@material).to be_invalid
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

      @genre = Genre.new
      @genre.user_id = 1
      @genre.name = "aa"
      @genre.status = true
      @genre.save

      @material = Material.new
      @material.user_id = 1
      @material.genre_id = 1
      @material.name = "aa"
      @material.fat = ""
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save
    end

    it "fatが入力されていません" do
      expect(@material).to be_invalid
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
      @material.carbohydrate = ""
      @material.protein = 11
      @material.calorie = 11
      @material.save
    end

    it "carbohydrateが入力されていません" do
      expect(@material).to be_invalid
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
      @material.protein = ""
      @material.calorie = 11
      @material.save
    end

    it "proteinが入力されていません" do
      expect(@material).to be_invalid
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
      @material.calorie = ""
      @material.save
    end

    it "calorieが入力されていません" do
      expect(@material).to be_invalid
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

      @genre = Genre.new
      @genre.user_id = 1
      @genre.name = "aa"
      @genre.status = true
      @genre.save

      @material = Material.new
      @material.user_id = 1
      @material.genre_id = ""
      @material.name = "aa"
      @material.fat = 11
      @material.carbohydrate = 11
      @material.protein = 11
      @material.calorie = 11
      @material.save
    end

    it "genreが入力されていません" do
      expect(@material).to be_invalid
    end
  end
end
