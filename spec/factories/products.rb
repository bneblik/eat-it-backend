# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    association :product_category
    name { Faker::Food.vegetables }
    calories { Faker::Number.between(0, 500) }
  end
end
