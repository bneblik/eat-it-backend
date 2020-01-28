# frozen_string_literal: true

class CreateMealProductAssociations
  def initialize(products, recipes, meal_id)
    @products = products
    @recipes = recipes
    @meal_id = meal_id
  end

  def call
    delete_associations
    create_new_associations
    update_meal_calories
    update_meal_recipe
  end

  private

  attr_reader :products, :meal_id, :recipes

  def delete_associations
    MealProductAssociation.where(meal_id: meal_id).destroy_all
  end

  def create_new_associations
    products.map do |product|
      MealProductAssociation.create!(
        meal_id: meal_id,
        product_id: product[:id].to_i,
        amount: product[:amount].to_i
      )
    end
  end

  def update_meal_calories
    ids = products.map { |product| product[:id] }
    products_object = Product.where(id: ids)
    calories = products_object.sum(:calories)
    fats = products_object.sum(:fats)
    proteins = products_object.sum(:proteins)
    carbs = products_object.sum(:carbs)

    meal = Meal.find(meal_id)
    meal.update!(
      calories: calories,
      fats: fats,
      proteins: proteins,
      carbs: carbs
    )
  end

  def update_meal_recipe
    Recipe.where(meal_id: meal_id).destroy_all
    recipes.map do |recipe|
      Recipe.create!(
        meal_id: meal_id,
        instruction: recipe[:instruction]
      )
    end
  end
end
