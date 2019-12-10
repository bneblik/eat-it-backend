# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Food.vegetables }
    calories { Faker::Number.between(0, 500) }
  end
end
