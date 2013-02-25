FactoryGirl.define do
  factory :company do
    email Faker::Internet.email
    name Faker::Company.name
  end

  factory :user do
    avatar { Rack::Test::UploadedFile.new( Rails.root.join("spec", "images", "user-avatar.png"), "image/png") }
    email Faker::Internet.email
    token SecureRandom.urlsafe_base64
    auth_token SecureRandom.urlsafe_base64
    association :company, :factory => :company
    password 'Password2012'
    password_confirmation 'Password2012'
  end

end