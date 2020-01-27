# frozen_string_literal: true

module Api
  module V1
    class MealSerializer
      include FastJsonapi::ObjectSerializer
      set_type :meal
      set_id :id
      attributes :name, :recipe, :time, :video, :calories,
                 :fats, :proteins, :carbs, :description
      attribute :comments, &:comments
      attribute :category do |object|
        object.meal_category&.name
      end
      attribute :your_meal do |object, params|
        object.user.id == params[:user_id]
      end
      has_many :comments
      has_many :products
      has_many :meal_product_association
    end
  end
end
