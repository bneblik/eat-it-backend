# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  include RenderStatuses

  respond_to :json
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    build_resource(sign_up_params)

    resource.save

    if resource.errors.empty?
      ShoppingList.create(user_id: resource.id)
      Fridge.create(user_id: resource.id)
      render_success(description: 'User created successfully', content: { user: resource })
    else
      render_unprocessable_entity(content: resource.errors.messages)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
