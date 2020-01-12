class CreateShoppingListProductAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_list_product_associations do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.integer :quantity, null: false
      t.string :unit, null: false

      t.timestamps
    end
  end
end
