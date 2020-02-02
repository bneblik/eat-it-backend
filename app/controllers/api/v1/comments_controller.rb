# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ::Api::BaseController
      before_action :validate_comment_params, only: %i[create]
      before_action :validate_edit_comment_params, only: %i[update]

      def index
        @comments = Comment.where(meal_id: params[:meal_id]).order('created_at DESC').page params[:page]

        render json: Api::V1::CommentSerializer.new(@comments, params: { user_id: params[:user_id] || -1 }).serialized_json
      end

      def update
        @comment = Comment.find(params[:id])
        validate_user_permission

        @comment.update!(
          rate: params[:rate].to_i,
          text: params[:text]
        )

        ::MealRate.new(params[:rate].to_i * 1000, @comment.meal_id).call
        render json: Api::V1::CommentSerializer.new(@comment).serialized_json
      end

      def create
        @comment = Comment.create(
          rate: params[:rate].to_i,
          text: params[:text],
          meal_id: params[:meal_id],
          user_id: current_user.id
        )
        @comment.save!

        ::MealRate.new(params[:rate].to_i * 1000, @comment.meal_id).call
        render json: Api::V1::CommentSerializer.new(@comment).serialized_json
      end

      def destroy
        @comment = Comment.find(params[:id])
        validate_user_permission

        @comment.destroy!
      end

      private

      def validate_comment_params
        validation = Api::V1::CommentSchema.new.call(params)
        return if validation.success?

        render_unprocessable_entity(content: validation.messages(full: true))
      end

      def validate_edit_comment_params
        validation = Api::V1::EditCommentSchema.new.call(params)
        return if validation.success?

        render_unprocessable_entity(content: validation.messages(full: true))
      end

      def validate_user_permission
        return if @comment.user.id == current_user.id

        render_unprocessable_entity(content: 'You have no permission to this comment.')
      end
    end
  end
end
