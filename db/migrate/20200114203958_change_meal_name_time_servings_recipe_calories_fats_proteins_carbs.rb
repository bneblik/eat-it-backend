class ChangeMealNameTimeServingsRecipeCaloriesFatsProteinsCarbs < ActiveRecord::Migration[5.2]
  def change
    change_column :meals, :name, :string, null: false
    change_column :meals, :time, :integer, null: false
    change_column :meals, :servings, :integer, null: false
    change_column :meals, :recipe, :string, null: false
    change_column :meals, :calories, :integer, default: 0
    change_column :meals, :fats, :integer, default: 0
    change_column :meals, :proteins, :integer, default: 0
    change_column :meals, :carbs, :integer, default: 0
  end
end
