# frozen_string_literal: true

FactoryBot.define do
  factory :shopping_list do
    association :user
  end
end
