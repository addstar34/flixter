FactoryGirl.define do  factory :enrollment do
    
  end

	factory :user do
		sequence(:email){ |n| "person#{n}@example.com" }
		password "roflcopta!"
	end

	factory :course do
		title "Course 1"
		description "Description of Course 1. This is an awesome course!"
		cost "99.98"
		association :user
	end

	factory :section do
		title "Week 1"
		association :course
	end

	factory :lesson do
		title "Lesson 1"
		subtitle "Lesson 1 instructions go here!"
		association :section
	end
end