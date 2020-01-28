# frozen_string_literal: true

class MealRate
  def initialize(rate, meal_id)
    @rate = rate
    @meal_id = meal_id
  end

  def call
    update_meal(calculate_rate)
  end

  private

  attr_reader :rate, :meal_id

  def calculate_rate
    meal = Meal.find(meal_id)
    (meal.rate * (meal.comments.count - 1) + rate)/(meal.comments.count)
  end

  def update_meal(rate)
    meal = Meal.find(meal_id)
    meal.update!(
      rate: rate
    )
  end
end
