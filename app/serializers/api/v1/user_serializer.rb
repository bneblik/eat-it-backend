
# frozen_string_literal: true

module Api
  module V1
    class UserSerializer
      include FastJsonapi::ObjectSerializer
      set_type :user
      set_id :id
      attributes :name, :email
    end
  end
end
