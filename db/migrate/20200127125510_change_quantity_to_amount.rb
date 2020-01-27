class ChangeQuantityToAmount < ActiveRecord::Migration[5.2]
  def change
    rename_column :fridge_product_associations, :quantity, :amount
    rename_column :meal_product_associations, :quantity, :amount
    rename_column :shopping_list_product_associations, :quantity, :amount
  end
end
