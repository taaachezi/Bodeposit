class RecipeMaterial < ApplicationRecord
	belongs_to :material
	belongs_to :recipe
	validates :quantity, presence: true
end
