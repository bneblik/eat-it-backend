# frozen_string_literal: true

FactoryBot.define do
  factory :product_category do
    name { 'bread' }
  end
  factory :product_category1, parent: :product_category do
    name { 'meat' }
  end
  factory :product_category2, parent: :product_category do
    name { 'fishes and seafood' }
  end
  factory :product_category3, parent: :product_category do
    name { 'dairy' }
  end
  factory :product_category4, parent: :product_category do
    name { 'candies' }
  end
  factory :product_category5, parent: :product_category do
    name { 'desserts' }
  end
  factory :product_category6, parent: :product_category do
    name { 'drinks' }
  end
  factory :product_category7, parent: :product_category do
    name { 'spices' }
  end
  factory :product_category8, parent: :product_category do
    name { 'vegetables' }
  end
  factory :product_category9, parent: :product_category do
    name { 'fruits' }
  end
  factory :product_category10, parent: :product_category do
    name { 'delicacies' }
  end
end
