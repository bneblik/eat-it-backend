# frozen_string_literal: true

module Api
  module V1
    class ProductSchema < Api::V1::ApiSchema
      configure do
        config.type_specs = true
      end

      define! do
        required(:name, :string).filled
        required(:calories, :integer).filled
      end
    end
  end
end
