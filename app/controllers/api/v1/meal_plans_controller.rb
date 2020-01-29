# frozen_string_literal: true

module Api
  module V1
    class MealPlansController < ::Api::BaseController
      # before_action :validate_meal_params, only: %i[create update]

      def index
        @fridge = current_user.fridge
        render json: Api::V1::FridgeSerializer.new(@fridge.fridge_products).serialized_json
      end

      def update
        @fridge = current_user.fridge

        ::AddProductsToFridge.new(params[:products], @fridge.id).call
        render json: Api::V1::FridgeSerializer.new(@fridge.fridge_products).serialized_json
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
        @fridge = current_user.fridge
        @meal.destroy!
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
