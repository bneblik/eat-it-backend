# frozen_string_literal: true

module Api
  module V1
    class ShoppingListsController < ::Api::BaseController
      # before_action :validate_meal_params, only: %i[create update]

      def show
        @shopping_list = ShoppingList.find(params[:id])
        render json: Api::V1::ShoppingListSerializer.new(@shopping_list.shopping_list_products).serialized_json
      end

      def update
        @shopping_list = ShoppingList.find(params[:id])

        ::AddProductsToShoppingList.new(params[:products], @shopping_list.id).call
        render json: Api::V1::ShoppingListSerializer.new(@shopping_list.shopping_list_products).serialized_json
      end

      def create
        @shopping_list = ShoppingList.create(
          user_id: current_user.id
        )
        @shopping_list.save!

        ::AddProductsToShoppingList.new(params[:products], @shopping_list.id).call
        render json: Api::V1::ShoppingListSerializer.new(@shopping_list.shopping_list_products).serialized_json
      end

      def destroy
        @shopping_list = ShoppingList.find(params[:id])
        @meal.destroy!
      end

      private

      def validate_meal_params
        validation = Api::V1::ShoppingListSchema.new.call(params)
        return if validation.success?

        render_unprocessable_entity(content: validation.messages(full: true))
      end
    end
  end
end
