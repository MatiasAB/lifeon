FactoryBot.define do
  factory :user do
    email {"test@user.com"}
    password {"password123"}
	password_confirmation {"password123"}
	username {"ExampleUser"}
  end
  
  factory :task do
    sequence(:id) { |number| number }
    sequence(:title) { |number| "task#{number}"}
    status {0}
	user
  end
end