# frozen_string_literal: true

module Api
  module V1
    class CommentSerializer
      include FastJsonapi::ObjectSerializer
      set_type :comment
      set_id :id
      attributes :text, :rate
      attribute :author do |object|
        object.user&.name || object.user&.email
      end
    end
  end
end
