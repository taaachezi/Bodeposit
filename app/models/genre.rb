class Genre < ApplicationRecord
	belongs_to :user
	has_many :materials, dependent: :destroy
	validates :name, presence: true, uniqueness: true
end
