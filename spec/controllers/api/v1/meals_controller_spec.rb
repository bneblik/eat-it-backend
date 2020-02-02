# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Meals request', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:meals) { FactoryBot.create_list(:meal, 3, user: user) }
  let!(:meal_category) { FactoryBot.create(:meal_category) }
  let!(:url_1) { '/api/v1/meals.json' }

  describe 'GET #index' do
    before do
      get url
    end

    subject { JSON.parse(response.body) }

    let(:url) { '/api/v1/meals.json' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns 3 meals' do
      expect(subject['data'].count).to eq(3)
    end
  end

  describe 'GET #show' do
    before do
      get url
    end

    subject { JSON.parse(response.body) }

    let(:url) { "/api/v1/meals/#{meals.first.id}.json" }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns requested meal' do
      expect(subject['data']['id'].to_i).to eq(meals.first.id)
    end
  end

  describe 'POST #create' do
    subject do
      get url
      response
    end

    let(:url) { '/api/v1/meals.json' }

    context 'with valid data' do
      let(:params) do
        {
          name: 'Name',
          time: '60',
          servings: '2',
          meal_category_id: meal_category.id,
          products: '',
          recipes: "[{'instruction': 'krok 1'}"
        }
      end

      it 'returns http success' do
        expect(subject).to have_http_status(:success)
      end
    end
  end

  describe 'PUT #update' do
    subject do
      get url_1
      response
    end

    let(:url) { "/api/v1/meals/#{meals.first.id}.json" }
    let(:params) do
      {
        name: 'Name',
        time: '60',
        servings: '2',
        meal_category_id: meal_category.id,
        products: '',
        recipes: "[{'instruction': 'krok 1'}"
      }
    end

    it 'returns http success' do
      expect(subject).to have_http_status(:success)
    end

    it 'update existing meal' do
      expect(Meal.count).to eq(3)
    end
  end

  describe 'DELETE #destroy' do
    subject do
      delete url, headers: define_jwt_headers(user)
      response
    end

    let(:url) { "/api/v1/meals/#{meals.first.id}.json" }

    it 'delete meal' do
      expect { subject }.to change { Meal.count }.from(3).to(2)
    end
  end
end
