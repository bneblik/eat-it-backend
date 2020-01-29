# frozen_string_literal: true

module Api
  module V1
    class ProductSerializer
      include Rails.application.routes.url_helpers
      include FastJsonapi::ObjectSerializer
      set_type :product
      set_id :id
      attributes :name, :calories, :fats, :carbs, :proteins, :unit
      attribute :category do |object|
        object.product_category&.name
      end
      attribute :category_id do |object|
        object.product_category&.id
      end
      attribute :image do |object|
        Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true) if object.image.attached?
      end
    end
  end
end
