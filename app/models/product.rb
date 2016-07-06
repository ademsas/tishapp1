class Product < ActiveRecord::Base
	has_many :orders
	has_many :comment

	validates :name, presence: true

	def average_rating
 		comment.average(:rating).to_f
	end
end
