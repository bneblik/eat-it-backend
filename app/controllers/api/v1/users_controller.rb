# frozen_string_literal: true

module Api
  module V1
    class UsersController < ::Api::BaseController
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
    end
  end
end
