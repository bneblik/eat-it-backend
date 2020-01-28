# frozen_string_literal: true

module Admin
  class SessionsController < ActiveAdmin::Devise::SessionsController
    skip_before_action :verify_authenticity_token

    def create
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      admin_user_session[:admin_user] = resource.id
      redirect_to admin_root_path
    end

    def destroy
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      set_flash_message! :notice, :signed_out if signed_out
      redirect_to new_admin_user_session_path
    end
  end
end
