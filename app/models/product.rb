class Product < ActiveRecord::Base
	has_many :orders
	has_many :comment

	def average_rating
 		comment.average(:rating).to_f
	end
end
