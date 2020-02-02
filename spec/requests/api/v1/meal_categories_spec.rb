# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/meal_categories', type: :request do
  path '/api/v1/meal_categories' do
    get 'List of meal categories' do
      tags 'Meal categories'
      consumes 'application/json'
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          page: { type: :integer }
        },
        required: []
      }

      response '200', 'list of products' do
        let(:meal_categories) { FactoryBot.create_list(:meal_category, 5) }
        run_test!
      end
    end
  end
end
