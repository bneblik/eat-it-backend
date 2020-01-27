# frozen_string_literal: true

module Api
  module V1
    class MealCategoriesSerializer
      include FastJsonapi::ObjectSerializer
      set_type :meal_category
      set_id :id
      attributes :name
    end
  end
end
