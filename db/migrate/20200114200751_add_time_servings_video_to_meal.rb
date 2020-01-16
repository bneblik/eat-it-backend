class AddTimeServingsVideoToMeal < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :time, :integer
    add_column :meals, :servings, :integer
    add_column :meals, :video, :string
  end
end
