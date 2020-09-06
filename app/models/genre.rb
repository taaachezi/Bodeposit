class Genre < ApplicationRecord
	belongs_to :user
	has_many :materials, dependent: :destroy
end
