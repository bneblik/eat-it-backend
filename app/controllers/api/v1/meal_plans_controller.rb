# frozen_string_literal: true

module Api
  module V1
    class MealPlansController < ::Api::BaseController
      # before_action :validate_meal_params, only: %i[create update]

      def index
        @meal_plans = MealPlan.where(user_id: current_user.id)
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

      def destroy
        @meal_plan = MealPlan.where(meal_id: params[:meal_id].to_i, date: params[:date])
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
