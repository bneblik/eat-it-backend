# frozen_string_literal: true

class JwtBlacklist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Blacklist
  JWT_TABLE_NAME = 'jwt_blacklist'

  self.table_name = JWT_TABLE_NAME

  scope :old_blacklisted_jwts, -> { where('exp < ?', Time.zone.yesterday) }
end
