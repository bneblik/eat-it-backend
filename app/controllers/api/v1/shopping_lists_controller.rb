# frozen_string_literal: true

module Api
  module V1
    class ShoppingListsController < ::Api::BaseController
      before_action :validate_shopping_list_params, only: %i[create update]

      def index
        @shopping_list = current_user.shopping_list
        render json: Api::V1::ShoppingListSerializer.new(@shopping_list.shopping_list_products).serialized_json
      end

      def update
        @shopping_list = current_user.shopping_list
        validate_user_permission

        ::AddProductsToShoppingList.new(params[:products], @shopping_list.id, current_user.id).call
        render json: Api::V1::ShoppingListSerializer.new(@shopping_list.shopping_list_products).serialized_json
      end

      def create
        @shopping_list = current_user.shopping_list
        validate_user_permission

        ::AddProductsToShoppingList.new(params[:products], @shopping_list.id, current_user.id).call
        render json: Api::V1::ShoppingListSerializer.new(@shopping_list.shopping_list_products).serialized_json
      end

      private

      def validate_shopping_list_params
        validation = Api::V1::ShoppingListSchema.new.call(params)
        return if validation.success?

        render_unprocessable_entity(content: validation.messages(full: true))
      end

      def validate_user_permission
        return if @shopping_list.user.id == current_user.id

        render_unprocessable_entity(content: 'You have no permission to this comment.')
      end
    end
  end
end
