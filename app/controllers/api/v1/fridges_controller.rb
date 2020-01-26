# frozen_string_literal: true

module Api
  module V1
    class FridgesController < ::Api::BaseController
      # before_action :validate_meal_params, only: %i[create update]

      def show
        @fridge = Fridge.find(params[:id])
        render json: Api::V1::FridgeSerializer.new(@fridge.fridge_products).serialized_json
      end

      def update
        @fridge = Fridge.find(params[:id])

        ::AddProductsToFridge.new(params[:products], @fridge.id).call
        render json: Api::V1::FridgeSerializer.new(@fridge.fridge_products).serialized_json
      end

      def create
        @fridge = Fridge.create(
          user_id: current_user.id
        )
        @fridge.save!

        ::AddProductsToFridge.new(params[:products], @fridge.id).call
        render json: Api::V1::FridgeSerializer.new(@fridge.fridge_products).serialized_json
      end

      def destroy
        @fridge = Fridge.find(params[:id])
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
