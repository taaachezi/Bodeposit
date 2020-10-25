require 'rails_helper'

RSpec.describe Genre, type: :model do
  context "アソシエーションが正しく設定されている" do
    it "1:Nになっている" do
      expect(Genre.reflect_on_association(:materials).macro).to eq :has_many
    end
    it "N:1になっている" do
      expect(Genre.reflect_on_association(:user).macro).to eq :belongs_to
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

      @genre = Genre.new
      @genre.user_id = 1
      @genre.name = "aa"
      @genre.status = true
      @genre.save
    end

    it "全て入力してあるので保存される" do
      expect(@genre).to be_valid
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
      @genre.name = ""
      @genre.status = true
      @genre.save
    end

    it "nameが入力されていないので保存されない" do
      expect(@genre).to be_invalid
    end
  end
end
