# frozen_string_literal: true

class CreateMealProductAssociations
  def initialize(products, meal_id)
    @products = products
    @meal_id = meal_id
  end

  def call
    delete_associations
    create_new_associations
  end

  private

  attr_reader :products, :meal_id

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
end
