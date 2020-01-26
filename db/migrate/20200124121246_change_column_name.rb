class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :unit, :text
    add_reference :comments, :meal, index: true, foreign_key: true, null: false
    add_column :products, :unit, :string, null: false, default: 'g'
    remove_column :meal_product_associations, :unit
    remove_column :shopping_list_product_associations, :unit
    remove_column :fridge_product_associations, :unit
  end
end
