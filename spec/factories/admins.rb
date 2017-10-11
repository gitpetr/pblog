FactoryGirl.define do
  sequence :email do |n|
    "admin#{n}@test.com"
  end

  sequence :username do |n|
    "user#{n}name"
  end

  factory :admin do
    username
    email
    password '12345678'
    password_confirmation '12345678'
  end
end
