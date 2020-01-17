class ChangeProductDefaults < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :calories, from: nil, to: 0
    change_column_default :products, :fats, from: nil, to: 0
    change_column_default :products, :proteins, from: nil, to: 0
    change_column_default :products, :carbs, from: nil, to: 0
  end
end
