# frozen_string_literal: true

module Api
  module V1
    class FridgeSerializer
      include FastJsonapi::ObjectSerializer
      set_type :fridge
      set_id :id
      attributes :amount
      attribute :product_id do |object|
        object.product.id
      end
      attribute :category_name do |object|
        object.product.product_category.name
      end
      attribute :category_id do |object|
        object.product.product_category.id
      end
      attribute :name do |object|
        object.product.name
      end
      attribute :calories do |object|
        object.product.calories
      end
      attribute :fats do |object|
        object.product.fats
      end
      attribute :carbs do |object|
        object.product.carbs
      end
      attribute :proteins do |object|
        object.product.proteins
      end
      attribute :unit do |object|
        object.product.unit
      end
    end
  end
end
