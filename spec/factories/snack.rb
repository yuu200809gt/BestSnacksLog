FactoryBot.define do
  factory :snack do
    name { Faker::Food.dish }
    best_alcohol { Faker::Lorem.sentence }
    food_types { Faker::Lorem.sentence }
    memo { Faker::Lorem.sentence }
    association :user
  end
end
