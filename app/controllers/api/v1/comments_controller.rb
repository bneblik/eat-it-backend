# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ::Api::BaseController
      before_action :validate_comment_params, only: %i[create update]

      COMMENT_UPDATED = 'Comment was successfully updated'
      COMMENT_UPDATE_ERROR = 'Validation error'

      def update
        @comment = Comment.find(params[:id])
        validate_user_permission

        @comment.update!(
          rate: params[:rate],
          text: params[:text]
        )
      end

      def create
        @comment = Comment.create(
          rate: params[:rate],
          text: params[:text],
          meal_id: params[:meal_id],
          user_id: current_user.id
        )
        @comment.save!
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
        validation = Api::V1::CommentSchema.new.call(params)
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
