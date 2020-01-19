# frozen_string_literal: true

class PolicyFinder
  DEFAULT_ACCESS_LEVEL = false

  def is_permitted?(params)
    access_level = controller_policy(params).dig(params[:action]) if controller_policy(params).present?
    return DEFAULT_ACCESS_LEVEL unless access_level

    access_level
  end

  private

  def controller_policy(params)
    @controller_policy ||= access[params[:controller]]
  end
end
