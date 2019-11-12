# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Environment
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Web framework
gem 'rails', '~> 5.2.3'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'bootsnap', '>= 1.1.0', require: false
  gem 'pry'
  gem 'rspec-rails'
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