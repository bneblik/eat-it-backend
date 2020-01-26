# frozen_string_literal: true

class AddProductsToFridge
  def initialize(products, fridge_id)
    @products = products
    @fridge_id = fridge_id
  end

  def call
    delete_associations
    create_new_associations
  end

  private

  attr_reader :products, :fridge_id

  def delete_associations
    FridgeProductAssociation.where(fridge_id: fridge_id).destroy_all
  end

  def create_new_associations
    products.map do |product|
      FridgeProductAssociation.create!(
        fridge_id: fridge_id,
        product_id: product[:id],
        quantity: product[:quantity]
      )
    end
  end
end
