class AddEatenToMealPlan < ActiveRecord::Migration[5.2]
  def change
    add_column :meal_plans, :eaten, :boolean, default: false
  end
end
