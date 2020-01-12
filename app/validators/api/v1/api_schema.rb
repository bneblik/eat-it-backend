# frozen_string_literal: true

require 'dry-validation'

module Api
  module V1
    class ApiSchema < Dry::Validation::Schema::Params
      configure do
        config.messages_file = 'config/errors.yml'
      end
    end
  end
end
