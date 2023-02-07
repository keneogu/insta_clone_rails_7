class Post < ApplicationRecord
	validates :title, presence: true, length: { minimum: 5, maximum: 100}
	validates :keywords, presence: true, length: { minimum: 5, maximum: 100}
	validates :description, presence: true, length: { minimum: 5, maximum: 500}

	has_many_attached :images
	belongs_to :user
	has_many :comments
	has_many :likes
	before_create :randomize_id
	
end
