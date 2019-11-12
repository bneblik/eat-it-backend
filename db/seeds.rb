# frozen_string_literal: true

# Create Dishes
10.times do
  Meal.create(
    name: Faker::Food.dish,
    recipe: Faker::Food.description
  )
end

# Create Products
10.times do
  Product.create(
    name: Faker::Food.vegetables,
    calories: Faker::Number.between(0, 500)
  )
end
