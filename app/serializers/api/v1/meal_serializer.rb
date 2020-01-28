# frozen_string_literal: true

module Api
  module V1
    class MealSerializer
      include FastJsonapi::ObjectSerializer
      set_type :meal
      set_id :id
      attributes :name, :time, :video, :calories,
                 :fats, :proteins, :carbs, :description, :video
      attribute :comments, &:comments
      attribute :recipes, &:recipes
      attribute :category do |object|
        object.meal_category&.name
      end
      attribute :rate do |object|
        object.rate / 1000.0
      end
      attribute :your_meal do |object, params|
        object.user.id == params[:user_id]
      end
      has_many :comments
      has_many :recipes
      has_many :products
      has_many :meal_product_association
    end
  end
end
