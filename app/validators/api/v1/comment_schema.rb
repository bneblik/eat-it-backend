# frozen_string_literal: true

module Api
  module V1
    class CommentSchema < Api::V1::ApiSchema
      configure do
        config.type_specs = true
      end

      define! do
        required(:title, :string).filled
        required(:text, :text).filled
        required(:meal_id, :bigint).filled
      end
    end
  end
end
