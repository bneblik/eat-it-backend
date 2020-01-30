# frozen_string_literal: true

class AddProductsToShoppingList
  def initialize(products, shopping_list_id, user_id)
    @products = products
    @shopping_list_id = shopping_list_id
    @user_id = user_id
  end

  def call
    delete_associations
    create_new_associations
  end

  private

  attr_reader :products, :shopping_list_id, :user_id

  def delete_associations
    ShoppingListProductAssociation.where(shopping_list_id: shopping_list_id).destroy_all
  end

  def create_new_associations
    products.map do |product|
      if product[:bought]
        fridge = Fridge.where(user_id: user_id).first
        fridge_product = FridgeProductAssociation.where(fridge_id: fridge.id, product_id: product[:id].to_i)&.first
        if fridge_product.present?
          new_amount = fridge_product.amount + product[:amount].to_i
          fridge_product.update!(amount: new_amount)
        else
          FridgeProductAssociation.create!(
            fridge_id: fridge.id,
            product_id: product[:id].to_i,
            amount: product[:amount].to_i
          )
        end
      else
        ShoppingListProductAssociation.create!(
          shopping_list_id: shopping_list_id,
          product_id: product[:id].to_i,
          amount: product[:amount].to_i
        )
      end
    end
  end
end
