# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user
    association :meal
    title { Faker::Lorem.sentences }
    text { Faker::Lorem.paragraph }
  end
end
