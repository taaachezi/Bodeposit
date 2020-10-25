class Eat < ApplicationRecord
  belongs_to :user
  belongs_to :material, optional: true
  belongs_to :recipe, optional: true

  with_options presence: true do
    validates :fat
    validates :carbohydrate
    validates :protein
    validates :calorie
  end
end
