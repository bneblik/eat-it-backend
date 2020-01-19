# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require './lib/rack/admin_cookies'
require './lib/rack/admin_dispatch_flash'
require './lib/rack/admin_session_cookie_store'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EatIt
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.api_only = true

    config.eager_load_paths += %W[#{config.root}/lib]

    config.middleware.use Rack::MethodOverride
    config.middleware.use AdminCookies
    config.middleware.use AdminDispatchFlash
    config.middleware.use AdminSessionCookieStore
  end
end
