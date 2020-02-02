# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/products', type: :request do
  path '/api/v1/products' do
    get 'List of products' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          page: { type: :integer }
        },
        required: []
      }

      response '200', 'list of products' do
        let(:products) { FactoryBot.create_list(:product, 5) }
        run_test!
      end
    end
  end

  path '/api/v1/products/{id}' do
    get 'Show a products' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer }
        },
        required: []
      }

      response '200', 'product found' do
        let(:product) { FactoryBot.create(:product) }
        run_test!
      end

      response '404', 'product not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
