require 'rails_helper'

describe UsersController, :type => :controller do
	let(:user) {User.create!(first_name: "Jane", last_name: "Doe", email: "jane@test.com", password: "qwerty")}
	let(:user1) {User.create!(first_name: "John", last_name: "Doe", email: "john@test.com", password: "123123q")}
	
	describe "Get #show" do
		context "User is logged in" do
			before do
				sign_in user
				it "loads the correct user details" do
					get :show, id: user.id
					expect(response).to have_http_status(200)
					expect(assigns(:user)).to eq user
				end
			end

		end

		context "No user is logged in" do
			it "redirects to login" do
				get :show, id: user.id
				expect(response).to redirect_to(root_path) 
			end
		end

		context "Cannot access second user show page" do
			it "redirects to root" do
				get :show, id: user1.id
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)
			end
		end

	end
end