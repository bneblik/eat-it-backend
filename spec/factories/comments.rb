# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user
    title { Faker::Lorem.sentences }
    text { Faker::Lorem.paragraph(sentence_count: 5) }
  end
end
