# frozen_string_literal: true

module Api
  module V1
    class CommentSerializer
      include FastJsonapi::ObjectSerializer
      set_type :comment
      set_id :id
      attributes :text
      attribute :rate do |object|
        object.rate / 1000.0
      end
    end
  end
end
