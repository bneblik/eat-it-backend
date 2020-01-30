# frozen_string_literal: true

module Api
  module V1
    class FridgesController < ::Api::BaseController
      before_action :validate_fridge_params, only: %i[create update]

      def index
        @fridge = current_user.fridge
        render json: Api::V1::FridgeSerializer.new(@fridge.fridge_products).serialized_json
      end

      def update
        @fridge = current_user.fridge
        validate_user_permission

        ::AddProductsToFridge.new(params[:products], @fridge.id).call
        render json: Api::V1::FridgeSerializer.new(@fridge.fridge_products).serialized_json
      end

      def create
        @fridge = current_user.fridge
        validate_user_permission

        ::AddProductsToFridge.new(params[:products], @fridge.id).call
        render json: Api::V1::FridgeSerializer.new(@fridge.fridge_products).serialized_json
      end

      private

      def validate_fridge_params
        validation = Api::V1::FridgeSchema.new.call(params)
        return if validation.success?

        render_unprocessable_entity(content: validation.messages(full: true))
      end

      def validate_user_permission
        return if @fridge.user.id == current_user.id

        render_unprocessable_entity(content: 'You have no permission to this comment.')
      end
    end
  end
end
