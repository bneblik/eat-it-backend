# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Food.vegetables }
    recipe { Faker::Number.between(0, 500) }
  end
end


