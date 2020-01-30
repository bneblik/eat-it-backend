# frozen_string_literal: true

module Api
  module V1
    class UserSchema < Api::V1::ApiSchema
      configure do
        config.type_specs = true
      end

      define! do
        optional(:name, :string).filled
        optional(:height, :integer).filled
        optional(:weight, :integer).filled
        optional(:age, :integer).filled
        optional(:gender, :string).filled
      end
    end
  end
end
