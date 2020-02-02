# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments request', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:meal) { FactoryBot.create(:meal, user: user) }
  let!(:comments) { FactoryBot.create_list(:comment, 3, meal: meal, user: user) }

  describe 'GET #index' do
    before do
      get url
    end

    subject { JSON.parse(response.body) }

    let(:url) { '/api/v1/comments.json' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    subject do
      post url, params: params, headers: define_jwt_headers(user)
      response
    end

    let(:url) { '/api/v1/comments.json' }

    context 'with valid data' do
      let(:params) do
        {
          rate: 5,
          text: 'Lorem',
          meal_id: meal.id,
          user_id: user.id
        }
      end

      it 'returns http success' do
        expect(subject).to have_http_status(:success)
      end

      it 'add comment' do
        expect { subject }.to change { Comment.count }.from(3).to(4)
      end
    end
  end

  describe 'PUT #update' do
    subject do
      put url, params: params, headers: define_jwt_headers(user)
      response
    end

    let(:url) { "/api/v1/comments/#{comments.first.id}.json" }
    let(:params) do
      {
        rate: 5,
        text: 'Lorem'
      }
    end

    it 'returns http success' do
      expect(subject).to have_http_status(:success)
    end

    it 'update existing comment' do
      expect(Comment.count).to eq(3)
    end
  end

  describe 'DELETE #destroy' do
    subject do
      delete url, headers: define_jwt_headers(user)
      response
    end

    let(:url) { "/api/v1/comments/#{comments.first.id}.json" }

    it 'delete comment' do
      expect { subject }.to change { Comment.count }.from(3).to(2)
    end
  end
end
