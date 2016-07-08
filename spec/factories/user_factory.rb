FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
		email 
	    password "qwerty"
	    first_name "John"
	    last_name "Smith"
    	admin false
	end

	factory :user1, class: User do,
		email 
		password "123123q"
		first_name "Jane"
		last_name "Doe"
		admin false

	factory :admin, class: User do
		email 
		password "qwerty1"
		first_name "Admin"
		last_name "True" 
		admin true 
	end

end