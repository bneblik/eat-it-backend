class ChangeProductDefaults < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :calories, :integer, default: 0
    change_column :products, :fats, :integer, default: 0
    change_column :products, :proteins, :integer, default: 0
    change_column :products, :carbs, :integer, default: 0
  end
end
