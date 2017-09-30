FactoryGirl.define do
  sequence :email do |n|
    "admin#{n}@test.com"
  end

  factory :admin do
    email
    password '12345678'
    password_confirmation '12345678'
  end
end
