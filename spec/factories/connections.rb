# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :connection do
    user
    provider_cd { 0 }
    identity { Faker::Name.name.parameterize }
  end
end
