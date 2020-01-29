class CreateMealPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_plans do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.integer :portion, null: false

      t.timestamps
    end
  end
end
