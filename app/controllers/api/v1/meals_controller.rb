# frozen_string_literal: true

module Api
  module V1
    class MealsController < ::Api::BaseController
      def index
        @meals = Meal.all
      end
    end
  end
end
