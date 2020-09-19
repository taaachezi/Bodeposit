class Eat < ApplicationRecord
	belongs_to :user
	belongs_to :material, optional: true
	belongs_to :recipe, optional: true
end
