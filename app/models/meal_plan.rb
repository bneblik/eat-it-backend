class MealPlan < ApplicationRecord
  belongs_to :meal
  belongs_to :user

  enum portion: { half: 1, normal: 2, double: 4 }
end
