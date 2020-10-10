class Material < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  has_many :eats, dependent: :destroy
  has_many :recipe_materials, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :fat
    validates :carbohydrate
    validates :protein
    validates :calorie
  end

  # カロリー計算
  def self.calorie_fit(fat, protein, carbohydrate)
    fat * 9 + protein * 4 + carbohydrate * 4
    end
end
