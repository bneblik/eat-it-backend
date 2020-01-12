# frozen_string_literal: true

FactoryBot.define do
  factory :meal do
    #association :user
    name { Faker::Food.dish }
    recipe { Faker::Food.description }
  end
end
