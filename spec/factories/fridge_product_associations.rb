# frozen_string_literal: true

FactoryBot.define do
  factory :fridge_product_association do
    association :fridge
    association :product
  end
end
