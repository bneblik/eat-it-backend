# frozen_string_literal: true

module Api
  module V1
    class MealsController < ::Api::BaseController
      before_action :validate_meal_params, only: %i[create update]

      MEAL_UPDATED = 'Meal was successfully updated'
      MEAL_UPDATE_ERROR = 'Validation error'

      def index
        @meals = Meal.all
      end

      def show
        @meal = Meal.find(params[:id])
      end

      def update
        @meal = Meal.find(params[:id])
        @meal.update!(
          name: params[:name],
          recipe: params[:recipe]
        )
      end

      def create
        @meal = Meal.create(
          name: params[:name],
          recipe: params[:recipe]
        )
        @meal.save!
      end

      def destroy
        @meal = Meal.find(params[:id])
        @meal.destroy!
      end

      private

      def validate_meal_params
        validation = Api::V1::MealSchema.new.call(params)
        return if validation.success?

        render_unprocessable_entity(content: validation.messages(full: true))
      end
    end
  end
end
