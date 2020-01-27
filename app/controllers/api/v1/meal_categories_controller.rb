# frozen_string_literal: true

module Api
  module V1
    class MealCategoriesController < ::Api::BaseController
      def index
        @categories = MealCategory.all.page params[:page]
        render json: Api::V1::MealCategoriesSerializer.new(@categories).serialized_json
      end
    end
  end
end
