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

    render json: Api::V1::UserSerializer.new(@current_user).serialized_json
  rescue StandardError => e
    e.backtrace.each do |l|
      Rails.logger.error(l)
    end
  end
end
