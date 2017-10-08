FactoryGirl.define do
  factory :posts do
    title 'MyString'
    body 'MyText'
  end

  factory :invalid_post, class: Post do
    title ''
    body ''
  end

end
