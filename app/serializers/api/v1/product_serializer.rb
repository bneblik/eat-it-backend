# frozen_string_literal: true

module Api
  module V1
    class ProductSerializer
      include FastJsonapi::ObjectSerializer
      set_type :product
      set_id :id
      attributes :name, :calories, :fats, :carbs, :proteins, :unit
      attribute :category do |object|
        object.product_category&.name
      end
      attribute :category_id do |object|
        object.product_category&.name
      end
    end
  end
end
