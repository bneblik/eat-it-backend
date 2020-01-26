# frozen_string_literal: true

FactoryBot.define do
  factory :meal_product_association do
    association :meal
    association :product
    quantity { rand(30..90) }
  end
end
