FactoryGirl.define do

  factory :user do
    username { Faker::Name.name }
    password 'password'
    password_confirmation 'password'
  end

  factory :contact do
    user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::Number.number(10) }
    linked_in { Faker::Name.first_name }
    twitter { Faker::Name.first_name }
    other { Faker::Name.first_name }
  end
end
