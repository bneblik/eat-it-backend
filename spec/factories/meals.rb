# frozen_string_literal: true

FactoryBot.define do
  factory :meal do
    name { Faker::Food.dish }
    recipe { Faker::Food.description }
  end
end
