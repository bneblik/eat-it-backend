# frozen_string_literal: true

module Api
  module V1
    class ProductSerializer
      include FastJsonapi::ObjectSerializer
      set_type :product
      set_id :id
      attributes :name, :calories, :fats, :carbs, :proteins, :unit
    end
  end
end
