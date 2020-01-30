# frozen_string_literal: true

class PrepareMealFromFridge
  include ::RenderStatuses

  def initialize(meal_plan, user_id)
    @meal_plan = meal_plan
    @meal_portion = meal_plan.portion_before_type_cast
    @meal = @meal_plan.meal
    @fridge = Fridge.where(user_id: user_id).first
  end

  def call
    response = check_products_availability
    return nil unless response

    remove_products_from_fridge
  end

  private

  attr_reader :meal, :meal_portion, :fridge, :meal_plan

  def check_products_availability
    meal.products.each do |product|
      fridge_product = FridgeProductAssociation.where(fridge_id: fridge.id, product_id: product.id)&.first
      return false unless fridge_product.present?

      meal_product = MealProductAssociation.where(meal_id: meal.id, product_id: product.id).first
      product_amount = fridge_product.amount - meal_product.amount * meal_portion
      return false if product_amount.negative?

      return true
    end
  end

  def remove_products_from_fridge
    meal.products.each do |product|
      fridge_product = FridgeProductAssociation.where(fridge_id: fridge.id, product_id: product.id)&.first
      meal_product = MealProductAssociation.where(meal_id: meal.id, product_id: product.id).first
      product_amount = fridge_product.amount - meal_product.amount * meal_portion
      fridge_product.update!(amount: product_amount) if product_amount.positive?
      fridge_product.destroy if product_amount.zero?
    end
  end
end
