FactoryGirl.define do
  factory :user do
    username
    email
    password '12345678'
    password_confirmation '12345678'
  end
end
