class Review < ApplicationRecord
	belongs_to :user
	belongs_to :recipe

	validates :rate, numericality: {
		less_than_or_equal_to: 5,
		greater_than_or_equal_to: 1
	}, presence: true

	validates :user_id, uniqueness: true
end
