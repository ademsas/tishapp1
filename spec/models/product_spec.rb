require 'rails_helper'

describe Product  do
	context "when the product has comments" do
		before do
  			@product = Product.create!(name: "Golf Driver")
  			@user = User.create(first_name: "Jane", last_name: "Test", email: "test1@test.com", password: "test1234")
			@product.comment.create!(rating: 1, user: @user, body: "I hate this driver!")
			@product.comment.create!(rating: 3, user: @user, body: "This is a great driver!")
			@product.comment.create!(rating: 5, user: @user, body: "This product is fantastic")
		end

		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end

		it "returns not valid product" do
			expect(Product.new(description: "Really comfortable shoes!")).not_to be_valid
		end

	end 
	
end
