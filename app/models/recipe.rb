class Recipe < ApplicationRecord
	belongs_to :user
	has_many :recipe_materials, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :reviews, dependent: :destroy
	attachment :image

	def is_favorite(user)
		favorites.where(user_id: user.id).exists?
	end
end
