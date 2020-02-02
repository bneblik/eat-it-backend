# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products request', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:products) { FactoryBot.create_list(:product, 3) }

  describe 'GET #index' do
    before do
      get url
    end

    subject { JSON.parse(response.body) }

    let(:url) { '/api/v1/products.json' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns 3 products' do
      expect(subject['data'].count).to eq(3)
    end
  end

  describe 'GET #show' do
    before do
      get url
    end

    subject { JSON.parse(response.body) }

    let(:url) { "/api/v1/products/#{products.first.id}.json" }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns requested product' do
      expect(subject['data']['id'].to_i).to eq(products.first.id)
    end
  end
end
