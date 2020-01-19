# frozen_string_literal: true

module Api
  class BaseController < ::ApplicationController
    include ::RenderStatuses

    skip_before_action :verify_authenticity_token
    before_action :check_user_access

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    attr_accessor :access_policy

    private

    def check_user_access
      render_forbidden && return unless current_access_policy.is_permitted?(params)
    end

    def current_access_policy
      self.access_policy ||= AccessPolicySwitch.new.access_for_user(current_user)
    end
  end
end
