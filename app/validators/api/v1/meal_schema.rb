# frozen_string_literal: true

module Api
  module V1
    class MealSchema < Api::V1::ApiSchema
      configure do
        config.type_specs = true
      end

      define! do
        required(:name, :string).filled
        required(:time, :integer).filled
        required(:servings, :integer).filled
        required(:meal_category_id, :integer).filled
        optional(:video, :string).filled
        optional(:image, :string).filled
        required(:products).maybe do
          each do
            required(:id, :integer).filled
            required(:amount, :integer).filled
          end
        end
        required(:recipes).maybe do
          each do
            required(:instruction, :string).filled
          end
        end
      end
    end
  end
end
