# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    association :meal
    instruction { Faker::Lorem.paragraph }
  end
end
