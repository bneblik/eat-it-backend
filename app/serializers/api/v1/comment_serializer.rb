# frozen_string_literal: true

module Api
  module V1
    class CommentSerializer
      include FastJsonapi::ObjectSerializer
      set_type :comment
      set_id :id
      attributes :title, :text
    end
  end
end
