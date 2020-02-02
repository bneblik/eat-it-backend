# frozen_string_literal: true

module Api
  module V1
    class UserSerializer
      include FastJsonapi::ObjectSerializer
      set_type :user
      set_id :id
      attributes :id, :name, :email, :name, :weight, :height, :age, :gender
    end
  end
end
