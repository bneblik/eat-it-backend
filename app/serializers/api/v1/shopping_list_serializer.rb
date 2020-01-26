# frozen_string_literal: true

module Api
  module V1
    class ShoppingListSerializer
      include FastJsonapi::ObjectSerializer
      set_type :shopping_list
      set_id :id
      attributes :quantity
      attribute :product_id do |object|
        object.product.id
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
