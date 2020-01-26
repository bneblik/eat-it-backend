class AddUserToMeal < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :user, index: true, foreign_key: true, null: false
  end
end
