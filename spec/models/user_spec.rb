require 'rails_helper'

RSpec.describe User, type: :model do
  context "アソシエーションが正しく設定されている" do
    it "1:Nとなっている" do
      expect(User.reflect_on_association(:genres).macro).to eq :has_many
      expect(User.reflect_on_association(:recipes).macro).to eq :has_many
      expect(User.reflect_on_association(:materials).macro).to eq :has_many
      expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      expect(User.reflect_on_association(:reviews).macro).to eq :has_many
      expect(User.reflect_on_association(:eats).macro).to eq :has_many
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
    end

    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
    end
  end

  context "データが保存されない" do
    before do
      @user = User.new
      @user.name = ""
      @user.email = "a@a"
      @user.password = "111111"
      @user.height = "111"
      @user.weight = "11"
      @user.age = "11"
      @user.level = 0
      @user.sex = 1
      @user.save
    end

    it "nameが入力されていないので保存されない" do
      expect(@user).to be_invalid
    end
  end

  context "データが保存されない" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = ""
      @user.password = "111111"
      @user.height = "111"
      @user.weight = "11"
      @user.age = "11"
      @user.level = 0
      @user.sex = 1
      @user.save
    end

    it "emailが入力されていないので保存されない" do
      expect(@user).to be_invalid
    end
  end

  context "データが保存されない" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = ""
      @user.height = "111"
      @user.weight = "11"
      @user.age = "11"
      @user.level = 0
      @user.sex = 1
      @user.save
    end

    it "passwordが入力されていないので保存されない" do
      expect(@user).to be_invalid
    end
  end

  context "データが保存されない" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = "111111"
      @user.height = ""
      @user.weight = "11"
      @user.age = "11"
      @user.level = 0
      @user.sex = 1
      @user.save
    end

    it "heightが入力されていないので保存されない" do
      expect(@user).to be_invalid
    end
  end

  context "データが保存されない" do
    before do
      @user = User.new
      @user.name = "aa"
      @user.email = "a@a"
      @user.password = "111111"
      @user.height = "111"
      @user.weight = ""
      @user.age = "11"
      @user.level = 0
      @user.sex = 1
      @user.save
    end

    it "weightが入力されていないので保存されない" do
      expect(@user).to be_invalid
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
      @user.age = ""
      @user.level = 0
      @user.sex = 1
      @user.save
    end

    it "ageが入力されていないので保存されない" do
      expect(@user).to be_invalid
    end
  end

  context "データが保存されない" do
    before do
      @user = User.new
      @user.name = ""
      @user.email = "a@a"
      @user.password = "111111"
      @user.height = "111"
      @user.weight = "11"
      @user.age = "11"
      @user.level = ""
      @user.sex = 1
      @user.save
    end

    it "levelが入力されていないので保存されない" do
      expect(@user).to be_invalid
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
      @user.sex = ""
      @user.save
    end

    it "ageが入力されていないので保存されない" do
      expect(@user).to be_invalid
    end
  end
end
