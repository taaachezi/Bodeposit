class Recipe < ApplicationRecord
	belongs_to :user
	has_many :recipe_materials, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :eats, dependent: :destroy
	attachment :image

	with_options presence: true do
		validates :body
		validates :name
		validates :image
	end

	def has_favorite(user)
		favorites.where(user_id: user.id).exists?
	end
end
