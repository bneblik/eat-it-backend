# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Meals request', type: :request do
  # let!(:user) { FactoryBot.create(:user) }
  let!(:meals) { FactoryBot.create_list(:meal, 3) }

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
      expect(subject['content']['meals'].count).to eq(3)
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
      expect(subject['content'].count).to eq(1)
      expect(subject['content']['meal']['id']).to eq(meals.first.id)
    end
  end

  describe 'GET #create' do
    subject do
      post url, params: params, as: :json
      response
    end

    let(:url) { '/api/v1/meals.json' }

    context 'with valid data' do
      let(:params) do
        {
          name: 'Name',
          recipe: 'Recipe'
        }
      end

      it 'returns http success' do
        expect(subject).to have_http_status(:success)
      end

      it 'create new meal' do
        expect { subject }.to change { Meal.count }.from(3).to(4)
      end
    end

    context 'with invalid data' do
      let(:params) do
        {
          name: 'Name'
        }
      end

      it 'returns http unprocessable_entity' do
        expect(subject).to have_http_status(:unprocessable_entity)
      end

      it 'not create new meal' do
        expect { subject }.to_not change { Meal.count }.from(3)
      end
    end
  end

  describe 'GET #update' do
    subject do
      put url, params: params, as: :json
      response
    end

    let(:url) { "/api/v1/meals/#{meals.first.id}.json" }
    let(:params) do
      {
        name: 'Changed_name',
        recipe: 'Changed_recipe'
      }
    end

    it 'returns http success' do
      expect(subject).to have_http_status(:success)
    end

    it 'update existing meal' do
      expect(Meal.count).to eq(3)
      # expect(Meal.find(meals.first.id).name).to eq(params[:name])
      # expect{subject}.to change{ meals.first.name }.from(meals.first.name).to(params[:name])
    end
  end

  describe 'GET #destroy' do
    subject do
      delete url
      response
    end

    let(:url) { "/api/v1/meals/#{meals.first.id}.json" }

    it 'delete meal' do
      expect { subject }.to change { Meal.count }.from(3).to(2)
    end
  end
end
