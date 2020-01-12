# frozen_string_literal: true

FactoryBot.define do
  factory :shopping_list_product_association do
    association :product
    association :shopping_list
  end
end
