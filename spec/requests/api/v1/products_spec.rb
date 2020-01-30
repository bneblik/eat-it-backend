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
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'product found' do
        schema type: :object,
               properties: {
                 data: {
                   id: { type: :integer },
                   type: { type: :string },
                   attributes: {
                     name: { type: :string },
                     calories: { type: :integer },
                     fats: { type: :integer },
                     carbs: { type: :integer },
                     proteins: { type: :integer },
                     unit: { type: :string },
                     category: { type: :string },
                     category_id: { type: :integer },
                     image: { type: :string }
                   },
                 },
               },
               required: [ 'id', 'type', 'attributes' ]

        let(:id) { FactoryBot.create(:product).id }
        run_test!
      end
    end
  end
end
