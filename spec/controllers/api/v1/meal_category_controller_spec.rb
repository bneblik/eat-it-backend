# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Meal category request', type: :request do
  let!(:meal_categories) { FactoryBot.create_list(:meal_category, 3) }

  describe 'GET #index' do
    before do
      get url
    end

    subject { JSON.parse(response.body) }

    let(:url) { '/api/v1/meal_categories.json' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns 3 meal categories' do
      expect(subject['data'].count).to eq(3)
    end
  end
end
