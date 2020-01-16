class AddCaloriesFatsProteinsCarbsToMeal < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :calories, :integer
    add_column :meals, :fats, :integer
    add_column :meals, :proteins, :integer
    add_column :meals, :carbs, :integer
  end
end
