class ChangeMealNameTimeServingsRecipeCaloriesFatsProteinsCarbs < ActiveRecord::Migration[5.2]
  def change
    change_column_null :meals, :name,  false
    change_column_null :meals, :recipe,  false
    change_column_null :meals, :time, false
    change_column_null :meals, :servings,false

    change_column_default :meals, :calories, from: nil, to: 0
    change_column_default :meals, :fats,  from: nil, to: 0
    change_column_default :meals, :proteins, from: nil, to: 0
    change_column_default :meals, :carbs, from: nil, to: 0
  end
end
