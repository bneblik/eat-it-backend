# frozen_string_literal: true

FactoryBot.define do
  factory :meal do
    # association :user
    name { Faker::Food.dish }
    recipe { Faker::Food.description }
    servings { rand(1..5) }
    time { rand(30..90) }
  end
end
