# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  include RenderStatuses

  respond_to :json
  skip_before_action :verify_authenticity_token
  skip_before_action :verify_signed_out_user, only: :destroy

  def create
    self.resource = warden.authenticate!(scope: :user, recall: "#{controller_path}#new")
    sign_in(resource_name, resource)
    @current_user = @user

    render 'api/v1/users/current_users/show.json'
  end
end
