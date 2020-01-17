# frozen_string_literal: true

require 'devise/jwt/test_helpers'

module JwtHeadersHelper
  def define_jwt_headers(user)
    Devise::JWT::TestHelpers.auth_headers({}, user)
  end
end

RSpec.configure do |config|
  config.include JwtHeadersHelper, type: :request
end
