# frozen_string_literal: true

class AddProductsToShoppingList
  def initialize(products, shopping_list_id)
    @products = products
    @shopping_list_id = shopping_list_id
  end

  def call
    delete_associations
    create_new_associations
  end

  private

  attr_reader :products, :shopping_list_id

  def delete_associations
    ShoppingListProductAssociation.where(shopping_list_id: shopping_list_id).destroy_all
  end

  def create_new_associations
    products.map do |product|
      ShoppingListProductAssociation.create!(
        shopping_list_id: shopping_list_id,
        product_id: product[:id],
        quantity: product[:quantity]
      )
    end
  end
end
