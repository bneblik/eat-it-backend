# frozen_string_literal: true

module RenderStatuses
  def render_success(description: nil, content: nil)
    render json: {}.merge(description: description, content: content).compact, status: :ok
  end

  def render_forbidden(description: 'Forbidden', redirect_to: nil)
    render json: {}.merge(description: description, redirect_to: redirect_to).compact, status: :forbidden
  end

  def render_not_found
    render json: { description: 'Not found' }, status: :not_found
  end

  def render_unprocessable_entity(description: 'Invalid input', content: nil)
    render json: {}.merge(description: description, content: content).compact, status: :unprocessable_entity
  end
end
