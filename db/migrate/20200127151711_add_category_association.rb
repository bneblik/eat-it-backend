class AddCategoryAssociation < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :meal_category, index: true, foreign_key: true
    add_reference :products, :product_category, index: true, foreign_key: true
  end
end
