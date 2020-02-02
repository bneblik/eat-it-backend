# frozen_string_literal: true

FactoryBot.define do
  factory :meal do
    association :user
    association :meal_category
    name { Faker::Food.dish }
    servings { rand(1..5) }
    time { rand(30..90) }
  end
end
