# frozen_string_literal: true

class AdminCookies
  def initialize(app)
    @app = app
  end

  def call(env)
    if !Rails.env.test? && env['REQUEST_PATH'].include?('admin')
      ActionDispatch::Cookies.new(@app).call(env)
    else
      @app.call(env)
    end
  end
end
