# frozen_string_literal: true

module Api
  module V1
    class MealPlansSchema < Api::V1::ApiSchema
      configure do
        config.type_specs = true
      end

      define! do
        required(:date, :date).filled
        required(:portion, :string).filled
        required(:meal_id, :integer).filled
      end
    end
  end
end
