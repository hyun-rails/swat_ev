FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@swarthmore.edu"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :post do
  	department "Economics"
  	professor "Golub"
  	course "Econ 101"
    content "Lorem ipsum"
    user
  end
end