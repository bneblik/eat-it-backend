class AddUserToMeal < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :user, foreign_key: true, null: false
  end
end
