# frozen_string_literal: true

class AddProductsToFridge
  def initialize(products, fridge_id)
    @products = products
    @fridge_id = fridge_id
  end

  def call
    create_new_associations
  end

  private

  attr_reader :products, :fridge_id

  def create_new_associations
    products.map do |product|
      product_in_fridge = FridgeProductAssociation.where(
        fridge_id: fridge_id,
        product_id: product[:id].to_i
      )&.first

      if product_in_fridge.present?
        product_in_fridge.update(
          amount: product_in_fridge.amount + product[:amount].to_i
        )
      else
        FridgeProductAssociation.create!(
          fridge_id: fridge_id,
          product_id: product[:id].to_i,
          amount: product[:amount].to_i
        )
      end
    end
  end
end
