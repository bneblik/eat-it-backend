# frozen_string_literal: true

module Api
  module V1
    class MealsController < ::Api::BaseController
      # before_action :validate_meal_params, only: %i[create update]

      MEAL_UPDATED = 'Meal was successfully updated'
      MEAL_UPDATE_ERROR = 'Validation error'

      def index
        @meals = Meal.all
        @meals = @meals.where('name like ?', "%#{params[:check]}%") unless params[:check].nil?
        @meals = @meals.where(meal_category_id: params[:meal_category_id].to_i) unless params[:meal_category_id].nil?
        @meals = @meals.where(user_id: params[:user_id].to_i) unless params[:my_meal].nil?
        @meals = @meals.page params[:page]

        render json: Api::V1::MealShortSerializer.new(
          @meals,
          params: { user_id: params[:user_id].to_i || -1 }
        ).serialized_json
      end

      def recommended_meals
        @meals = Meal.order('rate DESC').limit(5)
        render json: Api::V1::MealShortSerializer.new(
          @meals,
          params: { user_id: params[:user_id].to_i || -1 }
        ).serialized_json
      end

      def show
        @meal = Meal.find(params[:id])
        render json: Api::V1::MealSerializer.new(
          @meal,
          params: { user_id: current_user&.id || -1 },
          include: %i[meal_product_association]
        )
      end

      def update
        @meal = Meal.find(params[:id])
        validate_user_permission

        @meal.update!(
          name: params[:name],
          time: params[:time].to_i,
          servings: params[:servings].to_i,
          description: params[:description],
          image: params[:image],
          video: params[:video],
          meal_category_id: params[:meal_category_id].to_i
        )
        products = JSON.parse(params[:products], {:symbolize_names => true})
        recipes = JSON.parse(params[:recipes], {:symbolize_names => true})

        ::CreateMealProductAssociations.new(products, recipes, @meal.id).call
        render json: Api::V1::MealSerializer.new(
          @meal,
          params: { user_id: current_user&.id || -1 },
          include: %i[meal_product_association]
        ).serialized_json
      end

      def create
        @meal = Meal.create(
          name: params[:name],
          time: params[:time],
          servings: params[:servings],
          description: params[:description],
          image: params[:image],
          meal_category_id: params[:meal_category_id].to_i,
          video: params[:video],
          user_id: current_user.id
        )
        @meal.save!
        products = JSON.parse(params[:products], {:symbolize_names => true})
        recipes = JSON.parse(params[:recipes], {:symbolize_names => true})


        ::CreateMealProductAssociations.new(products, recipes, @meal.id).call
        render json: Api::V1::MealSerializer.new(
          @meal,
          params: { user_id: current_user&.id || -1 },
          include: %i[meal_product_association]
        ).serialized_json
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
