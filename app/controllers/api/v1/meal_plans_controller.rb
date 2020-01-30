# frozen_string_literal: true

module Api
  module V1
    class MealPlansController < ::Api::BaseController
      # before_action :validate_meal_params, only: %i[create update]

      NOT_ENOUGH_PRODUCTS_ERROR = 'You have not enough products in fridge'
      USER_PREFERENCES_WARNING = 'You need to provide more data about yourself'

      def index
        @meal_plans = MealPlan.where(date: params[:date], user_id: current_user.id)
        render json: Api::V1::MealPlansSerializer.new(@meal_plans).serialized_json
      end

      def update
        @meal_plan = MealPlan.where(meal_id: params[:meal_id].to_i, date: params[:date], user_id: current_user.id).first
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

      def day_statistic
        if current_user.height.nil? || current_user.weight.nil? || current_user.age.nil? || current_user.gender.nil?
          render_success(content: USER_PREFERENCES_WARNING)
        else
          meal_stats = calculate_meal_stats
          bmr = calculate_user_bmr
          render_success(content: {
                           calories: meal_stats[:calories] - bmr,
                           fats: meal_stats[:fats] - bmr * 0.30,
                           proteins: meal_stats[:proteins] - bmr * 0.25,
                           carbs: meal_stats[:carbs] - bmr * 0.55
                         })
        end
      end

      def meal_eaten
        @meal_plan = MealPlan.where(meal_id: params[:meal_id].to_i, date: params[:date], user_id: current_user.id).first
        response = PrepareMealFromFridge.new(@meal_plan, current_user.id).call
        if response.nil?
          render_unprocessable_entity(content: NOT_ENOUGH_PRODUCTS_ERROR)
        else
          @meal_plan.update!(eaten: true)
          render json: Api::V1::MealPlansSerializer.new(@meal_plan).serialized_json
        end
      end

      def destroy
        @meal_plan = MealPlan.where(meal_id: params[:meal_id].to_i, date: params[:date], user_id: current_user.id).first
        @meal_plan.destroy!
      end

      private

      def calculate_meal_stats
        {
          calories: @meals&.inject(0) { |sum, x| sum + x.calories } || 0,
          fats: @meals&.inject(0) { |sum, x| sum + x.fats } || 0,
          proteins: @meals&.inject(0) { |sum, x| sum + x.proteins } || 0,
          carbs: @meals&.inject(0) { |sum, x| sum + x.carbs } || 0
        }
      end

      def calculate_user_bmr
        if current_user.gender == 'man'
          9.99 * current_user.weight + 6.25 * current_user.height - 4.92 * current_user.age + 5
        else
          9.99 * current_user.weight + 6.25 * current_user.height - 4.92 * current_user.age - 161
        end
      end

      def validate_meal_params
        validation = Api::V1::FridgeSchema.new.call(params)
        return if validation.success?

        render_unprocessable_entity(content: validation.messages(full: true))
      end
    end
  end
end
