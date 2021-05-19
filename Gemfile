# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Environment
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'rack-cors'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Web framework
gem 'rails', '~> 5.2.3'
gem 'jbuilder', '~> 2.7'
gem 'activeadmin'
gem 'active_skin'
gem 'activeadmin-dry-validation'
gem 'turbolinks'
gem 'fast_jsonapi'
gem 'kaminari'

# Application
gem 'dry-validation', '~> 0.13.1'
gem 'dry-types'
gem 'dry-transaction'
gem 'dry-struct'
gem 'active_interaction', '~> 3.7'
gem 'google-cloud-storage', '~> 1.8'
gem 'rspec-rails'
gem 'rswag'

# Authentication
gem 'devise'
gem 'devise_invitable', '~> 2.0.0'
gem 'devise-jwt', '~> 0.5.9'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem 'faker'
  gem 'rubocop', require: false
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
