FactoryBot.define do
  factory :meal_category do
    name { "breakfast" }
  end
  factory :meal_category1, parent: :meal_category do
    name { "lunch" }
  end
  factory :meal_category2, parent: :meal_category do
    name { "snack" }
  end
  factory :meal_category3, parent: :meal_category do
    name { "dinner" }
  end
  factory :meal_category4, parent: :meal_category do
    name { "supper" }
  end
end
