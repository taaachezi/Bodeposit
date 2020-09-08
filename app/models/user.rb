class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_paranoid
  has_many :eats, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :materials, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :genres, dependent: :destroy
  enum level: {
  	多: 0,
  	普通: 1,
  	少: 2
  }

end
