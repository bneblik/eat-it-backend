class ChangeForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_reference :shopping_list_product_associations, :meal
    add_reference :shopping_list_product_associations, :shopping_list, index: true, foreign_key: true, null: false
  end
end
