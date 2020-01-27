# frozen_string_literal: true

module Api
  module V1
    class MealSchema < Api::V1::ApiSchema
      configure do
        config.type_specs = true
      end

      define! do
        required(:name, :string).filled
        required(:recipe, :string).filled
        required(:time, :integer).filled
        required(:servings, :integer).filled
        required(:products).schema do
          required(:id, :integer).filled
          required(:amount, :integer).filled
        end
      end
    end
  end
end
