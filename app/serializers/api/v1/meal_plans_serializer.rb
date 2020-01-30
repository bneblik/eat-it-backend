# frozen_string_literal: true

module Api
  module V1
    class MealPlansSerializer
      include FastJsonapi::ObjectSerializer
      set_type :meal_plan
      set_id :id
      attributes :date, :portion, :meal_id, :user_id
      attribute :name do |object|
        object.meal.name
      end
      attribute :category_id do |object|
        object.meal.meal_category.id
      end
      attribute :category_name do |object|
        object.meal.meal_category.name
      end
      attribute :calories do |object|
        object.meal.calories
      end
      attribute :fats do |object|
        object.meal.fats
      end
      attribute :carbs do |object|
        object.meal.carbs
      end
      attribute :proteins do |object|
        object.meal.proteins
      end
      attribute :rate do |object|
        object.meal.rate
      end
      attribute :prepareTime do |object|
        object.meal.time
      end
      attribute :description do |object|
        object.meal.description
      end
      attribute :image do |object|
        Rails.application.routes.url_helpers.rails_blob_path(object.meal.image, only_path: true) if object.meal.image.attached?
      end

      belongs_to :meal
    end
  end
end
