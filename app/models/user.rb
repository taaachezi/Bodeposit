class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i(google_oauth2)

  after_create :send_mail_create
  def send_mail_create
    NotificationMailer.send_mail(self).deliver_now
  end

  acts_as_paranoid

  has_many :eats, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :materials, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :favorite_recipes, through: :favorites, source: :recipe
  has_many :messages, dependent: :destroy
  has_many :chat_users, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :email
    validates :height
    validates :weight
    validates :age
  end

  enum level: {
    多: 0,
    普通: 1,
    少: 2,
  }

  enum sex: {
    true: 0,
    false: 1,
  }

  # sns認証　クラスメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end

  # 消費カロリー計算
  def self.intake_nutorition(height, weight, sex, age, level)
    # 基礎代謝kcal
    if sex == "true"
      metabolism = ((0.0481 * weight) + (0.0234 * height) - (0.0138 * age) - 0.4235) * 1000 / 4.186
    elsif sex == "false"
      metabolism = ((0.0481 * weight) + (0.0234 * height) - (0.0138 * age) - 0.9708) * 1000 / 4.186
    end
    # 消費カロリkcal
    case level
    when "多"
      intake_nutorition = metabolism.to_i * 1.81
    when "普通"
      intake_nutorition = metabolism.to_i * 1.63
    when "少"
      intake_nutorition = metabolism.to_i * 1.28
    end

    intake_nutorition
  end

  # 摂取たんぱく質計算(g)
  def self.intake_protein(weight)
    weight * 2.5.to_f
  end

  # 摂取脂質計算(g)
  def self.intake_fat(weight)
    weight * 0.9.to_f
  end

  # 摂取炭水化物(g)
  def self.intake_carbo(protein, fat, calorie)
    (calorie - (fat * 9 + protein * 4)) / 4
  end
end
