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
        validate_user_permission

        @meal.update!(
          name: params[:name],
          recipe: params[:recipe],
          time: params[:time],
          servings: params[:servings]
        )
      end

      def create
        @meal = Meal.create(
          name: params[:name],
          recipe: params[:recipe],
          time: params[:time],
          servings: params[:servings],
          user_id: current_user.id
        )
        @meal.save!
      end

      def destroy
        @meal = Meal.find(params[:id])
        validate_user_permission

        @meal.destroy!
      end

      private

      def validate_meal_params
        validation = Api::V1::MealSchema.new.call(params)
        return if validation.success?

        render_unprocessable_entity(content: validation.messages(full: true))
      end

      def validate_user_permission
        return if @meal.user.id == current_user.id

        render_unprocessable_entity(content: 'You have no permission to this meal.')
      end
    end
  end
end
