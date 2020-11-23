class Group < ApplicationRecord
	has_many :talks, dependent: :destroy
	has_many :user_groups, dependent: :destroy
end
