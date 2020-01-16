class AddFatsCarbsProteinsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :fats, :integer
    add_column :products, :carbs, :integer
    add_column :products, :proteins, :integer
  end
end
