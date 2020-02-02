# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  path '/api/v1/comments' do
    get 'List of comments' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          page: { type: :integer }
        },
        required: []
      }

      response '200', 'list of products' do
        let(:comments) { FactoryBot.create_list(:comment, 5) }
        run_test!
      end
    end
  end

  path '/api/v1/comments' do
    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string },
          rate: { type: :integer },
          meal_id: { type: :integer }
        },
        required: %w[text rate meal_id]
      }

      response '201', 'blog created' do
        let(:comment) { FactoryBot.create(:comment) }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { title: 'foo' } }
        run_test!
      end

      response '403', 'Forbidden' do
        let(:comment) { { title: 'foo' } }
        run_test!
      end
    end
  end
end
