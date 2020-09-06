class Material < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_many :eats, dependent: :destroy
	has_many :recipe_materials, dependent: :destroy
end
