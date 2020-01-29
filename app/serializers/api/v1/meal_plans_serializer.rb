# frozen_string_literal: true

module Api
  module V1
    class MealPlansSerializer
      include FastJsonapi::ObjectSerializer
      set_type :meal_plan
      set_id :id
      attributes :date, :portion, :meal_id, :user_id
    end
  end
end

