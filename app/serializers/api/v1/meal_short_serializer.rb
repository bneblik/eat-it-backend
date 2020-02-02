# frozen_string_literal: true

module Api
  module V1
    class MealShortSerializer
      include FastJsonapi::ObjectSerializer
      set_type :meal
      set_id :id
      attributes :name, :time, :video, :calories,
                 :fats, :proteins, :carbs, :description, :video
      attribute :category do |object|
        object.meal_category&.name
      end
      attribute :category_id do |object|
        object.meal_category&.id
      end
      attribute :rate do |object|
        object.rate / 1000.0
      end
      attribute :your_meal do |object, params|
        object.user.id == params[:user_id]
      end
      attribute :image do |object|
        Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true) if object.image.attached?
      end
    end
  end
end
