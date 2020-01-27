# frozen_string_literal: true

module Api
  module V1
    class CommentSchema < Api::V1::ApiSchema
      configure do
        config.type_specs = true
      end

      define! do
        required(:rate, :integer).filled
        required(:text, :string).filled
        required(:meal_id, :integer).filled
      end
    end
  end
end
