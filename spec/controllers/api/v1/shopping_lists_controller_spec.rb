# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shopping list request', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:shopping_list) { FactoryBot.create(:shopping_list, user: user) }
  let!(:product) { FactoryBot.create(:product) }

  describe 'GET #index' do
    before do
      get url, headers: define_jwt_headers(user)
    end

    subject { JSON.parse(response.body) }

    let(:url) { '/api/v1/shopping_lists.json' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    subject do
      post url, params: params, headers: define_jwt_headers(user)
      response
    end

    let(:url) { '/api/v1/shopping_lists.json' }
    let(:params) do
      {
        products: [
          {
            id: product.id,
            amount: 100
          }
        ]
      }
    end

    it 'returns http success' do
      expect(subject).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    subject do
      put url, params: params, headers: define_jwt_headers(user)
      response
    end

    let(:url) { "/api/v1/shopping_lists/#{shopping_list.id}.json" }
    let(:params) do
      {
        products: [
          {
            id: product.id,
            amount: 100
          }
        ]
      }
    end
  end
end
