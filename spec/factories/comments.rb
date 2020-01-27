# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user
    association :meal
    rate { 5 }
    text { Faker::Lorem.paragraph }
  end
end
