# frozen_string_literal: true

module Api
  module V1
    class RecipeSerializer
      include FastJsonapi::ObjectSerializer
      set_type :recipe
      set_id :id
      attributes :instruction
    end
  end
end

