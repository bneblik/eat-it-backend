class AddRateToMeal < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :rate, :integer, default: 0
  end
end
