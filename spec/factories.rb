FactoryGirl.define do
  factory :company do
    email Faker::Internet.email
    name Faker::Company.name
  end

  factory :user do
    avatar 'http://www.example.com/missing.png'
    email Faker::Internet.email
    token SecureRandom.urlsafe_base64
    auth_token SecureRandom.urlsafe_base64
    association :company, :factory => :company
    password 'Password2012'
    password_confirmation 'Password2012'
  end
  
end