# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  include RenderStatuses

  respond_to :json
  skip_before_action :verify_authenticity_token
  skip_before_action :verify_signed_out_user, only: :destroy

  private

  def respond_with(user, _opts = {})
    @current_user = user

    render 'api/v1/users/current_users/show.json'
  end
end
