FactoryBot.define do
  factory :vendor do
    title { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    online { true }
  end
end

