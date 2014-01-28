# This will guess the User class
FactoryGirl.define do
  factory :user do
    provider { 'github' }
    sequence(:uid)
    name { Faker::Lorem.name }
    email { Faker::Internet.email }
    encrypted_password { SecureRandom.urlsafe_base64(12) }
    sequence(:sign_in_count)
    nickname { Faker::Name.name.parameterize }

    trait :twitter do
      provider { 'twitter' }
    end

    trait :facebook do
      provider { 'facebook' }
    end
  end
end