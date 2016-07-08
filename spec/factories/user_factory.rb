FactoryGirl.define do     
	sequence(:email) { |n| "user#{n}@example1.com" }

	factory :user do
		email 
	    password "qwerty1"
	    first_name "John"
	    last_name "Smith"
    	admin false
	end

	factory :admin, class: User do
		email 
		password "qwerty1"
		first_name "Admin"
		last_name "True" 
		admin true 
	end

end