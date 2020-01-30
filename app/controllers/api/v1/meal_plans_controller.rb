# frozen_string_literal: true

module Api
  module V1
    class MealPlansController < ::Api::BaseController
      # before_action :validate_meal_params, only: %i[create update]

      NOT_ENOUGH_PRODUCTS_ERROR = 'You have not enough products in fridge'

      def index
        @meal_plans = MealPlan.where(date: params[:date])
        render json: Api::V1::MealPlansSerializer.new(@meal_plans).serialized_json
      end

      def update
        @meal_plan.find(params[:id])
        @meal_plan = MealPlan.update!(
          meal_id: params[:meal_id].to_i,
          portion: params[:portion],
          date: params[:date]
        )

        render json: Api::V1::MealPlansSerializer.new(@meal_plan).serialized_json
      end

      def create
        @meal_plan = MealPlan.create(
          meal_id: params[:meal_id].to_i,
          portion: params[:portion],
          date: params[:date],
          user_id: current_user.id
        )
        @meal_plan.save!

        render json: Api::V1::MealPlansSerializer.new(@meal_plan).serialized_json
      end

      def meal_eaten
        @meal_plan = MealPlan.where(meal_id: params[:meal_id].to_i, date: params[:date]).first
        response = PrepareMealFromFridge.new(@meal_plan, current_user.id).call
        if response.nil?
          render_unprocessable_entity(content: NOT_ENOUGH_PRODUCTS_ERROR)
        else
          @meal_plan.update!(eaten: true)
          render json: Api::V1::MealPlansSerializer.new(@meal_plan).serialized_json
        end
      end

      def destroy
        @meal_plan = MealPlan.where(meal_id: params[:meal_id].to_i, date: params[:date]).first
        @meal_plan.destroy!
      end

      private

      def validate_meal_params
        validation = Api::V1::FridgeSchema.new.call(params)
        return if validation.success?

        render_unprocessable_entity(content: validation.messages(full: true))
      end
    end
  end
end
