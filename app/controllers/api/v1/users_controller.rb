# frozen_string_literal: true

module Api
  module V1
    class UsersController < ::Api::BaseController
      before_action :validate_user_params, only: %i[update]

      def show
        render json: Api::V1::UserSerializer.new(current_user).serialized_json
      end

      def update
        current_user.update!(
          name: params[:name],
          height: params[:height].to_i,
          weight: params[:weight].to_i,
          age: params[:age].to_i,
          gender: params[:gender].to_i
        )

        render json: Api::V1::UserSerializer.new(current_user).serialized_json
      end

      def destroy
        current_user.destroy!
      end

      private

      def validate_user_params
        validation = Api::V1::UserSchema.new.call(params)
        return if validation.success?

        render_unprocessable_entity(content: validation.messages(full: true))
      end
    end
  end
end
