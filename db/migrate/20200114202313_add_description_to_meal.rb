class AddDescriptionToMeal < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :description, :string
  end
end
